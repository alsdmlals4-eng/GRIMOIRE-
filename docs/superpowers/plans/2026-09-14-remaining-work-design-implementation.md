# GRIMOIRE 남은 작업 설계·구현 계획

2026-09-14 후속: W03 주인공 크로마키→실제 alpha 후보 확보(최종 승인/소비처 교체는 별도). W04 공통 DialogueStage를 S00/S01/S05/S08에 연결하고 읽기/기록/선택/작은 logical viewport를 검증했다. 독립3인slot·표정·새 배경·포커스 복원·32px 전체조합은 아직 남는다. 최신 상세 증거는 Active Context 상단; 아래 최초 스냅샷을 완료 상태로 사용하지 않는다.

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking. 최초 작성은 명세 준비였으며, 최신 사용자 지시로 순차 구현·개선이 승인됐다. 일반 기술 선택의 재승인 대기 없이 진행한다. 별도 지시 없는 병렬 에이전트 실행은 하지 않는다.

2026-09-14 실행 readback: W01 완료(브랜치/PC 범위), W02 경로·복구·실제 export 저장/재실행 검증 완료. W03 단일 인물 alpha 재시도도 RGB 체크무늬로 실패하여 미적용. W04 고정 화자/대사 Resource 연결은 구현했지만 공통 Stage/독립 인물 레이어는 아직 미완료다. 아래 최초 지도보다 이 실행 기록과 Active Context 상단이 우선한다. 게임 전체/모바일/출시/main 완료가 아니다.

**Goal:** 이미 연결된 첫 학교생활 장을 저장 안전성·공통 대화·주문 화면·자산·검증까지 완성하고, 장기 게임 확장에 필요한 후속 설계 경계를 명확히 한다.

**Architecture:** `src/core/shared_spell/`의 의미·사건·결투·이야기 상태를 유지하고 화면은 그 상태와 결과를 읽는다. 저장은 단일 이야기 경계, 연출은 결과 소비자, 자산은 승인/기술 검수 후 연결한다. 새 범용 RPG 엔진이나 기존 폴더 전체 재편은 하지 않는다.

**Tech Stack:** 프로젝트가 채택한 Godot 4.7 계열 / GDScript / Control UI / 기존 독립 테스트 runner / 저장소 내 Markdown·자산 기록. 정확한 실행 바이너리는 작업 시 재확인한다.

**Spec:** [사람용 블루프린트](../specs/2026-09-11-human-blueprint.md), [공통 주문 규칙](../specs/2026-09-10-shared-spell-rules-design.md), [최신 재기획 결정](../../planning/REPLANNING_INTAKE_2026-09-10.md). 본 문서는 이들의 **잔여 작업 실행 명세**이며 전체 GDD나 주문 수치의 새 정본이 아니다.

## 1. 범위와 읽는 법

작성일: 2026-09-14. 상태: `SPECIFIED_RECOMMENDED_EXECUTION_PLAN`. 기능별 실행 상태는 [Active Context](../../ACTIVE_CONTEXT.md)와 실제 코드/테스트가 소유한다. 아래 현재 상태는 조사 시점의 스냅샷이며 작업 완료 체크가 아니다.

- 사용자 요청: 남은 작업과 해당 작업의 구현·설계 명세 준비.
- 관찰 checkout: `codex/replanning-intake-20260910` / `7c396075a8fc7c07e9f96a2d3f1e6ef55f1901f1`.
- fetch한 `origin/main`: `d384c454768a8aa3b0adb939e0b035ac2afa426e`. 브랜치 구현을 main 병합 완료로 표시하지 않는다.
- Base pin: **v9.4.3 유지**. 최신 remote main 관찰 `d830c0f6967678eed3c208ac6b24f9cd1b262ec3`. 더 최신 정책을 읽는 것과 채택 계약을 교체하는 것은 다르다.
- 열린 PR #253/#249/#187/#166은 이번 명세의 구현 공급원으로 흡수하지 않는다. 실행 전 lifecycle을 다시 조회한다.
- 명세의 새 함수·파일은 아래 `Create`/`신규 계약`으로 명시한다. 아직 존재하거나 동작한다고 해석하지 않는다.
- 내부 작업 지시서 `source_only`: 별도 PDF를 자동 생성하지 않는다. 기존 사람용 본책 PDF는 9월 11일의 검토 스냅샷이며 이 계획의 최신 상태를 포함하지 않는다.

### Global Constraints

1. 마법은 배운 글자 1개 또는 서로 다른 2개를 조합한다. 첫 장의 기존 네 글자/10주문과 의미 판정은 유지한다.
2. 결투만 손패·드로우를 사용한다. 실습·온실·축제는 학습한 글자 선택으로 같은 작용을 사용한다.
3. 겹치기는 조합 준비일 뿐 자동 시전이 아니다. 대상/필요한 목적지/비용/결과 확인 후 명시 시전한다.
4. 시계는 현재 규칙대로 행동 시간으로 움직인다. 대화·메뉴·고민·도감 열람에 현실 시간 벌점을 추가하지 않는다.
5. 성공과 대가를 동시에 기록한다. 도움·중단·패배를 숨기거나 성공으로 바꾸지 않는다.
6. 새 게임 / 이어하기 / 설정 / 도감 / 종료를 유지한다. 수업·실습·결투·축제는 이야기 순서로 진입한다.
7. 승인된 학생 외형과 여러 인물이 같은 배경에 서는 하단 대화 구도를 유지한다. 새 이미지 최종 승인과 runtime 승격은 분리한다.
8. 별형 회로, 필기 인식, 마법사 종류 카드, 체스, SD 이동, 첫 장의 화폐·상점·관계 점수 막대를 추가하지 않는다.
9. 사용자 변경과 구 저장은 보존한다. 삭제 가능 파일은 참조/해시/복원 경로를 확인한 뒤 `.cleanup-review/`로 모으고 사용자가 삭제한다.
10. 직접 main push·force·보호 우회 없음. 실제 실행하지 않은 Human/Device/성능/출시는 `NOT_RUN`이다.

## 2. 현재 구현 지도와 문서 드리프트

| 영역 | 실제 소비처 | 현재 있는 것 | 남은 것 |
|---|---|---|---|
| 진입 | `src/ui/story/story_menu.gd`, `.tscn`, `project.godot` | 기본 메뉴, 유효 저장 이어하기, 새 게임 대체 확인, 메뉴 일시정지 | 최종 시각, 설정 범위, export 저장 |
| 이야기 | `src/core/shared_spell/story_flow.gd`, `story_save.gd` | S00–S08, 활동 종료·도움·중단 연결, 결과 보존 | 저장 실패 시 전진 차단, 콘텐츠 검수 |
| 주문 의미 | `src/core/shared_spell/spell_semantics.gd` | 단독/조합·대상·목적지 평가 | 새 규칙보다 실제 카드/룬 UI 표현 |
| 사건 | `event_spell_cast.gd`, `event_session.gd`, `event_definitions.gd` | 수업/온실/후속 시료/축제, 효과·시간·종료 판정 | 장면 속 대상, 대화형 안내, 시계 피드백 |
| 결투 | `duel_spell_exchange.gd`, `duel_session.gd`, `duel_save.gd` | 손패·교환·상대 예고·재현 저장 | 손패 연출·터치 검수·결과 복기 가독성 |
| 카드 입력 | `src/ui/event_session/event_session_screen.gd`, `src/ui/shared_duel/shared_duel_screen.gd` | `_get_drag_data`, `_can_drop_data`, `_drop_data`와 탭 선택 존재 | 입력 공통 검수, drag 취소·touch 충돌·상태 피드백 |
| 대화 | `story_dialogue.gd`, `story_screen.gd` | 인물별 대사, 이전/다음, 마지막 선택, 읽기 중 비용 없음 | 안정 line/speaker ID, 공통 장면 레이어, 기록/포커스 |
| 교실 구도 | `story_classroom_view.gd` | 승인 합성 그림을 S01에만 표시, 엔진 대사 덧씌움 | 배경·인물·프레임 분리, 화자별 표정·강조 |
| 도감/설정 | `story_codex.gd`, `story_preferences.gd` | 실제 사용 기록 집계, 본문 24/28/32px | 룬 카드 표시, 모든 핵심 글자 확대, 음량·모션 |
| 저장 | `event_save.gd` 및 파생 저장 클래스 | 두 슬롯, checksum, 쓰기 후 readback, 손상 시 이전 유효 슬롯 | 실패 진행 잠금, export 경로, 손상 복구 알림 |

경로가 생략된 core 파일은 `src/core/shared_spell/`, story UI 파일은 `src/ui/story/` 소속이다.

### 반드시 바로잡을 해석

- 본책 29절의 “별형 Product Root가 main”, “효과/시전/UI 미구현”, `story_events/`, `story_progress/`, `ui/academy/` 신설 제안은 현재 브랜치의 구조와 다르다. 기존 실제 폴더를 사용한다. **원격 main과 로컬 브랜치의 차이도 별도로 유지**한다.
- 본책의 초상 2인 기준은 최신 사용자 승인 **동일 배경 최대 3인 대화 구도**로 보정한다. 3인 이상 화면은 첫 장 범위에 넣지 않는다.
- 본책의 `GRIMOIRE_STORY_SPELL_2`는 옛 제안이다. 실제 payload는 `GRIMOIRE_STORY_BRIDGE_1`; UI 개선만으로 save schema를 바꾸지 않는다.
- 카드 겹치기와 core를 다시 만들지 않는다. 이미 존재하는 입력을 완성하고 회귀한다.
- 오래된 3년 세계관/고유 인물 이름 계약은 비교 자료로 보존하되 9월 재기획 뒤 전부 자동 재승인된 것으로 해석하지 않는다. 새 확장에서는 유지/변경 매핑을 먼저 작성한다.

## 3. 조사·비교와 채택 이유

조회일 2026-09-14. 공식 문서에서 확인한 패턴이며 다른 게임을 직접 플레이한 테스트 결과가 아니다.

| 근거 | 확인한 사실 | 채택 | 이번 설계에 적용 / 한계 |
|---|---|---|---|
| [Godot 데이터 경로](https://docs.godotengine.org/en/stable/tutorials/io/data_paths.html) | 배포 리소스와 쓰기 가능한 사용자 저장 위치 구분 | ADAPT | 개발 검증 경로는 프로젝트 내부 유지, 배포판은 `user://` 제공. 실제 기기 I/O 검증을 대신하지 않음 |
| [Ren'Py 대화](https://www.renpy.org/doc/html/dialogue.html) | 화자·서술·텍스트·연결 이미지의 역할 분리 | ADAPT | Godot에서 speaker_id와 대사를 분리하고 공통 하단 창 사용. 엔진 교체·타 작품 UI 복제는 REJECT |
| [XAG 101](https://learn.microsoft.com/en-us/xbox/accessibility/xbox-accessibility-guidelines/101) | 게임 텍스트의 가독성과 표시 조정 검토 | ADAPT | 대화뿐 아니라 선택지/예고/결과/도감까지 확대 검수. 32px 하나만으로 접근성 완료 주장 REJECT |

독창성은 더 많은 미니게임보다 **같은 마법 글자가 결투·수업·환경 사건에서 일관된 뜻으로 작동하고, 결과가 동료의 대화와 기록으로 돌아오는 구조**에서 확보한다. 새 수치 시스템 도입보다 이 연결을 먼저 완성한다.

## 4. 실행 순서와 의존관계

| ID | 우선 | 완료 단위 | 선행 | 가장 큰 기대효과 |
|---|---|---|---|---|
| W01 | P0 | 저장 실패 안전 경계 | 없음 | 저장되지 않은 진행·중복 행동 방지 |
| W02 | P0 | 개발/배포 저장 분리·복구 안내 | W01 | 내보낸 게임에서도 정상 이어하기 |
| W03 | P1 | 대화용 자산 레이어와 상태군 | 없음; runtime 적용은 승인 후 | 합성 그림 한 장의 한계 해소 |
| W04 | P1 | 공통 RPG 대화 무대 | W01, W03 | 모든 대화에서 인물끼리 말하는 느낌 |
| W05 | P1 | 사건 화면·주문/시계 피드백 | W01; 최종 시각 W03 | 숫자 상태판에서 장면 문제 해결로 전환 |
| W06 | P1 | 결투 손패·조합·예고 완성 | W01; W05 입력 계약 | 카드 조합의 직관성과 대응 재미 |
| W07 | P1 | 이야기·결과 반응·도감 연결 | W04, W05, W06 | 수업에서 배운 행동이 학교생활로 연결 |
| W08 | P1 | 설정·접근성·메뉴 완성 | W04–W06 | 큰 글자/탭만으로도 전체 진행 |
| W09 | P2 | 시전 연출·사운드·모션 감소 | W03, W05, W06, W08 | 작용과 대가를 감각적으로 이해 |
| W10 | P2 | 콘텐츠 검증·본책 동기화 | W04, W07 | 문서/대사/데이터의 재발성 불일치 감소 |
| W11 | P0 출시 게이트 | 통합·기기·빌드·보호 main 인계 | W01–W10 | 실제 사용자에게 전달 가능한 첫 장 |
| W12 | 후속 설계 | 장기 학교생활 확장 명세 | W07의 결과 + W11 플레이 관찰 | 첫 장을 전체 게임으로 축소하지 않음 |

실행 흐름: `W01 → W02 → W04 → W05 → W06 → W07 → W08 → W09 → W10 → W11`. W03은 자산 준비 경로로 먼저 진행할 수 있으나 다른 코드 작업과 승인 상태를 섞지 않는다. W12의 자료 조사·기존 설정 비교는 선행 가능하며 새 대규모 콘텐츠 구현은 검증된 첫 장 기반으로 한다.

## 5. 작업별 설계·구현 명세

### W01. 저장 실패 시 멈추는 진행 경계

2026-09-14 실행: 구현·관련 자동 검사·PC 오류/재시도 화면 확인. 현재 증거와 한계는 Active Context의 W01 절을 읽는다. 모바일/강제 종료/보호 main 통합까지 완료한 상태는 아니다.

**현재 → 이유:** `StoryScreen.advance_story()`는 상태를 바꾸고 `save_story()` 실패 여부와 관계없이 `_render()`한다. `_checkpoint()`도 실패 이후 다음 행동을 잠그지 않는다. 파일 checksum이 있어도 화면의 진행 안전성은 별도다.

**Modify:** `src/ui/story/story_screen.gd`, `story_menu.gd`; `src/ui/event_session/event_session_screen.gd`; `src/ui/shared_duel/shared_duel_screen.gd`.
**Tests:** 기존 `tests/run_story_screen_tests.gd`, `run_story_pause_tests.gd`, `run_story_menu_tests.gd`, `run_event_screen_tests.gd`, `run_duel_screen_tests.gd`.

**신규 계약:** StoryScreen에 `persistence_blocked: bool`, `pending_transition: Dictionary`, `retry_save() -> bool`. 자식 두 화면에 `set_persistence_blocked(blocked: bool) -> void`. 저장 주입점 `persist_payload(payload: Dictionary) -> Dictionary`의 기본은 기존 Store 호출, 테스트는 실패 응답을 주입한다. 화면 밖 별도 영구 장부/전역 Singleton은 만들지 않는다.

| 상황 | 행동 | 상태·입력 |
|---|---|---|
| 장면 이동 요청 | Flow로 후보 상태 계산, 후보 저장 후 공개 | 실패하면 현재 장면 유지, 후보 1개만 보관 |
| 이미 확정된 사건/결투 행동 저장 실패 | 현재 메모리 결과와 receipt 보존 | 이후 시전·도움·중단·다음 장면 차단 |
| 저장 재시도 | 같은 payload만 저장, Flow/act/apply 재호출 금지 | 성공 시 잠금 해제; 실패 시 유지 |
| 잠금 중 메뉴/기록 | 읽기 허용 | 새 게임·재시작·다른 저장 불러오기로 메모리 결과를 조용히 폐기하지 않음 |
| 종료 요청 | “현재 행동은 저장되지 않았습니다”와 재시도/취소 | 앱 강제 종료까지 막거나 복구를 보장하지 않음 |

실제 디스크 기록 자체가 불가능한 상태에서 강제 종료되면 마지막 정상 저장 이후 진행 손실은 피할 수 없다. 이를 성공 저장으로 표기하지 않는 것이 계약이다. 중복 시전 방지는 기존 command ID/revision을 유지한다. `_checkpoint` 신호 뒤 자식 화면이 알림을 덮어쓰지 못하도록 오류 표시는 부모 전용 영역에서 유지한다.

- [x] 테스트에 아래 실패 상황을 추가하고 현재 구현에서 실패함을 확인한다.

```gdscript
# run_story_screen_tests.gd 안의 기존 screen/c 활용; 경로는 읽기 전용 실패 주입 fixture.
var before: Dictionary = screen.story.duplicate(true)
screen.save_folder = "res://src/ui/story/story_screen.gd/no-save"
screen.advance_story(int(before.stage))
c.assert_equal(before, screen.story, "failed transition must not publish next scene")
# 추가 검사는 정상 경로 복원 후 retry_save() 2회에도 stage가 한 번만 변하는지 확인.
```

- [x] 후보 상태 저장→공개와 이미 소비된 상태의 잠금→재저장을 구분해 구현한다.
- [x] 사건 시전/결투 시전/도움/중단 각각 실패 후 revision·마력·카드·receipt가 추가 변경되지 않는지 검증한다.
- [x] 재시도 성공·재실패·더블클릭·메뉴 왕복·장면 종료 실패를 검사하고 변경 파일만 commit한다.

**완료:** 실패 중 다음 유료 행동/장면 이동 0회, 정상 재시도 후 정확히 한 번 진행. 저장 권한의 실제 모바일 실패 검증은 W11로 남긴다. 롤백은 기존 정상 저장을 유지한 코드 revert이며 저장 파일 삭제가 아니다.

### W02. 저장 위치와 손상 복구 표시

**현재 → 이유:** 실제 메뉴/화면 기본 저장은 `res://artifacts/local-validation/...`이다. 개발 증거에는 적합하지만 배포판의 리소스 폴더를 플레이어 저장으로 쓰면 안 된다. 사용자의 “프로젝트 폴더 안에서 작업” 지시도 존중해야 한다.

**Create:** `src/core/shared_spell/story_storage_paths.gd`, `tests/run_story_storage_paths_tests.gd`.
**Modify:** `story_menu.gd`, `story_screen.gd`, `event_session_screen.gd`, `shared_duel_screen.gd`, `src/core/shared_spell/event_save.gd`; 기존 `run_event_save_tests.gd`, `run_story_preferences_tests.gd`.

**신규 계약:** `static func root(editor_session: bool) -> String`: 개발 세션은 기존 프로젝트 내부 경로, export는 `user://grimoire/`. 테스트에서는 `save_folder`를 계속 명시 주입할 수 있다. 이번 명세 작성 중 사용자 폴더 밖에 쓰지 않는다. `user://`는 배포 플레이어 데이터이며 프로젝트 소스 작업 경로 확장이 아니다.

`load_progress(folder)`의 기존 `status/payload/generation/slot` 유지, 추가 필드 `recovery: bool`, `diagnostics: Array[String]`. 정상 슬롯+다른 손상 슬롯일 때 복구 안내를 보이되 “손상 파일이 반드시 더 최신”이라고 추정하지 않는다. 두 슬롯 모두 무효면 기존 bytes 보존, 신규 자동 덮어쓰기 금지. checksum은 변조 방지 보안이 아니다.

구 개발 저장의 자동 이동 없음. 기존 슬롯 포맷 유지. 이후 사용자가 가져오기를 원할 때만 원본 사본/검증/목적지 비어 있음/재읽기 절차를 제공한다. 쓰기 원자성은 두 슬롯+readback을 기준으로 설명하고 모든 플랫폼 power-loss 원자성 보장이라는 표현을 사용하지 않는다.

- [x] `root(true)`는 프로젝트 안, `root(false)`는 `user://`, 테스트 주입 경로가 우선인 실패 검사를 만든다.
- [x] 정상2/손상1/손상2/부분쓰기/용량초과/설정슬롯 독립 검사를 확장한다.
- [x] 경로 선택과 복구 안내만 구현하고 payload 의미는 변경하지 않는다.
- [x] PC export의 별도 QA entry에서 실제 메뉴 새 게임→저장→프로세스 종료→재실행→이어하기를 검사한다. 모바일은 W11. 인물 테스트의 기본 개발 저장 사용을 발견·분리했고, 수정 후 재실행 hash 불변을 확인했다. 수정 전 원본 불변은 입증하지 못했다.

Export 구현 추가: `export_presets.cfg`는 일반 검증용32개 정적 리소스와 별도 Storage QA preset을 구분한다. `tools/check_chapter_export.py`로 현재 코드가 참조하는 정적 리소스 누락/불필요 포함을 검사한다(동적 경로 일반 증명 아님). `addons/grimoire_export_guard/`는 export snapshot에서 Hera autoload만 빼고 복원한다. 기존 godot_ai exporter는 자체 helper를 제외한다. vendor addon 수정 없음. QA preset만 `storage_qa` feature로 `tests/export_storage_probe.tscn`을 시작하며 일반 메뉴는 변경하지 않는다. export template에는 `--script`가 없으므로 별도 QA 씬을 사용한다. 출력/로그는 `artifacts/local-validation/windows-chapter/`, `windows-storage-qa/`에 있다. 검증 저장은 `user://grimoire/export-storage-probe-20260914`에 한정한다. 내보내기 editor 종료의 resource leak 경고는 미해결이며 실행 성공과 분리한다.

**완료:** export I/O 경로 검증, 실패 이유·복구 여부가 플레이어에게 표시됨. 정상 상태의 “자동 저장 완료” 알림이 대사를 매번 가리지 않음.

### W03. 승인 캐릭터와 공통 대화 자산 분리

**현재 → 이유:** S01은 `classroom-composition-candidate-01.png` 한 장에 배경/인물/창이 합쳐져 있다. RGB 체크무늬 atlas 실패본은 runtime 차단 상태다. 다른 장소에 교실 이미지를 재사용하거나 인물 강조가 되는 척할 수 없다.

**Owner:** `docs/planning/visual/CARD_DUEL_STUDENT_LEFT_01_2026-09-10.md`; `output/imagegen/dialogue-stage-20260913/PRODUCTION_RECORD.md`. 새 후보는 해당 제작 기록에 연결하며 임의 새 자산 정본을 만들지 않는다.
**Consumer:** W04의 `src/ui/story/dialogue_stage.gd/.tscn`(신규), W05/W06의 장면·대상 레이어.

| 자산 가족 | 필수 범위 | 제작 계약 | 완료 조건 |
|---|---|---|---|
| 배경 | 입학 장소/교실/복기 장소/축제, 결투 승인 배경 재사용 검토 | 글자·인물·창 없는 16:9; 작동 대상은 분리 | 장소 맥락 일치, crop 안전영역 |
| PLAYER/PEER/TUTOR | 기본 3인; 말하기 강조/우려/안도 상태가 필요한 대사 목록 연결 | 학생 상반신, 동일 비율·시선·책/소품 연속성, 실제 alpha | 밝고 어두운 배경 경계 검수, 얼굴·손 잘림 없음 |
| 대화 프레임 | 기본/선택/포커스/비활성/처리중 | 남색·절제된 금색, 기능 글자 없음 | nine-patch 중앙/모서리 분리, 확대 시 깨짐 없음 |
| 글자/카드 | 네 글자, 단독/조합 표시, 선택/불가/시전중 | 신비한 룬형 획+엔진 이름·뜻. 마법사 인물 카드 없음 | 실표시 크기에서 형태 구별; 의미는 기존 ID |
| 대상/효과 | 용기 차가움/데움/과열, 장치 열림/닫힘, 수집 전/후, 조명 상태 | 같은 canvas/pivot, 효과 독립 | 결과 상태와 눈에 보이는 상태 일치 |

처음부터 모든 표정 변형을 대량 생성하지 않는다. 기본 3인 분리 성공→필요 대사의 우려/안도 순서. neutral 그림을 밝기만 바꾼 것을 새 표정 자산으로 집계하지 않는다. 그림은 이미지 모델 사용; 단순 상태 tint/focus/배치는 엔진 기능이고 삽화 대체 제작이 아니다.

- [x] 승인 원본/consumer/대사별 필요 상태를 확인하고 한 후보 제작 brief를 기록한다.
- [x] 실제 alpha 채널, RGB에 구워진 체크무늬, 안전 여백, hash와 크기를 검사한다. 이번 후보는 alpha 부재로 실패; 투명 가장자리 검수는 진행 불가.
- [x] 실패 후보는 runtime 미등록, 검증된 실패본만 사용자 삭제 검토 폴더로 안내한다.
- [ ] 사용자 최종 선정 후 provenance/상태/consumer 등록, 실제 Godot 두 배경 합성 검수한다.

**완료:** `USER_APPROVED`, `CANON_REGISTERED`, `IMPLEMENTED`, `RUNTIME_VERIFIED`를 각각 입증. 기술 분리 실패 시 S01 임시 승인 합성은 유지하되 다른 장소/표정 완성으로 확대하지 않는다. 새 미술 승인 대기는 코드 안전 작업 W01/W02를 막지 않는다.

### W04. 전 장면 공통 RPG 대화 무대

**현재 → 이유:** S01만 새 구도, S00/S05/S08은 이전 프레임 방식이다. 한국어 화자 이름을 직접 데이터로 사용하는 구조는 이름 변경과 표정 연결에 약하다.

**Create:** `src/ui/story/dialogue_stage.gd`, `.tscn`, `src/ui/story/dialogue_line.gd`, `tests/run_dialogue_stage_tests.gd`.
**Modify:** `story_screen.gd`, `story_dialogue.gd`; 기존 conversation/classroom/portrait/pause 테스트. 구 `story_classroom_view.gd`, `story_portraits.gd`는 새 consumer 검증 전 제거하지 않는다.

**씬 계약:**

```text
DialogueStage (Control)
  Background (TextureRect, input ignore)
  Actors (Control, input ignore)
    Left / Center / Right (TextureRect)
  SafeArea (MarginContainer)
    PlaceAndMenu
    BottomDialogue (PanelContainer)
      Speaker / BodyScroll / Choices / Navigation
  RecordsOverlay / SaveErrorOverlay
```

신규 `DialogueLine extends Resource`: `line_id: String`, `speaker_id: String`, `text_key: String`, `portrait_state: String = "neutral"`, `actor_slots: Dictionary`, `choices: Array[Dictionary]`. speaker는 `PLAYER/PEER/TUTOR/NARRATOR`, slots는 `LEFT/CENTER/RIGHT`, choice는 `{id,text_key,action}`. 첫 장 choice action은 기존 `CAUSE/RISK` 또는 기존 stage 이동에만 매핑한다. 텍스트 키의 실제 문장은 `story_dialogue.gd`가 단독 소유하며 한국어 문자열로 분기하지 않는다.

신규 `DialogueStage.present(line: Resource, font_size: int) -> void`, `set_notice(message: String) -> void`; signals `next_requested`, `previous_requested`, `choice_requested(choice_id: String)`, `records_requested`, `pause_requested`. Stage는 Flow/Store/마력/RNG를 호출하지 않는다.

무대는 화자 1인 강조+다른 인물 유지, narrator는 특정 인물 강조 없음. 1280×720 기준 하단 약 1/3을 시작값으로 하며 32px에서 세로 확장/스크롤한다. 얼굴을 텍스트가 덮지 않도록 asset anchor를 잡는다. 전체 배경 탭은 대사를 넘길 수 있으나 메뉴/선택/스크롤 입력은 전파하지 않는다. 선택은 마지막 대사 뒤에만 보이며 자동선택 없음.

읽기 위치는 현행 계약 유지: 같은 실행의 메뉴 왕복 보존, 저장 로드는 해당 장면 첫 줄. line_id 도입은 현재 단계의 UI cursor 안정화용이지 저장 schema 확장이 아니다. 이전 대사/기록 읽기는 시계나 발견 기록을 만들지 않는다. 아직 안 본 대사·미래 선택을 기록에 노출하지 않는다.

- [ ] 테스트에서 `present()` 전후 story deep-copy 동일, narrator/3인/빈 slot/잘못된 speaker의 안전 fallback을 검사한다.
- [x] 선행 단계: `dialogue_line.gd` Resource와 고정 speaker/line/text ID를 현행 `turns()`에 연결한다. 인물 그림 선택·강조는 한국어 이름 대신 ID를 사용한다. 89 assertions: 원문 일치/ID 고유성/복기 분기/unknown fallback/읽기 불변/Resource 변경 격리. 공통 Stage 또는 표정 구현 완료를 뜻하지 않는다.
- [ ] S00/S01/S05/S08을 같은 Stage로 연결하되 승인된 장소별 배경만 사용한다.
- [ ] 24/28/32px, 이전/다음, CAUSE/RISK, 메뉴 왕복, 기록 복귀 후 포커스 복원을 검증한다.
- [ ] 1280×720/낮은 가로 해상도에서 이름·대사·선택이 잘리지 않는 actual capture를 남기고 commit한다.

**완료:** 네 대화 stage가 공통 연출을 사용, 선택 중복0, 읽기 비용0, 화자/그림 ID 일치. 사용자가 읽는 느낌의 최종 평가는 Human 검수로 남긴다.

### W05. 사건 화면을 장면 속 주문 사용으로 전환

**현재 → 이유:** 사건 논리는 있으나 `_facts()`와 `_receipt_text()` 중심의 검증용 화면이다. 플레이어가 “숫자 조정”보다 “용기를 데우고 누출을 막는다”로 이해해야 한다.

**Modify:** `src/ui/event_session/event_session_screen.gd/.tscn`. **Create:** 같은 폴더 `event_scene_view.gd`, `event_clock_view.gd`, `tests/run_event_presentation_tests.gd`. 기존 core/수치 owner는 변경하지 않는다.

신규 `EventSceneView.present(session: Dictionary) -> void`, signal `target_requested(target_id: String)`, `destination_requested(destination_id: String)`. 대상 hitbox는 실제 target ID에 매핑하고 UI 표시용 label과 분리한다. 신규 `EventClockView.present(current: int, capacity: int, effect_delta: int, time_delta: int) -> void`: 원형 분할 표시+숫자+증감 이유. 그림이 없을 때 기능 게이지는 허용하지만 최종 삽화 완료로 표기하지 않는다.

화면: 상단 장소/목표/위험 → 중앙 대상과 변화 → 하단 배운 글자/선택된 주문 → 대상·목적지 → 예고/명시 시전. 수업·온실·시료·축제의 장면 대사는 W04의 동일 화자 규칙을 사용하되 장시간 대화로 조작 영역을 가리지 않는다. 개발 revision/debug ID는 펼친 진단 기록으로만 남긴다.

입력 규칙: 탭1=글자 선택, 다른 탭=조합, 선택 재탭=해제. drag는 같은 선택 함수를 호출한다. 같은 글자/세 번째 글자/다른 화면 payload는 거절하고 기존 선택 유지. drag 취소/화면밖 release/다른 손가락은 소비0. 배운 글자 재선택으로 invalid된 target/destination만 지우고 적법 선택은 유지한다.

예고는 작용·대상·비용·예상 변화·행동 경과의 위험을 구분한다. `INVALID`는 이유와 함께 차단; 적법한 무변화는 “변화 없음”을 명시한 뒤 기존 규칙대로 사용 가능; 위험한 적법 행동은 경고하되 숨겨진 자동 최적화 없음. 상세 레시피 정답을 자동추천하지 않는다.

사용 예: “모으는 바람 → 꽃가루 → 수집함” 선택 시 수집 효과와 아직 열린 누출원 때문에 행동 후 다시 늘어날 위험을 따로 표시한다. 위험 감소 자체를 사건 해결로 표시하지 않고 core의 goal/outcome을 소비한다.

- [ ] 실제 정의의 모든 target/destination에 화면 hitbox/라벨이 존재하는 실패 검사를 만든다.
- [ ] 탭/drag가 동일 command를 만드는 검사, 화면밖 취소, 스크롤과 drag 구별, 미학습/중복/3번째 거절을 검증한다.
- [ ] effect_delta와 time_delta의 합이 receipt 변화와 같은지, 도움/중단/동시 목표·위험 종료를 검사한다.
- [ ] 네 사건에서 독립 해결·도움·중단을 실제 UI로 확인하고 core 회귀와 함께 commit한다.

**완료:** 모든 사건에 동일 주문 UX, 대상 변화와 시계 이유 표시, 배경 장식이 입력을 가로채지 않음. 손으로 한 모바일 drag 성공은 W11까지 `NOT_RUN`으로 유지한다.

### W06. 결투 손패·조합·상대 예고 완성

**현재 → 이유:** drag와 손패 규칙이 이미 있다. 이를 다시 작성하는 대신 카드 instance와 선택 상태를 이해할 수 있게 만든다. 사건과 달리 제한된 패 안에서 대응하는 차이를 보존한다.

**Modify:** `src/ui/shared_duel/shared_duel_screen.gd/.tscn`, 기존 `tests/run_duel_screen_tests.gd`. **Create:** `src/ui/shared_duel/duel_card_view.gd`, `tests/run_duel_presentation_tests.gd`.

신규 `DuelCardView.bind_card(instance_id: int, glyph_id: String, selected: bool, enabled: bool) -> void`; signal `card_requested(instance_id: int)`, `pair_requested(first_id: int, second_id: int)`. 모델 ID는 그대로 전달하고 glyph ID가 같다고 서로 다른 카드를 합치거나 복제하지 않는다.

상단 상대 인물/공개 예고/결계, 중앙 완성 주문·효과 대상, 하단 손패/내 결계/허용 행동/확정. 선택된 두 카드는 겹친 채 “완성 주문 이름”과 각각의 글자를 보인다. 실제 사용 전 손패에서 영구 제거하지 않는다. 해제하면 원위치. 정돈·휴식·중단은 현재 core가 제공하는 합법 행동만 표시한다. 예고는 실제 quote를 소비하고 선택 변경으로 상대 의도가 바뀌지 않는다.

한 교환의 결과는 “내 주문 → 상대 행동 → 남은 효과 → 결계 변화” 순서로 기존 결과를 보여준다. 애니메이션 도중 결과 재계산 금지. 패배/무승부/중단에서도 이후 이야기로 진행한다. 7/7/6 같은 마력 배분을 고정 규칙으로 추가하지 않는다.

- [ ] 같은 glyph의 다른 instance 선택·겹침 취소·오래된 drag payload·double confirm·이미 사용한 카드 재drop을 검증한다.
- [ ] 탭만으로 단독/조합/취소/기존 보조 행동/확정/복기/다음 이야기를 모두 수행한다.
- [ ] 선택 전후 상대 예고 불변, UI 표시 카드 총량과 session 보존, 저장 복원 뒤 RNG/패/결과 동일을 확인한다.
- [ ] 실제 화면에서 읽을 수 있는 손패와 선택 표식을 검수 후 commit한다.

**완료:** 손패 선택은 단순하고 결과는 core와 동일. 새로운 상대 성향·추가 덱·대회 시스템은 W12의 후속 콘텐츠 명세이며 여기서 무단 추가하지 않는다.

### W07. 결과가 대화와 도감으로 돌아오는 이야기

**현재 → 이유:** S00–S08과 CAUSE/RISK 및 축제 결과 응답은 있지만 활동 화면의 안내와 전후 대화가 충분히 연결되지 않았다. 반복 경험치 대신 실제 행동의 기억으로 성장을 표현한다.

**Modify:** `src/ui/story/story_dialogue.gd`, `story_screen.gd`, `src/core/shared_spell/story_codex.gd`. **Create:** `src/core/shared_spell/story_facts.gd`, `tests/run_story_facts_tests.gd`. 기존 story_flow/conversation/codex 검사 확장.

신규 `StoryFacts.derive(story: Dictionary) -> Dictionary`: 유효 StoryFlow 상태만 받아 `{learned, discovered, contexts, completed, reactions}`의 읽기 전용 projection을 반환한다. 기존 codex의 검증된 receipt 집계를 재사용하며 저장에 또 다른 독립 진실을 만들지 않는다. fact key는 `(activity stage, command id, fact type)`로 중복 제거한다. 주인공 이름·관계 숫자·금전 보상은 추가하지 않는다.

| 장면 | 필수 서사 역할 | 조건별 차이 |
|---|---|---|
| S00 입학 / S01 안내 | 학생으로 함께 시작, 대상과 작용 소개 | 미래 사건 정답 선공개 없음 |
| S02 수업 | 작은 열과 대상 선택을 실제로 배움 | 독립 해결/도움/중단 각각 사실대로 반응 |
| S03 연습 결투 | 같은 글자를 상대 대응에 사용 | 승패와 배운 점 분리, 패배로 막지 않음 |
| S04 온실 | 원인과 위험을 나눠 판단 | 수치 감소와 근본 해결의 차이 전달 |
| S05 복기 | CAUSE/RISK를 스스로 설명 | 도덕 점수 대신 선택별 교수 응답 |
| S06 시료 | 대상 보존을 고려한 응용 | 실제 시료 상태/도움 여부를 기록 |
| S07 축제 / S08 마무리 | 생활 속 응용과 동료의 기억 | SOLVED/ASSISTED/STOPPED에 맞는 끝맺음 |

조건문은 사건 결과/receipt 사실만 사용한다. “도움을 받았지만 해냈다”와 “혼자 해결했다”를 혼동하지 않는다. 읽은 문장 자체가 마력/해금/진행을 변경하지 않는다. 도감은 실제 발견 주문과 대표 맥락을 표시하고 미시전 preview는 기록하지 않는다. 도감 재연습은 첫 장 필수 완료 범위에서 제외하고 W12에 분리한다.

- [ ] 잘못된 receipt/미래 stage/중복 command를 projection에서 거절하는 검사를 만든다.
- [ ] 각 사건 종료3종과 결투 결과별 대사 기대문장을 검사한다. 분기 조건에 표시 이름을 쓰지 않는다.
- [ ] 메뉴 왕복/기록100회/저장로드로 facts·발견 수가 증가하지 않는지 검증한다.
- [ ] 실제 S00–S08을 읽어 등장인물의 지식·장소·결과 모순을 고친 후 commit한다.

**완료:** 첫 장의 행동→결과→대화→도감 연결, 단순 승리문구 반복 감소. 장기 관계 서사 전체 구현으로 주장하지 않는다.

### W08. 전체 화면 설정·입력 접근성

**현재 → 이유:** 크기 설정이 대화 본문에만 적용되어 예고/버튼/결과는 상대적으로 작게 남을 수 있다. 기본 메뉴 기능과 최종 메뉴 시각 완성도도 별개다.

**Modify:** `src/core/shared_spell/story_preferences.gd`, `src/ui/story/story_menu.gd`, W04–W06 UI, `src/ui/theme/grimoire_theme_factory.gd`; 기존 preferences/menu/pause 테스트.
**Create:** `tests/run_story_accessibility_tests.gd`.

신규 설정 payload `{font_size: 24|28|32, reduced_motion: bool, master_volume: float, music_volume: float, effects_volume: float}`. 음량은 0..1 유한값만 허용. 기존 font-only 유효 저장을 읽을 때 새 필드는 기본값(모션 감소 false, 음량1)으로 메모리 보완하며 원본을 몰래 재저장하지 않는다. 실제 audio bus가 없는 동안 조절기를 “완료 기능”으로 보여주지 않는다.

본문·선택·도감·주문 뜻·예고·시계 설명·오류 안내 모두 크기 계층 적용. 56px 터치 목표는 초기 제작 기준이며 실기기 보장 아님. Tab/방향키/확정/취소와 탭만으로 전과정 수행; drag는 보조다. 상태 색상 외 라벨/표식 병행. focus가 사라지면 가장 가까운 기존 의미 ID의 버튼으로 복구한다.

- [ ] 모든 핵심 텍스트 consumer가 설정을 읽는 검사, 잘못된 음량/타입/구 설정 호환 검사를 만든다.
- [ ] 설정 저장 실패 시 유효 설정 유지, 메뉴 왕복 시 미시전 선택 보존을 검증한다.
- [ ] 확대 후 스크롤·선택지·확정·취소가 화면 밖에 영구 숨지 않는지 검사한다.
- [ ] 키보드/마우스 실제 조작을 확인하고 모바일은 W11에 구분해 commit한다.

**완료:** 첫 장 모든 화면의 중요 정보 확대와 비drag 완주, 진행 상태·RNG·마력 불변. 스크린리더 지원 등 확인하지 않은 기능을 포함해 접근성 전체 PASS라 하지 않는다.

### W09. 결과 기반 연출·오디오

**현재 → 이유:** 그림이나 상태 숫자가 바뀌는 것만으로 주문의 질감과 위험의 해소가 충분히 전달되지 않는다. 동시에 연출 중 skip/종료가 논리를 중복 실행하면 안 된다.

**Create:** `src/ui/shared_spell/spell_feedback_player.gd`, `tests/run_spell_feedback_tests.gd`. **Modify:** event/duel UI와 settings audio consumer. 폴더 신설은 공통 연출 파일 한 곳을 위한 것일 뿐 도메인 이동이 아니다.

신규 `play_result(command_id: String, presentation: Dictionary, reduced_motion: bool) -> void`, `skip() -> void`, signal `finished(command_id: String)`. presentation은 이미 해소된 `target_id/effect_id/before/after`이며 act/apply callable을 받지 않는다. 같은 view 생애의 같은 command ID는 재생 요청 중복을 무시한다. 복기 재생은 별도 presentation-only 요청이며 게임 state를 변경하지 않는다.

선택120ms/준비180ms/방출240ms/결과220ms/회복180ms는 본책의 제작 시험값을 사용한다. 움직임 감소 시 이동·흔들림을 생략하고 결과 표식은 유지한다. 저장 실패 때 연출 재생 여부와 무관하게 W01 잠금을 유지한다. 효과 누락 시 결과 텍스트로 fallback하고 성공/위험 숫자는 지우지 않는다.

음원: 종이 선택음, 잉크 시전음, 바람/열/차단 구분, 낮은 위험 알림, 완료/도움 확인. UI/BGM/SFX bus 분리. 출처·라이선스·원본·소비처·볼륨을 기록한다. 무료/기존 연결 도구 우선, 음원 권리 미확인 시 출시 미승격.

- [ ] play 중복/skip2회/화면해제/메뉴일시정지에도 story·RNG·receipt 불변을 검사한다.
- [ ] 시계 증가/감소와 대상 변화의 실제 결과에 효과를 바인딩한다.
- [ ] 모션 on/off와 음소거에서도 결과를 이해할 수 있는지 확인한다.
- [ ] 실제 청감과 alpha 경계를 검수하고 별도 증거를 기록 후 commit한다.

**완료:** 명시 시전의 감각적 피드백, 연출 실패가 진행을 막지 않음. 최종 청감/과민성 검수는 사람이 확인해야 한다.

### W10. 콘텐츠 검증과 사람용 본책 갱신

**현재 → 이유:** 본책의 main/폴더/구현 상태/인원수/저장 제안이 실제 브랜치와 달라 새 작업자가 이미 끝난 기능을 다시 만들 위험이 있다. 상태 문구만 검색해 게임 완료를 판정할 수 없다.

**Create:** `tests/test_current_story_content_contract.py`(표시 콘텐츠·경로 계약용). **Modify:** `docs/superpowers/specs/2026-09-11-human-blueprint.md`, 해당 manifest/발행 도구는 기존 `tools/build_human_blueprint_pdf.py`, `docs/DESIGN_DOCUMENT_REGISTRY.json`을 사용한다. 새 본책 복제 없음.

검증 대상: S00–S08 참조 누락, 중복 line_id, 잘못된 speaker/portrait state, 없는 대상 ID, 모든 10주문 표시 키, 정의되지 않은 choice action, 장면 밖 배경 참조, 미승인/실패 alpha 자산의 최종 consumer 등록. 실제 수치를 Python에 재구현하지 말고 데이터 존재/연결만 확인한다.

- [ ] 경로/ID/consumer 누락 fixture가 실패하는 검사를 만든다.
- [ ] 본책의 구현 지도·대화 3인·현행 schema·증거 경계를 교정한다. 과거 snapshot은 이력으로 남긴다.
- [ ] milestone에서 기존 생성기로 PDF를 재발행하고 모든 페이지 한글/표/시각자료를 렌더 검사한다.
- [ ] source hash/그림 hash/manifest/PDF가 같은 입력을 가리키는지 검증 후 commit한다.

**완료:** 사람이 읽는 본책과 구현 지도가 일치, 문서 검사와 runtime/사람 검수는 분리. 이번 잔여 작업 계획 작성만으로 PDF를 최신이라고 하지 않는다.

### W11. 실제 첫 장 인계·기기·통합 검증

**현재 → 이유:** 최근 개별 runner·PC 캡처는 있지만 이것이 최신 전체 회귀/모바일/출시 증거는 아니다. 브랜치와 보호 main도 아직 다르다.

**Modify:** 영향받는 기존 runner, 프로젝트 CI의 실제 runner 등록 위치(실행 시 `.github/workflows/` 소비처 조사); 관련 Active Context/검증 기록. **Create:** `docs/validation/FIRST_CHAPTER_DELIVERY_20260914.md`는 실행 증거가 생기는 때에만 작성한다. 비어 있는 PASS 표를 선제 제작하지 않는다.

| 시험 | 필수 시나리오 | 합격/미완료 판단 |
|---|---|---|
| 규칙 회귀 | 공통 의미/사건/결투/저장/이야기 전체 + 보존 legacy | runner 완료·exit0·실패0 확인; 누락 출력은 UNVERIFIED |
| 전체 UI | 새 게임→S08, 도움/중단/패배 분기, 마지막 메인 | 도중 수동 데이터 수정 없이 완주 |
| 저장 장애 | W01/W02 실패·재시도·손상 슬롯·앱 재실행 | 기존 정상 기록 보존, 중복 효과0 |
| PC 표시 | 작은 가로 화면/1280×720/와이드, 24/28/32px | 겹침·화면 밖 필수 입력·focus trap 없음 |
| 모바일 | 실제 기기/OS 기록, 한손 탭·drag·백그라운드 복귀 | 관찰한 기기만 PASS; 에뮬레이션과 구분 |
| 성능 | 장면 이동 반복, 텍스처 메모리, frame time 기록 | 임시 목표30fps; 실기기 기준과 측정치 함께 제시 |
| Human | 처음 보는 사람이 대상/조합/위험·목표 차이를 설명 | 단순 성공률보다 혼동 위치와 행동 변경 관찰 |
| 아트/오디오 권리 | 승인·원본·해시·소비처·라이선스 | 누락 자산은 출시 제외 또는 권리 확보 |
| Git 전달 | 정확한 branch head 검증→PR→필수checks→허용merge→main readback | branch push만으로 main 완료 주장 금지 |

- [ ] 실행 바이너리/프로젝트 경로/현재 head/dirty/open PR을 기록하고 테스트 명령을 해당 실행 환경으로 고정한다.
- [ ] 순수 규칙→UI→실제 Godot→export→기기 순서로 검사하며 실패를 수정하고 해당 회귀를 반복한다.
- [ ] headless import 종료 시 plugin leak 경고는 별도 최소 재현으로 조사한다. runtime clean과 혼합하지 않는다.
- [ ] 첫 장 패키지와 실제 검증된 진입 방법을 제공한다. 권한 없는 배포·스토어 제출은 하지 않는다.
- [ ] 다른 작업 diff를 섞지 않은 PR/정상 절차로 반영하고 main에서 재조회한다. 삭제 대상은 사용자 검토 폴더 링크만 전달한다.

**완료:** 첫 장 사용자 테스트 가능 인계. Human/모바일/출시 중 남은 게이트가 있으면 부분 인계라고 쓴다. 이 조건을 충족해도 전체 장기 게임 완성이 아니다.

### W12. 장기 게임 확장 설계 패킷

**현재 → 이유:** 실행 가능한 범위는 입학부터 첫 축제 마무리의 한 장이다. 사용자의 목표는 장기 마법학교 생활 전체이므로 이후 콘텐츠를 잊지 않되, 미확정 장 수/플레이타임/엔딩을 이미 승인된 것으로 만들지 않는다.

**설계 owner:** 기존 사람용 본책의 장기 확장 절을 갱신한다. 과거 `docs/planning/WORLD_CHARACTER_THREE_YEAR_STORY_01_APPROVAL_2026-08-11.md`는 9월 재기획과 요소별 KEEP/CHANGE/DEFER 대조를 먼저 한다. 역사 문서 테스트가 통과한다는 이유로 고유 이름·학년 구조를 자동 runtime 주입하지 않는다.

| 후속 패킷 | 반드시 정할 것 | 구현 진입 조건 |
|---|---|---|
| 장기 학교 일정 | 학년/학기/장 구성, 필수/선택 활동, 분량 예산 | 현재 3년안과 재기획 대체 관계 확인 |
| 수업 확장 | 새로운 작용 1개마다 기존10주문·대상과 조합 의미 | 결투+비전투 최소 한 사건에서 같은 뜻 검증 |
| 결투 상대 다양화 | 공개 행동 성향·덱·학습 목표·반격 가능성 | 미래정보 누설/선택 후 의도 변경 없음 |
| 동료 관계 서사 | 실제 사건 목격·대화 변화·재등장 조건 | 주문 종류를 성격/선악 점수로 직결하지 않음 |
| 재연습 | 도감에서 기출 과제 재도전, 별도 transient session | 본편 마력/결과/해금/보상 중복 영향0 |
| 장기 사건 시계 | 여러 장면에 걸친 위험, 공개/비공개 여부, 도움 경로 | 행동 시간 규칙·저장·실패 후 진행 명세 |
| 최종 장/마무리 | 지금까지의 사용/보존 사실이 반영되는 결과 | 첫 장 결과를 지우지 않는 전체 서사 검수 |

- [ ] 기존 결정/삭제 방향/실행코드의 요소별 유지·변경표를 작성한다.
- [ ] 공식 유사작 사례를 ADOPT/ADAPT/REJECT로 비교하고 이번 게임의 적용 이유와 차별점을 기록한다.
- [ ] 후속 한 장을 `장면 ID→플레이 행동→사건/결투→결과 fact→후속 반응→자산→저장→테스트`로 끝까지 작성한다.
- [ ] 의미가 바뀌는 방향 결정만 사용자에게 제시하고, 일반 기술 세부는 기존 승인 범위에서 권장값으로 작성한다.

**완료:** 후속 한 장이 실제 코드 단위로 나뉜 설계. 전체 미래 장편의 상세 명세가 이미 완료됐다고 표현하지 않는다. 일정 추정은 W03 자산 분리 성공과 W11 플레이 관찰 후 실제 제작량으로 갱신한다.

## 6. 유지·수정·삭제/보류 권장표

| 현재 상태 | 권장 조치 | 이유 | 기대효과 |
|---|---|---|---|
| 의미·사건·결투 순수 core와 재현 검사 존재 | 유지, UI는 결과만 소비 | 재구현하면 같은 주문의 뜻이 갈라짐 | 일관성·회귀 비용 절감 |
| 저장 실패 알림만 있고 일부 전진 가능 | W01 우선 수정 | 정상 저장과 화면 상태 불일치 | 진행 손실 위험 감소 |
| 교실 합성만 새 구도 | W03/W04로 독립 레이어 교체 | 장소/화자/표정 변경 불가 | 이야기 연출 재사용 |
| 검증판 사실 목록이 기본 화면 | W05/W06에서 장면·예고/복기로 재배치 | 내부 상태가 대사를 대신함 | 몰입과 판단 정보 함께 보존 |
| 카드 drag 이미 존재 | 유지·검수·탭 동등성 강화 | 새로 만들 필요 없음 | 입력 회귀 최소화 |
| 초상2인/옛 main/폴더/저장제안 문서 | 최신 관계를 명시하고 W10 발행 교정 | 오래된 설계가 구현 중복 유발 | 다음 작업자 오판 감소 |
| RGB 체크무늬 실패 자산 | runtime 제외, `.cleanup-review`에서 사용자 삭제 | 투명 자산이 아님 | 깨진 화면·용량 낭비 방지 |
| 과거 별형/필기/구 수치 도메인 | 현재 소비처와 회귀 조사 전 물리 삭제 보류 | 역사 테스트/기존 저장 참조 가능 | 손실 없는 단계적 정리 |
| 임시 보고서·겹치는 새 관리 시스템 | 추가하지 않음 | Active Context/본책/이 계획으로 책임 충분 | 정본 분산 억제 |
| 공용 저장/자산 실패 교훈 | 프로젝트 검사에 우선 반영, 반복 검증 후 Base 후보 | 한 프로젝트 추정만으로 공용 강제는 위험 | 실제 재사용 가능한 개선 |

## 7. 실행 명령과 증거 경계

실행 전 `$godotExe`는 fresh-read한 해당 프로젝트 엔진 절대경로로 설정한다. 전역 고정 바이너리/PID를 문서에서 추정하지 않는다. 아래는 실행 템플릿이며 이번 명세 작업에서 실행한 게임 테스트 목록이 아니다.

```powershell
& $godotExe --headless --path . --script res://tests/run_story_screen_tests.gd
& $godotExe --headless --path . --script res://tests/run_event_screen_tests.gd
& $godotExe --headless --path . --script res://tests/run_duel_screen_tests.gd
& $godotExe --headless --path . --script res://tests/run_story_flow_tests.gd
& ./.agents/skills/grimoire-workflow-router/scripts/validate_operating_contract.ps1 -BaseRoot C:/Users/user/Documents/GitHub/Base
git diff --check
```

각 작업은 RED fixture→실패 확인→최소 구현→영향 runner GREEN→실제 소비처 확인→문서/선택 파일 commit 순으로 수행한다. 새 runner는 해당 작업에서 만든 이후 실행 목록에 추가한다. UI 테스트가 headless에서 통과해도 실제 클릭/터치가 성공했다고 기록하지 않는다.

## 8. 이번 명세의 적대적 검토 5회

매 회차 전체 범위(플레이어 의도/권위/코드·자산/저장·복구/권리·비용/외부 근거/검증 상한)를 재검토했다. 아래는 각 회차의 대표 수정이며 코드 실행 검증이 아니다.

| 회차 | 공격과 발견 | 판정·반영 |
|---|---|---|
| 1 | “남은 것”에 이미 구현된 core/drag를 신규 기능으로 넣을 위험 | MUST_FIX: 실제 함수 확인, W05/W06은 완성·회귀로 구분 |
| 2 | 저장 서비스 검사가 화면 전진 안전까지 증명한다고 오인 | MUST_FIX: advance/checkpoint 확인, W01 후보 이동과 확정 후 실패를 분리 |
| 3 | 새 교실 승인으로 alpha/모든 장소/표정 승인까지 간주할 위험 | MUST_FIX: W03 상태군·기술검수·최종 승인과 fallback 경계 명시 |
| 4 | PDF/옛3년 테스트/원격 main을 현재 브랜치 완성의 근거로 사용할 위험 | MUST_FIX: 관찰 head와 역사 대체 관계, W10/W12 별도 gate |
| 5 | 계획 완성을 게임/모바일/출시 완료로 주장하거나 유료도구·신규보상을 슬쩍 추가 | MUST_FIX: source_only 계획, 명시 제외, 단계별 증거·남은 범위 기록 |

구현 가능성: **PARTIAL**. 실제 Godot 코드/씬/데이터/테스트 접점은 확인했으나 새로운 alpha 자산, 배포 I/O, 최종 모바일 UI는 아직 증명되지 않았다. post-merge 검토는 병합을 수행하지 않은 이번 작성에서는 `NOT_RUN`이다.

## 9. 다음 실행자의 시작점

첫 작업은 **W01 저장 실패 시 전진 차단**이다. 테스트에서 현행 결함을 먼저 재현하고 StoryScreen과 자식 화면의 입력 잠금을 함께 수정한다. W03 자산 분리는 그 다음 준비 경로다. 전체 게임을 새로 만드는 선언 대신 위 독립 완료 단위를 실제 검증과 연결해 차례로 닫는다.

이 문서를 읽은 사용자가 지금 결정해야 할 일반 기술 질문은 없다. 새 미술 최종 선정·장기 서사의 의미 변경·출시 같은 별도 결정만 해당 단계에서 필요한 근거와 함께 다룬다.
