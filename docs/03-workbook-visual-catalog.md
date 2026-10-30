# Workbook 시각화 카탈로그 (구현 매핑)

## 공통 파라미터
| 이름 | 타입 | 기본값 | 적용 |
|---|---|---|---|
| `pTimeRange` | Time range | 24h | 모든 쿼리의 TimeGenerated 필터 |
| `pAction` | Dropdown(All/Allow/Deny) | All | Firewall 액션 필터 |
| `pRG` | Text/Resource | 현재 RG | `_ResourceId` 또는 ResourceGroup 필터 |

## 시각화별 구현 정의
| 시각화 | 쿼리 블록 | Workbook 표현 | 필드 매핑 |
|---|---|---|---|
| KPI: Total Events | `FW_Base` | Tile | `TotalEvents` |
| KPI: Deny Ratio | `FW_DenyRatio` | Tile (Percent) | `DenyRatio` |
| Allow vs Deny Trend | `FW_TimeSeries` | Line/Area | X=`TimeGenerated`, Y=`Events`, Split=`Action` |
| Heatmap | `FW_Heatmap` | Heatmap | X=`Hour`, Y=`Action`, Color=`Events` |
| Protocol/Port 분포 | `FW_ProtoPort` | Donut | Slice=`ProtoPort`, Value=`Events` |
| Top Flow | `FW_TopFlow` | Grid | `SrcIp,DstIp,Action,Events` |
| VPN Health | `VPN_Health` | Grid/Bar | `Category,Events` |
| Drilldown Raw | `FW_Raw` | Table | `TimeGenerated,msg_s,Category,Resource` |

## 레이아웃 권장
1. Row 1: KPI 2개 + VPN Health
2. Row 2: Allow/Deny Trend + Heatmap
3. Row 3: ProtoPort Donut + Top Flow Grid
4. Row 4: Drilldown Raw Table

## Drilldown 규칙
- Trend 또는 Top Flow에서 선택한 시간/대상 값을 `FW_Raw`에 전달
- 선택이 없을 때는 `pTimeRange` 전체 표시
- 빈 결과 시 메시지: `No data in current filter`

## 합격 조건
- `pAction` 변경 시 KPI/Trend/Heatmap/Top Flow가 동시에 일관되게 변함
- Drilldown이 선택 값 기준으로 좁혀짐
- Deny 테스트 후 Trend와 Heatmap에 변화가 확인됨
