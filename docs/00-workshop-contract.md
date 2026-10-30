# 워크샵 실행 계약 (Execution Contract)

## 1. 고정 요구사항
- 주제: Azure Workbooks 기반 VPN, VNet 간 트래픽, Azure Firewall 모니터링
- 시간: 라이브 2시간
- 방식: Azure Portal 중심, 참가자 직접 배포
- 목표: 단순 메트릭 차트가 아닌 다양한 시각화 포함

## 2. 목표-행동-데이터-화면-증거 연결
| 학습 목표 | 참가자 행동 | 생성 데이터 | 조회/스키마 | Workbook 화면 | 합격 증거 |
|---|---|---|---|---|---|
| 네트워크 관측 환경 구축 | Hub/Spoke/Firewall/VPN/LAW를 Portal에서 생성 | Resource logs, Metrics | AzureDiagnostics, AzureMetrics | Overview KPI | 모든 핵심 리소스 Succeeded |
| VNet 간 트래픽 해석 | Spoke VM에서 Hub VM 및 외부 대상 트래픽 생성 | Firewall Network/Application Rule 로그 | AzureDiagnostics (Firewall categories) | Time series, Top flows, Drilldown table | 소스/목적지/액션을 차트와 상세 로그로 동시 확인 |
| Firewall 보안 분석 | Deny 규칙 적용 후 트래픽 재시도 | Deny 이벤트 | AzureDiagnostics | Heatmap, Deny ratio, Rule hit table | Deny 급증 구간 및 원인 규칙 설명 |
| VPN 모니터링 이해 | Gateway/Connection 관측(기본: 합성, 옵션: 실제 S2S) | Gateway diagnostic events, metrics | AzureDiagnostics (VPN categories), AzureMetrics | VPN health panel | 상태/이벤트/지표를 1개 화면에서 해석 가능 |

## 3. 기술 전제와 범위 합의
1. **VPN 기본 트랙**: S2S 상대 장비 없이도 진행 가능한 합성 모드.  
   - 목적: VPN 관측 패널 제작과 해석 학습.
2. **옵션 트랙**: 실제 S2S 터널(추가 시간 필요).  
   - 목적: 터널 상태 + 데이터플레인 관측.
3. Firewall 로그 분석은 **AzureDiagnostics 단일 모드**를 사용한다.
4. VNet 간 트래픽은 UDR로 Firewall 경유를 강제해 로그를 일관되게 수집한다.

## 4. 시간 모델(라이브 2시간)
- 00:00-00:15 배포 입력값/구조 설명
- 00:15-00:55 배포 및 진단 연결
- 00:55-01:15 트래픽 생성 + 로그 유입 대기
- 01:15-01:45 Workbook 제작(핵심 시각화)
- 01:45-02:00 분석 시나리오 + 정리

## 5. 상태 선언
- 상태: **구현 완료 · 실환경 미검증**
- 의미: 참가자가 수행할 자산(절차/값/쿼리/스크립트)은 완성됨.  
  단, 실제 구독에서의 배포 성공/로그 지연/UI 차이는 별도 리허설로 검증 필요.

