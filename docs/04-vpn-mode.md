# VPN 모니터링 모드 정의

## 기본 트랙(2시간 내): 합성 모드
- 목적: VPN 관측 패널 제작/해석 학습
- 구성: VPN Gateway + Local Network Gateway + Diagnostic settings + Metrics
- 제한: 실제 S2S 터널 데이터플레인 트래픽은 포함하지 않음

관찰 항목:
1. Gateway 관련 진단 카테고리 이벤트 수
2. 시간대별 이벤트 추이
3. Resource Health / Metrics 변화

## 옵션 트랙(추가 30~40분): 실제 S2S
- 전제: 원격 VPN endpoint 준비(온프렘 장비 또는 에뮬레이터 VM)
- 수행:
  1. 실제 S2S connection 생성
  2. 연결 상태 `Connected` 확인
  3. 터널 통해 트래픽 생성
  4. Workbook에서 VPN 패널 + Firewall 패널 상관관계 확인

## 왜 분리하는가
- 참가자 직접 배포 2시간 제약에서 실제 S2S까지 강제하면 실패 확률이 높다.
- 기본 트랙은 "관측 경험"을 보장하고, 옵션 트랙은 "실터널 운영 경험"을 확장한다.

