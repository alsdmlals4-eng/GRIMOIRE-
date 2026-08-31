# Circle / Clock Story Front Door — Runtime Evidence Receipt

```yaml
receipt_id: GR-CIRCLE-CLOCK-FRONT-DOOR-RUNTIME-RECEIPT-20260831-01
feature_id: FTR-CIRCLE-CLOCK-CARD-CORE-01
decision_id: GM-CIRCLE-CLOCK-CARD-CORE-01
implementation_commit: 0353017e2698097b9e26c5689551977f1a2e2338
evidence_branch: codex/card-clock-system-20260831
evidence_date: 2026-08-31
engine: Godot_4.7.1_stable_a13da4feb
renderer: GL_Compatibility
exact_worktree: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-/.worktrees/p
main_scene: res://src/ui/front_door/story_front_door.tscn
main_scene_role: STORY_FRONT_DOOR_ENTRY
environment_asset: res://assets/art/backgrounds/school/bg_school_admission_approach.png
environment_asset_sha256: D002D5E8FE545631F48AC07F2AA4C2F4AB292B587E9476CE39F96276133A5FE0
environment_asset_bytes: 2540589
asset_state: USER_APPROVED__CANON_REGISTERED__IMPLEMENTED
```

## 목적과 경계

이 receipt는 승인된 입학식 전 학교 배경을 Story Front Door의 실제 Godot `TextureRect`로 연결하고, 기본 실행점과 이야기 시작 동작을 직접 관찰한 증거를 보관한다. 카드 배치, 카드 상세 규칙, 서클 전체 사용 흐름, 사건 시계 전 장면, 입학식 이후 수업·실습·결투·축제의 완성은 이 receipt의 범위가 아니다.

배경 자체에는 기능 텍스트·수치·버튼을 넣지 않았다. `GRIMOIRE` 로고, 한국어 부제, `새 기록 시작`/`이야기 이어하기`/`설정`과 저장 상태는 scene의 live `Control` UI가 소유한다.

## 직접 Godot 관찰

| 관찰 항목 | 결과 | 근거 경계 |
| --- | --- | --- |
| 정확한 프로젝트 편집기 | PASS | Godot 4.7.1 editor instance가 위 exact worktree와 `story_front_door.tscn`을 열었다. 다른 프로젝트 편집기는 조작하지 않았다. |
| 1280×720 실행 화면 | PASS | `EnvironmentBackground`가 전체 화면 `TextureRect`로 나타나고, 고정 UI가 그 위에서 선명하게 보이는 runtime screenshot을 직접 확인했다. |
| 이야기 시작 입력 | PASS | live `새 기록 시작` 입력 후 route가 `AdmissionPrologue`로 전환됐다. 수업/실습/결투/축제 선택 허브는 노출되지 않았다. |
| 편집기 오류 로그 | PASS | 이 관찰 뒤 GRIMOIRE Godot error output은 0줄이었다. |

## 자동 검증

| 검증 | 결과 | 세부 |
| --- | --- | --- |
| Front Door GUT 회귀 | PASS | 정본 배경 resource 존재, legacy candidate 경로 부재, live `TextureRect` binding·입력 차단·aspect-covered stretch, SHA-256 identity를 검증한다. |
| 전체 Godot runner | PASS | 58 suites, 2,415 assertions, 0 failures. |
| 사용자 fixture 보존 | PASS | `artifacts/foundation-poc/glyph-fixture-rows.json` 전후 SHA-256이 `2D34B3BA15C352D67BB121263DCA145DAE80608F82BB28E11DD10A3240A60077`로 동일하다. 해당 파일은 이 feature commit에 포함하지 않았다. |
| headless scene smoke | PASS | Godot 4.7.1 console에서 exact worktree를 3초 smoke 실행했고 exit code 0을 받았다. |

## 증명하지 않는 항목

이 receipt의 `PASS`는 exact-editor 관찰과 자동화 범위에 한정된다. 아래 항목은 여전히 `NOT_RUN`이며, 이 문서나 자동화 결과로 승격하지 않는다.

- 사람 UX/플레이어 경험
- 모바일 기기·터치·성능·접근성
- Windows/Android export 및 출시 준비
- 00~46분 full vertical slice
- 상세 카드 마력/소비/결투 밸런스
- Star Runtime의 사용자 저장 이전·삭제·자동 변환

## 다음 안전 게이트

`CIRCLE_CLOCK_TASK8_SAVE_DISPOSITION_PENDING`: 기존 Star Runtime에 연결된 실제 사용자 저장은 보존한다. 다음 제거 작업은 저장을 **역사 보관하고 새 코어를 새 기록에서 시작할지**, 또는 별도의 migration을 설계할지에 대한 사용자 처분 결정을 받은 뒤에만 시작한다.
