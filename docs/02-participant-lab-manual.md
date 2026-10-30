# 참가자 실습 가이드 (Portal 중심)

## 사전 조건
- Azure 구독 Contributor 권한
- 리전 내 VPN Gateway/Firewall 배포 가능 할당량
- 브라우저에서 Azure Portal 접근 가능

## Lab 1. 환경 배포 (30분)
1. 리소스 그룹 생성 (`rg-wb-netmon-<alias>`)
2. Hub/Spoke VNet 및 서브넷 생성
3. Hub-Spoke Peering 구성
4. Azure Firewall 및 Policy 생성
5. VPN Gateway + Local Network Gateway 생성
6. 테스트 VM 2대(허브/스포크) 생성
7. Log Analytics Workspace 생성

## Lab 2. 진단 설정 및 데이터 생성 (20분)
1. Firewall 진단 로그를 Log Analytics로 전송
2. VPN Gateway 진단 로그를 Log Analytics로 전송
3. VM 간 ICMP/TCP 트래픽 유도
4. Firewall Deny 이벤트 유도(임의 차단 룰)
5. 5~10분 대기 후 로그 유입 확인

## Lab 3. Workbook 제작 (35분)
1. Workbook 생성 후 파라미터 정의  
   - Subscription / Resource Group / TimeRange / Action(Allow,Deny)
2. 시각화 섹션 추가  
   - KPI 타일(총 트래픽, 차단율, 활성 연결)  
   - 시계열(Line/Area)  
   - Heatmap(시간대별 이벤트 밀도)  
   - Donut(프로토콜/포트 분포)  
   - Grid(Top source/destination)  
   - Flow 유사 차트(소스→규칙→목적지)
3. 차트 간 필터 연계 및 Drilldown 구성

## Lab 4. 분석 시나리오 (15분)
1. 차단 급증 구간 식별
2. 영향 대상(소스/목적지/포트) 분석
3. 룰/라우팅/피어링 관점 원인 설명

## 완료 체크
- [ ] Hub↔Spoke 트래픽이 Workbook에서 보인다.
- [ ] Deny 이벤트를 차트와 원시 로그로 모두 확인했다.
- [ ] 파라미터 변경 시 차트가 일관되게 반응한다.
- [ ] Drilldown으로 원인 분석 경로를 재현할 수 있다.

## 정리
1. Workbook 저장(export 옵션 포함)
2. 리소스 그룹 삭제
3. 삭제 실패 리소스(VPN Gateway, Public IP) 개별 정리

