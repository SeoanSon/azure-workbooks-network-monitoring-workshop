# 설계 제안서 (v1)

## 1. 목표와 범위
이 워크샵은 참가자가 Azure Portal에서 직접 배포한 네트워크 환경을 기반으로, Azure Workbooks에서 VPN·VNet 간 트래픽·Azure Firewall 로그를 다중 시각화로 분석하도록 설계한다.

### 포함 범위
- VPN 연결 상태와 처리량/이벤트 관찰
- Hub-Spoke VNet 간 트래픽 관찰
- Azure Firewall 허용·차단 로그 분석
- Workbook 파라미터/필터/드릴다운 구성

### 제외 범위
- IaC 자동화 심화
- SIEM/SOC 운영 프로세스 전체
- 멀티 리전 DR 자동 복구 설계

## 2. 참가자 행동 기반 학습 성과
| 학습 목표 | 참가자 행동 | 관찰 증거 | 완료 기준 |
|---|---|---|---|
| 환경 배포 이해 | Portal에서 리소스 생성 | 리소스 그룹 내 핵심 리소스 생성 완료 | Hub/Spoke/Firewall/VPN/LAW 존재 |
| 트래픽 이해 | VM 간 트래픽 발생 | Flow/Firewall 로그 증가 | Workbook에서 흐름 확인 |
| 보안 관찰 | Deny 이벤트 유도 | Deny 로그가 시계열·표로 표시 | 원인(규칙/대상/포트) 설명 가능 |
| 운영 시각화 | 다중 차트 구성 | KPI+Flow+Heatmap+Grid+Donut | Drilldown 포함 대시보드 완성 |

## 3. 최소 아키텍처
- Resource Group: 1
- VNet Hub/Spoke: 각 1
- VPN Gateway: 1
- Local Network Gateway: 1
- Azure Firewall + Policy: 1
- Test VM: 2
- Log Analytics Workspace: 1
- Workbook: 1

## 4. 시간 설계 (120분)
1. 오리엔테이션 (10분)
2. Lab 1 배포 (30분)
3. Lab 2 데이터 생성 (20분)
4. Lab 3 Workbook 제작 (35분)
5. Lab 4 분석 및 발표 (15분)
6. 정리 (10분)

## 5. 역할 경계
- 참가자: 배포, 진단 설정, Workbook 제작, 시나리오 분석
- 강사: 단계 안내, 기준값 제공, 오류 분기 대응, 검증 체크

## 6. 리스크 및 대응
- 배포 지연: 사전 권한/할당량 체크리스트 제공
- 로그 지연: 대기 구간 명시(5~10분), 대체 확인 쿼리 제공
- 비용 증가: 시간 제한, 종료 시 즉시 삭제 절차 고정

