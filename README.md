# Azure Workbooks Workshop: VPN · VNet Traffic · Azure Firewall Monitoring

2시간, Portal 중심, 참가자 직접 배포형 워크샵 저장소입니다.  
단순 메트릭 차트가 아닌 다양한 시각화 중심으로 Azure Workbooks를 구성합니다.

## 대상
- Azure Monitor/Workbook 입문~초중급
- 네트워크 운영 관점 모니터링 시나리오를 빠르게 체험하려는 엔지니어

## 학습 목표
1. 실습 환경을 Portal에서 직접 배포한다.
2. VPN/피어링/VNet 간 트래픽 흐름을 Workbook으로 분석한다.
3. Azure Firewall 허용·차단 이벤트를 시각화하고 원인 추적한다.
4. 멀티 시각화 대시보드를 조합해 운영 인사이트를 설명한다.

## 실습 아키텍처(요약)
- VNet-Hub, VNet-Spoke, VNet Peering
- VPN Gateway + Local Network Gateway(시뮬레이션)
- Azure Firewall + Firewall Policy
- 테스트용 VM 2대
- Log Analytics Workspace
- Azure Workbook

## 워크샵 구성(2시간)
- 00:00-00:10 오리엔테이션
- 00:10-00:40 Lab 1: Portal 배포
- 00:40-01:00 Lab 2: 트래픽/이벤트 생성
- 01:00-01:35 Lab 3: Workbook 제작
- 01:35-01:50 Lab 4: 분석 시나리오
- 01:50-02:00 정리/삭제

## 문서
- [설계 제안서](docs/01-design-proposal.md)
- [참가자 실습 가이드](docs/02-participant-lab-manual.md)
- [Workbook 시각화 카탈로그](docs/03-workbook-visual-catalog.md)
- [KQL 예시](workbook/kql/monitoring-queries.kql)

## 운영 메모
- 비용 주요 항목: VPN Gateway, Azure Firewall
- 실습 종료 후 리소스 그룹 삭제를 기본 절차로 수행
- 참가자별 고유 Prefix를 사용해 리소스 이름 충돌 방지

