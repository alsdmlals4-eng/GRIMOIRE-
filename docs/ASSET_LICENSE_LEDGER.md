# 스펠 Asset License Ledger

- 프로젝트: `스펠` (임시)
- 마지막 검토일: 2026-07-27
- 현재 상태: `NO_EXTERNAL_ASSETS_REGISTERED`
- 현재 제품 단계: `CONCEPT_APPROVAL`
- 현재 실행 프로필: `PLANNING_ONLY_PROFILE`

> 실제 출처·라이선스·상업 이용·수정 가능 여부·적용 경로를 확인하지 않은 자산을 최종 자산으로 승인하지 않는다.

## 조달 순서

```text
플레이어 경험·콘셉트·화면 역할 정의
→ 기존 승인 자산
→ 보유 자산
→ Godot Asset Library·플러그인·외부 후보
→ 라이선스·기술·스타일·성능 검토
→ 채택·수정·Trial
→ 적합한 것이 없을 때만 생성
→ 실제 게임 적용·런타임 검수
```

외부 Godot 자산·플러그인을 조사할 때 `evaluating-godot-assets-and-plugins-before-creation`을 사용한다.

## 자산 원장

| Asset ID | 자산 | 용도 | 출처·URL | 버전 | 가격 | 라이선스 | 상업 이용 | 수정 | 크레딧 | 승인 상태 | 적용 경로 | 검증 |
|---|---|---|---|---|---:|---|---|---|---|---|---|---|
| 없음 | 외부 자산 미등록 |  |  |  |  |  |  |  |  | `NOT_REGISTERED` |  | `NOT_RUN` |

## 후보 판정

- `ADOPT_AS_IS`
- `ADAPT`
- `COMBINE`
- `PROTOTYPE_ONLY`
- `CREATE_REQUIRED`
- `REJECT_LICENSE`
- `REJECT_STYLE`
- `REJECT_TECHNICAL`
- `UNVERIFIED`

## 마스코트·상징 동반자

현재 후보: `NOT_DESIGNED`

Concept Gate에서 최소 한 개의 후보를 설계하되 다음 중 실제 역할을 가져야 한다.

- 튜토리얼·경고·성공·실패 피드백
- 마법학교 세계관 진입점
- 스톡·마도서·연구 등 핵심 루프 상징
- 스토어 아이콘·캡슐·커뮤니티 기억점
- 디지털 후원 자산

단순 장식으로 넣거나 게임 톤과 전투 집중을 방해하지 않는다.

## 현재 `NOT_RUN`

- Godot Asset Library 검색
- 플러그인 기술 Trial
- 제3자 라이선스 법률 검토
- UI Kit·폰트·사운드 후보 조사
- 실제 적용·성능·접근성 검수
- 사람 시각 검수

자산 조사 작업이 시작되면 후보별 출처와 확인 날짜를 기록한다.
