# 설계 제안서 (v2)

## 1. 목표, 범위, 비범위
본 워크샵은 "배포된 리소스 존재"가 아니라 "데이터가 생성되고 Workbook에서 해석되는 경험"을 완료 조건으로 둔다.

### 포함
- Hub/Spoke 네트워크와 Firewall 경유 트래픽 관측
- VPN 관측 패널 제작(기본: 합성 모드, 옵션: 실제 S2S)
- Azure Workbooks 다중 시각화 및 Drilldown

### 제외
- SOC 운영 자동화/알람 룰 전체 설계
- IaC 심화(이번 버전은 Portal 절차 우선)
- 장애복구(DR) 시나리오

## 2. 최소 아키텍처 및 실제 데이터 경로
| 구성 | 목적 | 데이터 경로 |
|---|---|---|
| Hub VNet (10.10.0.0/16) | Firewall/VPN/Hub VM 배치 | VM 트래픽이 Firewall 거쳐 로그 생성 |
| Spoke VNet (10.20.0.0/16) | 실습 클라이언트 VM 배치 | Spoke VM이 트래픽 생성 주체 |
| UDR | Firewall 경유 강제 | VNet 트래픽이 우회 없이 로그화 |
| Azure Firewall + Policy | Allow/Deny 이벤트 생성 | AzureDiagnostics 수집 |
| VPN Gateway + LNG | VPN 관측 패널 구성 | AzureDiagnostics + AzureMetrics |
| Log Analytics | 수집 저장소 | Workbook 쿼리 단일 소스 |

## 3. 리소스 입력값 표준
| 항목 | 값(예시) |
|---|---|
| Region | koreacentral |
| Resource Group | rg-wb-netmon-`<pXX>` |
| Hub VNet | vnet-hub-`<pXX>` (10.10.0.0/16) |
| Hub 서브넷 | AzureFirewallSubnet 10.10.0.0/24, GatewaySubnet 10.10.1.0/27, snet-hub-vm 10.10.2.0/24 |
| Spoke VNet | vnet-spoke-`<pXX>` (10.20.0.0/16), snet-spoke-vm 10.20.1.0/24 |
| Firewall | afw-`<pXX>` |
| VPN Gateway | vpngw-`<pXX>` |
| Log Analytics | law-wb-netmon-`<pXX>` |
| Workbook | wb-netmon-`<pXX>` |

## 4. 시간 설계(현실 반영)
| 구간 | 시간 | 설명 |
|---|---:|---|
| 구조/입력 브리핑 | 15분 | 참가자별 값 확정 |
| Portal 배포 | 40분 | VPN Gateway/FW 생성 대기 포함 |
| 진단/트래픽 생성 | 20분 | 로그 유입 대기 5~10분 포함 |
| Workbook 제작 | 30분 | 핵심 시각화 6종 |
| 분석/정리 | 15분 | 시나리오 해석 + 삭제 안내 |

## 5. 비용 및 리스크
- 비용 상위: Azure Firewall, VPN Gateway, VM
- 리스크
  1. Gateway 배포 지연
  2. 로그 유입 지연
  3. UDR 누락으로 Firewall 로그 미발생
- 대응
  1. 대기 구간 동안 Workbook 골격 선구성
  2. 필수 확인 쿼리 제공
  3. UDR/Peering/NSG 체크리스트 제공

## 6. 구현 산출물 계약
1. 참가자 가이드(Portal 경로/입력값/정상 결과/오류 분기)
2. Workbook 제작 자산(쿼리 + 필드 매핑 + 시각화 지침)
3. 트래픽 생성 스크립트
4. 종료 절차 및 잔여 비용 경고
