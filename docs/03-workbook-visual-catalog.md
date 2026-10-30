# Workbook 시각화 카탈로그

## 설계 원칙
- 운영자가 즉시 이상 징후를 파악하도록 Overview → Drilldown 순서로 배치
- 동일한 시간축/필터를 모든 차트에 공통 적용
- "보여주기"보다 "원인 추적 가능성"을 우선

## 권장 시각화 세트
1. **KPI Tiles**  
   - 총 이벤트 수, Deny 비율, 활성 연결 수, 상위 룰 히트
2. **Time-series (Line/Area)**  
   - Allow vs Deny 추세
3. **Heatmap**  
   - 시간대/요일별 이벤트 밀도
4. **Donut/Pie**  
   - 프로토콜/포트/액션 분포
5. **Grid + Conditional Formatting**  
   - Top Source IP, Destination, Rule, Bytes
6. **Flow/Sankey 유사 구조**  
   - Source VNet → Firewall Rule → Destination
7. **Detail Table(Drilldown)**  
   - 선택한 시점/대상의 원시 로그

## 추천 레이아웃
- Row 1: KPI Tiles
- Row 2: Time-series + Heatmap
- Row 3: Donut + Top N Grid
- Row 4: Flow view
- Row 5: Detail logs

## 분석 질문 예시
- Deny 급증은 특정 시간대/서브넷/규칙에 집중되는가?
- VPN 관련 이벤트 증가와 Firewall Deny가 동시 발생하는가?
- VNet 간 허용 트래픽이 특정 포트/목적지에 편중되는가?

