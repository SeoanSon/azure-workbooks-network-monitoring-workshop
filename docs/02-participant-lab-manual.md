# 참가자 실습 가이드 (Portal 중심, 대표 Lab 포함)

## 0. 시작 전 준비
### 0-1. 권한 및 환경
- 역할: Subscription `Contributor` 이상
- 브라우저: Azure Portal 로그인 가능
- 리전: `koreacentral` 권장

### 0-2. 참가자 변수표
| 변수 | 예시 |
|---|---|
| `PARTICIPANT` | p01 |
| `RG` | rg-wb-netmon-p01 |
| `HUB_VNET` | vnet-hub-p01 |
| `SPOKE_VNET` | vnet-spoke-p01 |
| `FW_NAME` | afw-p01 |
| `LAW_NAME` | law-wb-netmon-p01 |
| `WB_NAME` | wb-netmon-p01 |

---

## 1. Lab 1 - Deploy to Azure로 기본 환경 배포 (40분)
목표: 버튼 기반 배포로 실습 기반 리소스를 준비한다.

### 1-1. 배포 버튼 실행
1. `README.md`의 **Deploy to Azure** 버튼 클릭
2. Portal 로그인 후 구독/리소스 그룹 선택
3. 파라미터 입력
   - `prefix`: `<PARTICIPANT>` (예: p01)
   - `location`: `koreacentral`
   - `vpnSharedKey`: 실습 공유 키
4. Review + Create

정상 결과: Deployment state `Succeeded`

### 1-2. Outputs 및 리소스 확인
1. Deployments > 현재 배포 > Outputs 탭 열기
2. `firewallPrivateIp` 값 기록
3. 아래 리소스 상태 확인
   - `vnet-hub-<PARTICIPANT>`
   - `vnet-spoke-<PARTICIPANT>`
   - `afw-<PARTICIPANT>`
   - `vpngw-<PARTICIPANT>`
   - `law-wb-netmon-<PARTICIPANT>`

정상 결과: 핵심 리소스 Provisioning state `Succeeded`

### 1-3. 참가자가 수동으로 추가할 항목(학습 행동)
템플릿은 기본 인프라까지만 배포합니다. 아래 항목은 직접 수행합니다.
1. Hub/Spoke 테스트 VM 2대 생성
2. Firewall 정책 내 Allow/Deny 룰 생성
3. Diagnostic settings 연결

### 1-4. VM 2대 생성
1. Hub VM: `vm-hub-<PARTICIPANT>` / `snet-hub-vm`
2. Spoke VM: `vm-spoke-<PARTICIPANT>` / `snet-spoke-vm`
3. 테스트용 최소 사양 사용

오류 분기:
- VM 배포 실패 시 quota/zone 제한 확인
- NIC가 올바른 서브넷에 연결됐는지 확인

---

## 2. Lab 2 - 진단 설정 및 데이터 생성 (20분)
목표: Workbook이 사용할 로그를 실제로 쌓는다.

### 2-1. Log Analytics 확인
`law-wb-netmon-<PARTICIPANT>` 리소스가 Lab 1 배포 결과로 생성되어 있어야 한다.

### 2-2. Diagnostic settings 연결
1. Firewall 리소스 > **Diagnostic settings** > Add
   - Categories: `AzureFirewallApplicationRule`, `AzureFirewallNetworkRule`, `AzureFirewallDnsProxy`
   - Destination: `law-wb-netmon-<PARTICIPANT>`
2. VPN Gateway 리소스 > **Diagnostic settings** > Add
   - VPN 관련 카테고리 선택
   - Destination: 같은 Workspace

정상 결과: 각 리소스에 diagnostic setting 1개 이상 생성됨

### 2-3. Firewall 정책 규칙 생성
1. Firewall Policy > Rule collection groups > Add
2. Network Rule Collection
   - Allow: spoke subnet -> hub subnet TCP/443
   - Deny: spoke subnet -> hub subnet TCP/80
3. Application Rule Collection
   - Allow: `microsoft.com`, `bing.com`
   - Deny 테스트는 허용 목록 외 FQDN 호출로 유도

### 2-4. 트래픽 생성
1. Spoke VM 접속
2. `assets/traffic-gen/linux-traffic.sh` 또는 `windows-traffic.ps1` 실행
3. 5~10분 대기 후 로그 확인 쿼리 실행

---

## 3. Lab 3 - Workbook 제작 (30분)
목표: 다양한 시각화를 한 화면에서 연결한다.

### 3-1. Workbook 생성 및 파라미터
1. Portal > Monitor > Workbooks > New
2. 이름: `wb-netmon-<PARTICIPANT>`
3. 파라미터 생성
   - `pTimeRange` (Time range, 기본 24h)
   - `pAction` (Dropdown: All/Allow/Deny, 기본 All)
   - `pRG` (Text 또는 Resource Picker)

### 3-2. 시각화 6종 구성
1. KPI (총 이벤트, Deny 비율)
2. 시계열 (15분 bin Allow vs Deny)
3. Heatmap (Hour x Action)
4. Donut (Protocol/Port)
5. Top Flow Grid (Src, Dst, Action, Count)
6. Drilldown Table (선택 구간 원시 로그)

쿼리는 `workbook/kql/monitoring-queries.kql` 사용.

---

## 4. Lab 4 - 분석 시나리오 (15분)
1. 기준선(Allow 우세 구간) 캡처
2. Deny 규칙 적용 후 트래픽 재실행
3. 차트 변화 확인(시계열 + Heatmap)
4. Drilldown으로 원인 규칙/대상 확인
5. 복구(규칙 되돌림) 후 정상화 확인

합격 기준:
- [ ] Deny 비율 상승을 수치와 차트로 보여줌
- [ ] 특정 Src-Dst-포트 조합의 실패 원인을 규칙과 연결해 설명함
- [ ] Workbook 필터 변경 시 모든 차트가 같은 의미로 반응함

---

## 5. VPN 옵션 트랙(추가 30~40분)
- 실제 S2S 터널 구성 시에만 수행
- 기본 2시간 트랙 범위 밖이며 강사 승인 후 진행
