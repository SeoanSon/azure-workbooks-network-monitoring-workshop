# 정리 절차 (비용 종료)

## 1. 삭제 순서
1. Workbook 저장/백업
2. Resource group `rg-wb-netmon-<PARTICIPANT>` 삭제
3. 삭제 후 5~10분 뒤 잔여 리소스 확인

## 2. 잔여 확인 포인트
- Public IP
- Managed disk
- Network watcher 리소스(자동 생성 가능)
- 진단 설정이 남아 있는지 확인

## 3. 실패 분기
- RG 삭제 실패 시 Activity log에서 실패 리소스 확인 후 개별 삭제
- 권한 부족 오류 시 구독 소유자에게 삭제 권한 요청

## 4. 비용 경고
- Firewall, VPN Gateway는 실행 시간에 따라 비용이 빠르게 증가한다.
- 종료 후에도 리소스가 남아 있으면 과금이 지속된다.

