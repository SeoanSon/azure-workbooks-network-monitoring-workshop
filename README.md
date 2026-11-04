# Azure Workbooks Workshop: Express Route, VPN, VNet Traffic

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSeoanSon%2Fazure-workbooks-network-monitoring-workshop%2Fmain%2Fdeploy%2Fazuredeploy.json)

## 이 저장소가 제공하는 것
1. 목표-행동-데이터-화면-합격증거 연결표
2. 참가자가 그대로 따라 할 수 있는 상세 Lab 절차(입력값/대기시간/오류분기 포함)
3. Workbook 제작용 실행 쿼리와 시각화 매핑
4. 트래픽 생성용 실행 자산(리눅스/윈도우)
5. 종료(비용 정리) 절차

## 빠른 시작
1. [설계/실행 가능성 계약](docs/00-workshop-contract.md)
2. [설계 제안서](docs/01-design-proposal.md)
3. [Deploy to Azure 가이드](docs/05-deploy-to-azure.md)
4. [Lab 가이드 (대표 Lab 포함)](docs/02-participant-lab-manual.md)
5. [Workbook 시각화 정의](docs/03-workbook-visual-catalog.md)
6. [VPN 모니터링 모드](docs/04-vpn-mode.md)
7. [정리 절차](docs/99-cleanup.md)

## 실습 자산
- ARM 템플릿: `deploy/azuredeploy.json`
- 샘플 파라미터: `deploy/parameters.sample.json`
- KQL: `workbook/kql/monitoring-queries.kql`
- Workbook 제작 시트: `workbook/templates/workbook-build-sheet.md`
- 트래픽 생성 스크립트: `assets/traffic-gen/`

