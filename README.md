# Azure Workbooks Workshop: VPN, VNet Traffic, Azure Firewall

2시간, Azure Portal 중심, 참가자 직접 배포형 워크샵 저장소입니다.  
상태: **구현 완료 · 실환경 미검증** (문서/쿼리/실행 자산 완성, 실제 Azure 리허설 로그는 미포함)

## 이 저장소가 제공하는 것
1. 목표-행동-데이터-화면-합격증거 연결표
2. 참가자가 그대로 따라 할 수 있는 상세 Lab 절차(입력값/대기시간/오류분기 포함)
3. Workbook 제작용 실행 쿼리와 시각화 매핑
4. 트래픽 생성용 실행 자산(리눅스/윈도우)
5. 종료(비용 정리) 절차

## 빠른 시작
1. [설계/실행 가능성 계약](docs/00-workshop-contract.md)
2. [설계 제안서](docs/01-design-proposal.md)
3. [Lab 가이드 (대표 Lab 포함)](docs/02-participant-lab-manual.md)
4. [Workbook 시각화 정의](docs/03-workbook-visual-catalog.md)
5. [VPN 모니터링 모드](docs/04-vpn-mode.md)
6. [정리 절차](docs/99-cleanup.md)

## 실습 자산
- KQL: `workbook/kql/monitoring-queries.kql`
- Workbook 제작 시트: `workbook/templates/workbook-build-sheet.md`
- 트래픽 생성 스크립트: `assets/traffic-gen/`

## 주의 사항
- 본 워크샵의 VPN 기본 트랙은 **명시적 합성 모드**(터널 미연결 관측 + Gateway 진단/메트릭)입니다.
- 실제 S2S 터널 기반 데이터플레인 관측은 옵션 트랙(추가 30~40분)으로 분리되어 있습니다.
- 비용 상위 항목은 VPN Gateway, Azure Firewall입니다. 종료 절차를 반드시 수행하세요.
