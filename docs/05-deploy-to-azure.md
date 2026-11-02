# Deploy to Azure 배포 가이드

이 워크샵은 **Deploy to Azure 버튼 기반 배포**를 기본 시작점으로 사용합니다.

## 1. 배포 링크
- Portal 배포 링크는 `README.md`의 버튼을 사용합니다.
- 연결 대상 템플릿: `deploy/azuredeploy.json`

## 2. 배포 절차 (Portal)
1. README의 **Deploy to Azure** 버튼 클릭
2. 로그인/디렉터리/구독 확인
3. Resource group 선택 또는 생성
4. 아래 파라미터 입력
   - `prefix`: 참가자 ID (예: p01)
   - `location`: koreacentral
   - `vpnSharedKey`: 실습용 공유 키 (secure)
   - `onPremGatewayPublicIp`: 시뮬레이션 값 또는 실제 endpoint
5. Review + Create
6. Deployment outputs 확인

## 3. 파라미터 계약
| 파라미터 | 타입 | 필수 | 기본값 | 설명 |
|---|---|---|---|---|
| prefix | string | Y | netmon01 | 리소스 이름 접두사 |
| location | string | Y | RG location | 배포 지역 |
| hubAddressPrefix | string | Y | 10.10.0.0/16 | Hub VNet 대역 |
| spokeAddressPrefix | string | Y | 10.20.0.0/16 | Spoke VNet 대역 |
| vpnSharedKey | secureString | Y | 없음 | VPN 연결 공유 키 |
| onPremGatewayPublicIp | string | Y | 203.0.113.10 | 온프렘 VPN Public IP(시뮬레이션 가능) |
| onPremAddressPrefix | string | Y | 172.16.0.0/16 | 온프렘 주소 대역 |

## 4. 배포 후 확인
1. Output의 `firewallPrivateIp` 기록
2. Hub/Spoke VNet, Firewall, VPN Gateway, LAW가 `Succeeded`인지 확인
3. 이후 실습은 `docs/02-participant-lab-manual.md`의 Lab 2부터 진행

## 5. 실패 분기
- `AddressPrefix overlap`: prefix 충돌 없는 주소 대역으로 수정
- `Quota exceeded`: 지역 변경 또는 할당량 상향
- `Gateway provisioning timeout`: 재시도 전 기존 리소스 상태 확인

## 6. 범위 명시
- 이 템플릿은 **기본 실습 환경**을 배포합니다.
- Firewall Rule 상세 구성, Diagnostic settings, 트래픽 생성, Workbook 제작은 교육 목적상 Lab 단계에서 직접 수행합니다.

