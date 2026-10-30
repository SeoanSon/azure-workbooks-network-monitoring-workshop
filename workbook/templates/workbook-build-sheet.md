# Workbook Build Sheet (Portal 수동 제작용)

## 1) Workbook 생성
1. Azure Portal > Monitor > Workbooks > New
2. Edit 모드 진입
3. Save as `wb-netmon-<PARTICIPANT>`

## 2) 파라미터 생성
1. Add > Parameters
2. `pTimeRange` (Time Range, default `Last 24 hours`)
3. `pAction` (Drop down)
   - Values: `All`, `Allow`, `Deny`
   - Default: `All`
4. `pRG` (Text)
   - Default: `rg-wb-netmon-<PARTICIPANT>`

## 3) 쿼리 블록 추가 순서
`workbook/kql/monitoring-queries.kql`에서 아래 블록을 각각 복사해 붙여넣는다.
1. FW_TotalEvents
2. FW_DenyRatio
3. FW_TimeSeries
4. FW_Heatmap
5. FW_ProtoPort
6. FW_TopFlow
7. VPN_Health
8. FW_Raw

## 4) 시각화 형식 지정
| 블록 | Visualization |
|---|---|
| FW_TotalEvents | Tile |
| FW_DenyRatio | Tile (Percent) |
| FW_TimeSeries | Line chart |
| FW_Heatmap | Heatmap |
| FW_ProtoPort | Donut chart |
| FW_TopFlow | Grid |
| VPN_Health | Bar or Grid |
| FW_Raw | Table |

## 5) 레이아웃
- Row 1: FW_TotalEvents, FW_DenyRatio, VPN_Health
- Row 2: FW_TimeSeries
- Row 3: FW_Heatmap, FW_ProtoPort
- Row 4: FW_TopFlow
- Row 5: FW_Raw

## 6) 검증 체크
- `pAction = Deny` 선택 시 FW_DenyRatio가 증가하는지 확인
- FW_TimeSeries의 피크 시각을 클릭하고 FW_Raw에서 동일 시간대 로그 확인
- FW_TopFlow의 상위 항목이 FW_Raw에도 등장하는지 확인

