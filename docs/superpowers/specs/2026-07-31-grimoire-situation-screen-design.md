# GRIMOIRE 상황별 인게임 화면·상태 구현 설계

## 0. 문서 상태

```yaml
decision_id: GM-SITUATION-SCREEN-SPEC-01
status: USER_REVIEW_REQUIRED
spec_role: MASTER_DESIGN
benchmark: GR-BM-SITUATION-SCREEN-01
implementation_authority: NONE
code_authoring: PROHIBITED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
art_style: USER_DECISION_REQUIRED
next_after_approval: DETAILED_IMPLEMENTATION_PLAN_AFTER_ART_AND_TECHNICAL_GATES
```

관련 문서:

- 작업지시문: `docs/workflows/PROJECT_SITUATION_SCREEN_IMPLEMENTATION_SPEC_WORK_ORDER.md`
- 벤치마킹: `docs/planning/benchmarks/GM_SITUATION_SCREEN_ARCHITECTURE_BENCHMARK_2026-07-31.md`
- P0 상세 1: `docs/superpowers/specs/grimoire-situations/P0_01_ENTRY_FIELD_DIALOGUE.md`
- P0 상세 2: `docs/superpowers/specs/grimoire-situations/P0_02_SCHEDULE_SPELL_BATTLE.md`
- P0 상세 3: `docs/superpowers/specs/grimoire-situations/P0_03_RESULT_RETURN_GRIMOIRE.md`
- 화면 보드·P1~P3: `docs/superpowers/specs/grimoire-situations/SITUATION_BOARD_AND_BACKLOG.md`

이 문서는 코드 작성 전 설계다. 아래 `res://` 경로는 모두 제안이며 실제 파일이 아니다.

---

# 1. 프로젝트 핵심 경험

## 1.1 핵심 정의

| 항목 | 현재 기준 |
|---|---|
| 장르 | 마법학교 성장 RPG + 상황 해결형 마법 설계 |
| 1차 플랫폼 | PC |
| 후속 플랫폼 | Mobile |
| 예상 Slice | 목표 46분, 콘텐츠 상한 53분, 하드 상한 60분 |
| 플레이어 역할 | 일반 가정 출신 장학생 신입생 |
| 핵심 판타지 | 의미를 가진 글자를 직접 쓰고 조합해 세계의 흐름을 바꿈 |
| 핵심 감정 | 긴장 속 이해, 내 해결법의 발견, 결과에 대한 책임, 동반 정령과의 애착 |
| 주요 선택 | `흐름 / 집중 / 분산`, 대상, 위험, 자유일정, 결과의 우선순위 |
| 주요 고민 | 효율 대 안정, 속도 대 피해, 묘목 대 구조물, 직접 작성 대 복구 |
| 주요 보상 | 새 원리 이해, 결과 태그, 마도서 기록, 관계 반응, 다음 학습 목표 |
| 기억 장면 | 첫 글자 성공, 시험의 복수 해법, 축제 장막 변화, 폭주 정령 진정, 현장 복귀 기록 |
| 세일즈포인트 | 직접 작성과 의미 조합, 입력 실패와 설계 실패 분리, 설명 가능한 세계 변화 |
| 마스코트 | 작은 늑대형 원소 정령수 초기 형상 |
| 차별점 | 주문 목록 선택이 아니라 상황을 읽고 글자 의미를 설계해 결과와 대가를 기록 |

## 1.2 핵심 플레이 루프

```text
세션 시작
→ 장소·목표 확인
→ NPC·환경 관찰
→ 상황의 힘·위험·제약 파악
→ 메인·보조 글자 판단
→ 직접 작성·인식 확인·조합
→ 비용·위험 확인 후 명시적 시전
→ 세계·전투 결과 확인
→ 성공·부분 성공·실패 원인 복기
→ 마도서 기록·관계·진행 상태 변화
→ 다음 일정
```

## 1.3 화면 설계 원칙

1. 첫 3초 안에 장소, 목표, 위험 중 최소 두 개가 읽힌다.
2. 입력 인식 실패, 문법 실패, 비용 부족, 상황 부적합을 구분한다.
3. UI는 도메인 판정을 계산하지 않고 권위 결과를 표시한다.
4. 대화·전투·작성으로 전환해도 같은 장소·대상·목표를 잃지 않는다.
5. 성공만 보여 주지 않고 포기한 것과 부작용을 함께 보여 준다.
6. 메인 동반 정령은 감정·관찰을 연결하지만 정답을 제공하지 않는다.
7. 자유일정과 결과 화면은 다음 행동 동기를 만든다.
8. 역할이 없는 독립 메뉴·미니게임·연출 화면은 만들지 않는다.

---

# 2. 현재 시각·UI·UX 방향

## 2.1 확정

- 가로형 16:9 Safe Frame.
- 18:9~20:9는 좌우 World·배경 확장.
- 학교·자유일정·비전투 탐색: 고정·장면 기반 3/4 필드.
- 필드: 3.5~4등신 SD.
- 대화: 같은 장소 배경 위 반신 일러스트.
- 전투: 별도 고정 3/4 전술 전투장.
- 전투 캐릭터: 필드 SD 비율·기본 골격 재사용.
- 작성: 화면 감속·암전 + 작성 Overlay.
- 결과: 필드 환경 변화로 복귀.
- 필수 정보는 색·표정·음향 하나에만 의존하지 않음.

## 2.2 미확정

- 후보 A/B/C 중 최종 그림체.
- 컬러 팔레트.
- 폰트 계층과 실제 Font.
- 아이콘·패널·버튼 최종 스타일.
- 내부 기준 해상도.
- 정확한 UI 치수.
- 마법 작성 감속률.
- 마법 획 인식 허용치.

## 2.3 구현 제안

- `Theme` Resource 하나를 UI 공통 권위로 사용.
- 상태 색은 의미 보조로만 사용하고 아이콘·라벨·형태 병행.
- UI는 `Control + Container + Anchor` 기반으로 구성.
- 16:9 중앙 Safe Frame에 필수 정보 배치, 초광폭은 World 확장.
- 작성 궤적은 배경보다 높은 대비와 독립 Stroke Layer 사용.

---

# 3. 현재 화면·파일 구현 현황

## 3.1 실제 제품 파일

Repository 검색 결과:

```text
project.godot = NOT_FOUND
*.tscn = NOT_FOUND
*.gd = NOT_FOUND
*.tres = NOT_FOUND
제품 JSON·CSV 데이터 = NOT_CONFIRMED
```

현재 재사용 가능한 것은 Scene·Script가 아니라 승인 문서 계약이다.

## 3.2 문서·운영 충돌

| 항목 | 최신 권위 | 충돌·주의 |
|---|---|---|
| Base | AGENTS·Registry는 v9.3 | `docs/BASE_RULES_VERSION.md`는 v8·2026-07-29 값 |
| Adapter | v9.3 정합화 진행 중 | `PROJECT_BASE_ADAPTER.json` 본문은 v9.1·Sheet conflict 잔존 |
| 제품 구현 | NOT_STARTED | Issue #21도 제품 파일 생성 금지 상태 |
| Art | ART-STYLE-01 미승인 | 구조 명세는 가능하지만 최종 자산 치수·Style 확정 불가 |

본 명세는 최신 사용자 지시→AGENTS→현재 확정 결정→기획 정본 순으로 해석한다. Base Adapter·Version의 stale 값은 운영 정합화 후행 이슈로 분리한다.

## 3.3 기존 구조 매핑

| 상황 | 기존 Scene | 기존 Script | 기존 데이터 | 재사용 가능 | 신규 필요 | 수정 위험 |
|---|---|---|---|---|---|---|
| 메인 진입 | 없음 | 없음 | 최소 저장 계약 문서 | 문서 계약 | Main UI·Save Slot | 중 |
| 학교 필드 | 없음 | 없음 | 장소·세션 기획 | 화면 구조 | Field Scene·Location Resource | 중 |
| 대화 | 없음 | 없음 | 인물·역할 문서 | 반신 구조 | Dialogue Runtime·Data | 중 |
| 자유일정 | 없음 | 없음 | `휴식/준비/교류`, 태그 | 규칙 | Schedule UI·Effect | 중 |
| 작성 | 없음 | 없음 | UX 흐름·입력 계약 | 강한 문서 재사용 | Stroke·Recognition Interface·Composer | 높음 |
| 전투 | 없음 | 없음 | 별도 전술장·현장 문제 | 목표·구조 | Battle Runtime | 높음 |
| 결과 | 없음 | 없음 | 결과·부작용·태그 | 규칙 | Result UI·Resolver View | 중 |
| 필드 복귀 | 없음 | 없음 | 결과 환경 반영 | 규칙 | Snapshot·World State Applier | 높음 |
| 마도서 | 없음 | 없음 | 기록 필드 확정 | 데이터 의미 | Grimoire UI·Entry State | 중 |

---

# 4. 필수 기준 화면 4종

# SCREEN-01 메인·시작 화면

## 4.1 현재 정의 상태

- 문서 정의: 세션 경계 저장은 있으나 메인 메뉴 배치 없음.
- 실제 Scene·Script·Resource: 없음.
- 구현 여부: `NOT_DEFINED / NOT_IMPLEMENTED`.
- 신규 필요: 최소 진입·이어하기·설정·종료 화면.

## 4.2 시각 방향

- 확정: 16:9, 마법학교·마도서·동반 정령 상징과 전체 게임 시각 언어를 공유해야 함.
- 제안: 배경은 현재 진행 장소의 정적 변형 또는 마도서 표지; 버튼은 4개 이하.
- 미확정: 최종 일러스트·팔레트·Logo.

## 4.3 UX 방향

- 목적: 새 게임 또는 최근 세이브로 1~2단계 안에 진입.
- 첫 정보: `Continue 가능 여부`, 최근 세션·장소·플레이 시간.
- 오작동 방지: New Game이 기존 Save를 덮는 경우 확인 Modal.
- 취소: 설정·세이브 선택에서 Esc로 복귀.
- 반복 피로: 매 실행마다 긴 연출·공지 강제 금지.

## 4.4 현재 확인안

```text
[현재 문서에 배치 정의 없음]
```

## 4.5 개선 제안안

```text
┌──────────────────────────────────────────────────────────────┐
│ GRIMOIRE 로고                           설정 / 종료            │
│                                                              │
│                  [ 이어하기 ]                                │
│                  [ 새 학기 시작 ]                            │
│                  [ 저장 기록 선택 ]                          │
│                                                              │
│ 최근 기록: 장소·세션·시간·동반 정령 상태                     │
│ Build / Save Version                                         │
└──────────────────────────────────────────────────────────────┘
```

## 4.6 구성요소

| 요소 | 역할 | 위치 | 표시 조건 | 입력 | 상태 |
|---|---|---|---|---|---|
| Logo | 게임 식별 | 상단·중앙 | 항상 | 없음 | 자산 미정 |
| Continue | 최근 Save 로드 | 중앙 1순위 | 유효 Save | 클릭·Enter | 신규 필요 |
| New Game | 초기 Session 생성 | 중앙 | 항상 | 클릭 | 신규 필요 |
| Save Select | 다른 Slot | 중앙 하단 | Save 2개 이상 후보 | 클릭 | P1 후보 |
| Settings | 접근성·음량 | 우상단 | 항상 | 클릭·Esc 복귀 | 신규 필요 |
| Recent Summary | 로드 대상 확인 | 하단 | Continue 가능 | 없음 | 신규 필요 |
| Error Banner | Save 손상·버전 불일치 | 상단 | 오류 | 확인 | 신규 필요 |

## 4.7 상태 변형

- 최초 실행: Continue 숨김, New Game 강조.
- Save 없음: 빈 상태 설명.
- Continue 가능: 최근 기록 요약.
- Save 손상: 복구·백업·새 시작 선택.
- Migration 필요: Save version 경고.
- 전환 중: 모든 버튼 비활성, Progress 표시.
- Tutorial 중: 최초 New Game 이후 화면 내부가 아니라 세션에서 안내.

## 4.8 연결·Godot

```text
ApplicationRoot
└─ UIHost
   └─ MainMenuScreen [Control]
      ├─ MainActions [VBoxContainer]
      ├─ RecentSavePanel [PanelContainer]
      ├─ ErrorPanel [PanelContainer]
      └─ SettingsButton [Button]
```

- 방식: Application Root의 초기 UI 상태.
- Signals: `new_game_requested`, `continue_requested(slot_id)`, `settings_requested`, `quit_requested`.
- Resource: `MainMenuViewDefinition`은 필요하지 않으며 Theme·Save Metadata 사용.
- 완료: Save 유무·손상·전환 상태가 구분되고 중복 로드가 차단됨.

---

# SCREEN-02 별도 전술 전투·핵심 플레이 화면

## 4.9 현재 정의 상태

- 문서: 별도 고정 3/4 전술 전투장 확정.
- 실제 Scene·Script·Resource: 없음.
- 핵심 존재: 주인공, 폭주 정령, 수호형 보조 소환수, 환경 목표·압력원.
- 시간 정책: `PLAYTEST_TUNING_REQUIRED`.

## 4.10 시각 방향

- 장소 색·건축·핵심 오브젝트를 필드에서 계승.
- 작은 고정 전투장, 자유 Camera·대형 이동 맵 제외.
- 대상·위험·압력원·수호 범위가 FX보다 우선.
- 필드 SD 기본 골격 재사용.

## 4.11 UX 방향

- 첫 정보: 현재 목표와 파괴가 아닌 진정 조건.
- 주요 행동: 이동·대상 확인·수호 호출·Spell Composer 진입.
- 입력 수: 핵심 시전 버튼까지 1회, 글자 작성은 별도 Overlay.
- 취소: Composer 전에는 Target 취소 가능, Commit 이후 결과까지 취소 불가.
- 숙련: 키보드 단축키로 대상·Spell 진입.

## 4.12 현재 확인안

```text
필드 위험 확인
→ 짧은 전환
→ 별도 3/4 전술 전투장
→ 작성 Overlay
→ 결과
→ 필드 복귀
```

## 4.13 개선 제안안

```text
┌──────────────────────────────────────────────────────────────┐
│ 목표: 정령을 파괴하지 않고 압력 근원을 끊기    위험 단계 2/3 │
├───────────────┬──────────────────────────────────────────────┤
│ HP / Mana     │  [보호 대상]       [폭주 정령]               │
│ 수호 상태     │       [주인공]   [압력원·위험 범위]          │
│ 현재 글자     │        고정 3/4 전술 플레이 공간             │
├───────────────┴──────────────────────────────────────────────┤
│ 대상 변경   수호 호출   [마법 설계]   취소/일시정지            │
└──────────────────────────────────────────────────────────────┘
```

## 4.14 상태 변형

- 전투 Intro.
- 일반 Control.
- 적 위험 행동 예고.
- 수호 활성·만료.
- Spell Targeting.
- Spell Overlay active.
- Mana 부족.
- 잘못된 대상.
- 부분 해결.
- Victory pending.
- Defeat pending.
- Pause.

## 4.15 Godot

```text
BattleScene [Node2D]
├─ BattleDirector [Node]
├─ BattleStateMachine [Node]
├─ BattleClock [Node]
├─ ArenaArt [Node2D]
├─ UnitLayer [Node2D]
│  ├─ PlayerBattleActor [CharacterBody2D]
│  ├─ EnemyActor [CharacterBody2D]
│  └─ GuardSummonActor [Node2D]
├─ ObjectiveLayer [Node2D]
│  ├─ PressureSource [Area2D]
│  └─ ProtectedTarget [Area2D]
├─ TelegraphLayer [Node2D]
├─ BattleCamera [Camera2D]
└─ BattleHUD [CanvasLayer]
```

- Battle Scene은 독립 World Scene.
- Spell Overlay는 `ApplicationRoot/UIHost`에 인스턴스.
- `BattleDirector`는 Result를 계산한 도메인 서비스의 결과만 적용.
- 완료: 목표·대상·위험이 16:9와 초광폭에서 읽히고 전투→작성→전투가 상태 손실 없이 왕복.

---

# SCREEN-03 마도서·보유 지식·준비 상태 화면

## 4.16 현재 정의 상태

- 전통적 아이템 인벤토리: 문서에서 정의되지 않음.
- 대응 화면: 마도서 기록, 배운 글자, 최근 발견, 소환수 준비 상태.
- 확정: 완성 주문 자동 시전 목록이 아님.
- 실제 Scene·Script·Resource: 없음.

## 4.17 시각·UX 방향

- 목적: 무엇을 소유했는가보다 **무엇을 배웠고 어떤 결과를 만들었는가**를 확인.
- 최초 정보: 최근 기록과 현재 학습 글자.
- 주요 행동: 기록 열기, 글자 의미 재열람, 현재 준비 상태 확인.
- 금지: 기록 클릭 즉시 자동 시전, 최적 조합 추천.

## 4.18 현재 확인안

```text
상황 → 글자·조합 → 의도 → 실제 결과 → 부작용 → 발견 → 플레이어 명명
```

## 4.19 개선 제안안

```text
┌──────────────────────────────────────────────────────────────┐
│ 마도서     [최근 기록] [배운 글자] [현재 준비]               │
├───────────────────────┬──────────────────────────────────────┤
│ 기록 목록             │ 상황·의도·결과                       │
│ - 수업 수로           │ 사용 글자: 흐름 + 분산               │
│ - 수정구 시험         │ 포기한 것 / 부작용                   │
│ - 축제 장막           │ 발견 / 플레이어 명명                 │
├───────────────────────┴──────────────────────────────────────┤
│ 뒤로     다음 학습 목표     현재 소환수 준비                  │
└──────────────────────────────────────────────────────────────┘
```

## 4.20 상태 변형

- 기록 없음.
- 새 기록 있음.
- 글자 미해금·잠김.
- 현재 상황에서 재사용 불가.
- 기록 작성 중.
- Save 후 재진입.
- 데이터 누락 폴백.

## 4.21 Godot

```text
GrimoireScreen [Control]
├─ TabBar
├─ RecordList [ItemList 또는 재사용 CardList]
├─ RecordDetail [ScrollContainer]
├─ GlyphReferencePanel [Control]
├─ PreparationPanel [Control]
└─ FooterActions [HBoxContainer]
```

- 방식: Full-screen CanvasLayer Overlay.
- Data: `GrimoireEntryState`, `GlyphDefinition`, `PreparationViewData`.
- Signals: `entry_selected`, `entry_named`, `close_requested`.
- 완료: 빈 상태·새 기록·잠김·불완전 데이터가 모두 정의되고 자동 주문 Stock처럼 작동하지 않음.

---

# SCREEN-04 결과·보상·복기 화면

## 4.22 현재 정의 상태

- 문서: 성공·부분 성공·입력 실패·설계 실패 원인 구분.
- 결과: 비용·부작용·세계 변화·발견·태그를 기록.
- 실제 Scene·Script·Resource: 없음.

## 4.23 UX 방향

- 첫 정보: `무슨 결과가 났는가`.
- 다음 정보: `왜 그렇게 되었는가`.
- 행동 전 비교: 없음; 이미 Commit된 결과를 설명.
- 행동 후 선택: 재시도, 결과 수용, 기록, 복귀 중 허용된 것.
- 실패해도 진행 영구 차단 금지.

## 4.24 제안 와이어프레임

```text
┌──────────────────────────────────────────────────────────────┐
│ 결과: 부분 성공                         [세계 변화 미리보기] │
├──────────────────────────────┬───────────────────────────────┤
│ 입력: 흐름 인식 성공          │ 보호한 것: 묘목               │
│ 문법: 흐름+집중 유효           │ 포기한 것: 관개관 내구도       │
│ 비용: Mana -2                 │ 부작용: 과압 태그              │
│ 상황: 빠른 우회 성공           │ 발견: 정밀 우회                │
├──────────────────────────────┴───────────────────────────────┤
│ [기록하기]   [재시도]   [필드로 복귀]                        │
└──────────────────────────────────────────────────────────────┘
```

## 4.25 상태 변형

- 완전 성공.
- 부분 성공.
- 입력 실패: Commit 전 자원 미소모.
- 문법 실패: 수정 가능.
- 비용 부족: 실행 차단.
- 상황 저항·제한.
- 전투 승리·패배.
- 신규 발견·태그.
- 전환 중.

## 4.26 Godot

```text
ResultOverlay [Control]
├─ OutcomeHeader
├─ CausalChainPanel
├─ CostPanel
├─ WorldChangePreview
├─ RewardPanel
├─ DiscoveryPanel
└─ ActionBar
```

- 방식: CanvasLayer Overlay.
- Domain `SituationResult`를 받아 표시하며 자체 판정 금지.
- Signals: `retry_requested`, `record_requested`, `accept_result_requested`.
- 완료: 원인 Chain과 실제 상태가 일치하고, 중복 보상·중복 기록·중복 복귀가 차단됨.

---

# 5. 필수 화면과 상황 변형 연결

```text
SCREEN-01 MAIN
├─ SIT-GR-001 최초 실행·세이브 선택
├─ Save 없음
├─ Continue 가능
├─ Save 오류·Migration
└─ 설정 후 복귀

SCREEN-02 CORE BATTLE
├─ SIT-GR-005 상황 관찰·전투 준비
├─ SIT-GR-006 직접 작성·Spell Composer
├─ SIT-GR-007 전술 전투·수호 소환
├─ 위험 행동 예고
├─ Mana 부족·오대상
└─ 전투 종료 직전

SCREEN-03 GRIMOIRE/RESOURCE
├─ SIT-GR-010 귀환·마도서 기록
├─ 첫 기록
├─ 새 발견
├─ 글자 잠김
├─ 준비 상태 확인
└─ 기록 재열람

SCREEN-04 RESULT
├─ SIT-GR-008 성공·부분 성공·실패 복기
├─ 완전 성공
├─ 부분 성공
├─ 입력·문법·비용 오류
├─ 신규 태그·발견
└─ 재시도·수용·복귀
```

---

# 6. 대표 상황 전체 목록

| ID·상황명 | 유형 | 설명 | 우선순위 | 구현 상태 |
|---|---|---|---|---|
| `SIT-GR-001 최초 실행·세이브 선택` | 첫인상·진입 | 새 Session 또는 Continue 결정 | P0 | 신규 필요 |
| `SIT-GR-002 학교 장면 진입·이상 징후 관찰` | 탐색 | 장소·목표·Hotspot 파악 | P0 | 신규 필요 |
| `SIT-GR-003 교수·동급생·동반 정령 대화` | 대화·선택 | 정보·관계·다른 관점 확인 | P0 | 신규 필요 |
| `SIT-GR-004 자유일정 선택` | 선택·준비 | 휴식·준비·교류 중 하나 | P0 | 신규 필요 |
| `SIT-GR-005 Situation Challenge 관찰·준비` | 준비·위험 | 대상·제약·비용 파악 | P0 | 신규 필요 |
| `SIT-GR-006 직접 작성·인식·조합·Commit` | 제작·핵심 | 글자 작성과 설계 | P0 | 신규 필요·고위험 |
| `SIT-GR-007 전술 전투·수호 소환` | 전투 | 위험 압박 속 작성 시간 확보 | P0 | 신규 필요·고위험 |
| `SIT-GR-008 결과·원인·보상 복기` | 승리·실패·보상 | 결과와 대가 설명 | P0 | 신규 필요 |
| `SIT-GR-009 원래 필드 복귀·환경 변화` | 복귀 | 결과를 World에 반영 | P0 | 신규 필요·고위험 |
| `SIT-GR-010 귀환·마도서 기록·Checkpoint` | 성장·장기 진행 | 발견을 기록하고 다음 목표 생성 | P0 | 신규 필요 |
| `SIT-GR-011 Pause·설정·접근성` | 편의 | 음량·모션·텍스트·입력 조절 | P1 | 신규 필요 |
| `SIT-GR-012 Save Slot·복구` | 반복 | 명시적 Save 선택·오류 복구 | P1 | 신규 필요 |
| `SIT-GR-013 Tutorial Hint·규칙 재열람` | 학습 | 요청형 도움·용어집 | P1 | 신규 필요 |
| `SIT-GR-014 축제 장소 상태 변형` | 콘텐츠 | 같은 학교 Scene의 장식·조명 변화 | P1 | 자산·State 필요 |
| `SIT-GR-015 시간대·BGM 상태 변화` | 장기 진행 | 세션 감정 구분 | P2 | Audio 결정 대기 |
| `SIT-GR-016 Mobile 가로 적응` | 후속 플랫폼 | Touch·Safe Area·Resume | P2 | 후행 |
| `SIT-GR-017 고급 기록 비교·필터` | 편의 | 과거 해법 비교 | P2 | Slice 후행 |
| `SIT-GR-018 연출·미세 Animation Polish` | 폴리싱 | Camera·FX·반응 강화 | P3 | Art Bible 후행 |

---

# 7. 상황 우선순위 평가

점수는 설계 추정치 1~5이며 실제 사용자 데이터가 아니다.

| 상황 | 빈도 | 핵심 재미 | 감정 | 구현 위험 | 차별성 | 우선순위 |
|---|---:|---:|---:|---:|---:|---|
| 최초 실행·세이브 | 2 | 2 | 2 | 2 | 1 | P0 |
| 학교 관찰 | 5 | 4 | 3 | 3 | 3 | P0 |
| 대화 | 5 | 3 | 5 | 3 | 3 | P0 |
| 자유일정 | 3 | 4 | 4 | 3 | 4 | P0 |
| Challenge 준비 | 5 | 5 | 4 | 4 | 5 | P0 |
| 직접 작성 | 5 | 5 | 5 | 5 | 5 | P0 |
| 전술 전투 | 1~2 | 5 | 5 | 5 | 4 | P0 |
| 결과 복기 | 5 | 5 | 4 | 4 | 5 | P0 |
| 필드 복귀 | 2 | 5 | 5 | 5 | 5 | P0 |
| 마도서 기록 | 5 | 5 | 5 | 4 | 5 | P0 |
| Pause·설정 | 반복 | 2 | 1 | 2 | 1 | P1 |
| Tutorial | 초기 | 4 | 2 | 3 | 2 | P1 |
| 축제 변형 | 1 | 4 | 5 | 3 | 4 | P1 |
| Mobile 적응 | 후행 | 4 | 2 | 5 | 2 | P2 |
| Polish | 반복 | 2 | 4 | 4 | 3 | P3 |

---

# 8. 권장 전체 Godot 아키텍처

```text
res://
├─ app/
│  ├─ application_root.tscn
│  ├─ application_root.gd
│  ├─ game_flow_controller.gd
│  ├─ transition_controller.gd
│  └─ audio_director.gd
├─ autoload/
│  ├─ content_registry.gd
│  ├─ save_service.gd
│  └─ settings_service.gd
├─ core/
│  ├─ state_machine/
│  ├─ conditions/
│  ├─ results/
│  └─ identifiers/
├─ content/
│  ├─ definitions/
│  ├─ runtime/
│  └─ generated/
├─ world/
│  ├─ field/
│  └─ battle/
├─ actors/
│  ├─ player/
│  ├─ characters/
│  ├─ companion/
│  ├─ summons/
│  └─ enemies/
├─ spell/
│  ├─ input/
│  ├─ recognition/
│  ├─ grammar/
│  ├─ resolution/
│  └─ ui/
├─ dialogue/
├─ schedule/
├─ grimoire/
├─ ui/
│  ├─ common/
│  ├─ main/
│  ├─ hud/
│  ├─ result/
│  ├─ pause/
│  └─ accessibility/
├─ save/
└─ tests/
```

## 8.1 Application Root

```text
ApplicationRoot [Node]
├─ GameFlowController [Node]
├─ SessionStateOwner [Node]
├─ WorldHost [Node]
│  └─ ActiveWorld [FieldScene | BattleScene]
├─ UIHost [CanvasLayer]
│  ├─ PersistentHUD [Control]
│  └─ OverlayStack [Control]
├─ TransitionLayer [CanvasLayer]
│  ├─ InputBlocker [Control]
│  └─ FadeRect [ColorRect]
├─ AudioDirector [Node]
└─ DebugOverlay [CanvasLayer, debug only]
```

## 8.2 최소 Autoload

| Service | 책임 | Autoload 이유 | 포함 금지 |
|---|---|---|---|
| ContentRegistry | ID→검증 Resource 조회 | 모든 Scene에서 동일 정적 데이터 | 진행 상태·UI |
| SaveService | Save Metadata, 원자적 Write, Migration | Main·세션 전환 사이 지속 | 도메인 판정 |
| SettingsService | 음량·텍스트·모션·입력 설정 | 실행 전체 지속 | Story·Battle 상태 |

`GameFlowController`, `SessionState`, `AudioDirector`, `BattleDirector`, `DialogueController`는 Autoload가 아니다.

## 8.3 Scene 분리

| 대상 | 방식 | 이유 |
|---|---|---|
| Main Menu | UIHost 초기 Screen | Root·Save Service 유지 |
| Field | 별도 World PackedScene | 장소 단위 독립 테스트 |
| Battle | 별도 World PackedScene | 승인 구조, 입력·Camera 분리 |
| Dialogue | CanvasLayer Overlay | 기존 장소 유지 |
| Schedule | CanvasLayer Overlay | Field 배경·NPC 문맥 유지 |
| Spell Composer | CanvasLayer Overlay | Field/Battle Target 상태 유지 |
| Result | CanvasLayer Overlay | 결과 적용 전 확인 |
| Grimoire | Full-screen CanvasLayer Overlay | Session State 유지 |
| Pause | 재사용 Overlay | World process 제어 |
| Loading/Transition | Persistent Layer | 중복 입력·깜박임 차단 |
| SubViewport | 기본 미사용 | 일반 UI·전투 분리에 불필요 |

---

# 9. 공통 상태 머신

## 9.1 최상위 Flow State

```text
BOOT
→ MAIN_MENU
→ SESSION_LOADING
→ FIELD_EXPLORATION
→ FIELD_INTERACTION
→ DIALOGUE
→ SCHEDULE_SELECTION
→ SITUATION_INTRO
→ BATTLE_PREPARATION
→ BATTLE_ACTIVE
→ SPELL_COMPOSER
→ SPELL_RESOLVING
→ SITUATION_RESULT
→ REWARD
→ FIELD_RETURN
→ GRIMOIRE_RECORD
→ CHECKPOINT_SAVE
→ FIELD_EXPLORATION / NEXT_SESSION / MAIN_MENU
```

전역 보조 상태:

```text
TRANSITION_LOCK
PAUSED
ERROR_RECOVERY
```

## 9.2 상태 계약

| 상태 | 진입 | 허용 입력 | 종료 | 유지 핵심 |
|---|---|---|---|---|
| MAIN_MENU | Boot 완료 | 메뉴 | Session 선택 | Settings·Save Metadata |
| FIELD_EXPLORATION | Location 준비 | 이동·상호작용 | Hotspot·NPC·Exit | Location·Player·Companion |
| DIALOGUE | Dialogue 요청 | 진행·선택·Back 조건부 | DialogueResult | Field Snapshot·Flags |
| SCHEDULE_SELECTION | 일정 Slot | Action 선택 | ScheduleResult | 다음 세션·태그 |
| BATTLE_PREPARATION | Encounter trigger | 관찰·확인 | Battle Ready | Return Snapshot·Encounter |
| BATTLE_ACTIVE | Battle Ready | 이동·수호·Target·Spell | Result/Defeat | Unit·Objective·Clock |
| SPELL_COMPOSER | Context 요청 | Stroke·Undo·선택·Commit | Cancel/Resolved | Target·Risk·Resources |
| SITUATION_RESULT | Domain Result | 수용·기록·재시도 | Reward/Return | Cause chain·Tags |
| FIELD_RETURN | Result accepted | 입력 잠금 | World applied | Return Snapshot·World changes |
| GRIMOIRE_RECORD | 기록 대상 있음 | 명명·확정 | Save | Entry·Discovery·Next goal |

---

# 10. 공통 Signal 계약

```text
new_game_requested()
continue_requested(slot_id)
world_ready(world_id)
interaction_requested(interaction_id)
dialogue_requested(dialogue_id, context)
dialogue_finished(dialogue_result)
schedule_selected(action_id)
situation_started(situation_id)
battle_requested(encounter_id, return_snapshot)
battle_ready(encounter_id)
spell_focus_requested(spell_context)
stroke_input_completed(stroke_data)
recognition_candidates_ready(candidates)
glyph_confirmed(glyph_id)
spell_commit_requested(spell_intent)
spell_resolved(spell_result)
battle_finished(battle_result)
result_confirmed(result_id)
world_state_applied(result_tags)
grimoire_entry_confirmed(entry_id)
checkpoint_saved(checkpoint_id)
flow_state_changed(previous, current)
flow_error(error_code, recovery_action)
```

원칙:

- 하위 Scene은 Flow 상태를 직접 바꾸지 않는다.
- Signal 이름은 사건·요청 의미를 분리한다.
- 같은 Callable 중복 연결을 방지한다.
- 전환 시작 시 `TransitionLayer/InputBlocker` 활성.

---

# 11. 데이터 구조

## 11.1 정적 Definition

| Resource | 주요 필드 | 사용 화면 | 변경 영향 |
|---|---|---|---|
| `LocationDefinition` | id, field_scene, variants, spawn_markers, audio_state | Field·Return | 장소 전환·저장 |
| `LocationVariantDefinition` | required_flags, layers, npc_set, hotspots, lighting | Field | 수업·축제·손상·복구 |
| `CharacterDefinition` | id, name_key, SD scene, portrait set, roles | Field·Dialogue·Battle | 인물 전 화면 |
| `PortraitSetDefinition` | expressions, pose slots, fallback | Dialogue | 표정·누락 처리 |
| `DialogueDefinition` | lines, speakers, conditions, choices, effects | Dialogue | Flag·관계·진입 |
| `ScheduleActionDefinition` | action id, next_session, effects, scene, tags | Schedule | CALM/PREPARED/CONNECTED |
| `SituationDefinition` | objective, context, allowed actions, outcomes | Field·Battle·Result | Challenge 전체 |
| `GlyphDefinition` | meaning, stroke model ref, icon, learned condition | Spell·Grimoire | 작성·학습 |
| `SpellRuleDefinition` | main/support relation, constraints, tendencies | Spell | 문법·예상 결과 |
| `EncounterDefinition` | arena, actors, objectives, phases, fail rules | Battle | 조우 전체 |
| `EnemyDefinition` | stats, telegraphs, reactions, nonlethal rules | Battle | 적 행동 |
| `SummonDefinition` | role, duration, support area, costs | Battle | 수호 지원 |
| `RewardDefinition` | flags, discoveries, relationship, resources | Result | 중복 지급 위험 |
| `ResultDefinition` | outcome kind, cause labels, world changes, retry | Result | Field Return |
| `UIThemeDefinition` | Theme ref, semantic styles | 모든 UI | Art Style 승인 후 |

## 11.2 Runtime State

| State | 필드 | 지속 범위 |
|---|---|---|
| `SessionState` | current_session, location, flags, schedule, records | 전체 Session·Save |
| `PlayerState` | hp, mana, learned_glyphs, conditions | Session·Save |
| `CompanionState` | relationship, reactions, form id | Session·Save |
| `SummonRuntimeState` | ready, cooldown, active duration | Battle·선택적으로 Save |
| `FieldReturnSnapshot` | location_id, variant, spawn_marker, camera_key, bgm_key, object states | Battle 왕복 |
| `BattleRuntimeState` | units, objectives, clock, telegraphs | Battle 전용 |
| `SpellCompositionState` | strokes, candidates, confirmed glyphs, target, cost preview | Composer 전용; Commit 전 Save 제외 |
| `SituationResult` | outcome, cause chain, costs, tags, world changes | Result→Record |
| `GrimoireEntryState` | context, intent, glyphs, result, side effects, discovery, name | Save |

## 11.3 저작·런타임 관리 방식

```text
Google Sheets
= 사용자·기획자 저작 Workspace

GitHub JSON Snapshot
= ID·필드·행 출처를 보존하는 교환·검증 형식 후보

Godot custom Resource
= 런타임 정적 Definition과 Scene 참조

Save JSON
= 플레이어 Runtime State와 schema_version
```

권장 Pipeline 후보:

```text
Approved Sheet rows
→ source-controlled JSON export
→ schema·ID·reference validation
→ generated Godot Resources
→ ContentRegistry load
```

Vertical Slice에서 Pipeline 비용이 과하면 승인된 소수 데이터를 수동 `.tres`로 작성하되 Sheet row ID를 Resource에 보존한다. 최종 방식은 Codex Plan 전 기술 검수에서 확정한다.

---

# 12. Save·상태 유지

## 12.1 Checkpoint

- 각 중요 일정 시작 전.
- 자유일정 선택 전·완료 후.
- 현장실습 진입 전.
- 전투 완료 후 Field Return 적용 시점.
- 귀환·마도서 기록 완료 후.

## 12.2 저장 금지 시점

- Scene 교체 중.
- Spell Commit 요청과 Domain Result 사이.
- Reward 지급 도중.
- Field Return World Apply 도중.

이 구간에서는 마지막 안전 Checkpoint로 복구한다.

## 12.3 Save 필드

```text
schema_version
slot_id
checkpoint_id
session_id
location_id
location_variant_id
spawn_marker_id
story_flags
one_shot_event_flags
player_state
companion_state
summon_ready_state
schedule_tags
grimoire_entries
completed_situations
world_object_states
play_time
save_timestamp
content_version
```

NodePath, Object ID, Signal connection, Animation state object는 저장하지 않는다.

---

# 13. 화면 전환 비교와 추천

## 전투를 별도 Scene으로 전환

장점:

- 승인된 별도 전술장과 일치.
- Camera·입력·Collision·AI 독립.
- Battle Scene 독립 실행·테스트.
- Field 제작량과 전투 제작량 분리.

위험:

- Return Snapshot 누락.
- BGM·NPC·환경 상태 불일치.
- 전환 중 중복 입력.

## 현재 Field 위 전투 Layer

장점:

- 위치·배경 유지 쉬움.

위험:

- 승인된 화면 구조와 충돌.
- Field와 Battle의 입력·Camera·Collision 결합.
- 거대 Scene화.

## 추천

```text
별도 Battle World Scene
+ Persistent ApplicationRoot
+ FieldReturnSnapshot
+ ResultTag 기반 WorldStateApplier
```

---

# 14. 공통 UI와 전용 UI

## 공통 재사용 UI

- ObjectivePanel.
- ResourceStrip.
- InteractionPrompt.
- StatusBadge.
- WarningBanner.
- ConfirmCancelBar.
- ResultCauseRow.
- LoadingIndicator.
- ModalConfirm.
- Toast·NewInfoBadge.
- ScrollableDetailPanel.
- Pause·Settings Shell.

## 상황 전용 UI

- Spell Stroke Canvas.
- Recognition Candidate Strip.
- Glyph Composition Slots.
- Battle Telegraph Legend.
- Schedule Action Cards.
- Grimoire Causal Record Detail.
- Field World Change Preview.

---

# 15. Vertical Slice 구현 순서

현재는 코드 작성 권한이 없다. 승인·Art·기술 Gate 이후의 권장 순서다.

| 순서 | Slice | 우선 | 임시 대체 |
|---:|---|---|---|
| 1 | ApplicationRoot·Flow·Transition Lock | P0 | 단색 Fade 가능 |
| 2 | Content ID·Resource·Session State·Save Skeleton | P0 | 소수 수동 Resource |
| 3 | Main Menu·New/Continue | P0 | 정적 Panel |
| 4 | Field Scene·Player·Hotspot·Companion | P0 | ColorRect·Placeholder SD |
| 5 | Dialogue Overlay·Choice·Flags | P0 | 임시 반신·텍스트 |
| 6 | Situation Intro·Objective·Target | P0 | 정적 Situation Card |
| 7 | Spell Composer UI·Undo·Candidate Mock Interface | P0 | simulated recognition 허용 |
| 8 | Spell Rule·Cost·Result Domain Interface | P0 | 승인 글자 3개만 |
| 9 | Battle Scene·수호 Summon·Enemy Telegraph | P0 | 최소 Animation·도형 Telegraph |
| 10 | Result Overlay·Reward Idempotency | P0 | 정적 결과 아이콘 |
| 11 | FieldReturnSnapshot·WorldStateApplier | P0 | Layer on/off |
| 12 | Grimoire Record·Checkpoint | P0 | 텍스트 기록 우선 |
| 13 | Free Schedule 3종 | P0 | 카드+짧은 대화 |
| 14 | Pause·Settings·Accessibility | P1 | 최소 음량·텍스트 |
| 15 | Art Bible 자산 교체·Audio | P1 | Placeholder 제거 |
| 16 | Mobile 적응 | P2 | PC 완료 후 |

---

# 16. 테스트 전략

## 16.1 정적 검증

- 모든 ID 유일.
- Resource 참조 유효.
- State Transition Matrix에 금지 전환 없음.
- 상황마다 진입·완료·실패·복귀 정의.
- Scene 필수 Node 계약 검사.
- Save schema와 Migration 경로.
- Sheet row ID와 Runtime Definition 추적.

## 16.2 Headless·Scene Smoke

- ApplicationRoot Boot.
- Main Menu 입력.
- 각 World Scene 독립 인스턴스화.
- 각 Overlay 독립 인스턴스화.
- Signal 중복 연결 없음.
- World 교체 후 기존 참조 사용 없음.

테스트 프레임워크는 아직 선택하지 않으며 `TEST_FRAMEWORK_REQUIRED`로 남긴다.

## 16.3 상태 전환 Matrix

- 정상: Main→Field→Dialogue→Battle→Spell→Result→Return→Record.
- Cancel: Dialogue·Schedule·Spell Commit 전 취소.
- 오류: Save 손상, Resource 누락, invalid target, cost 부족.
- 중복: 더블 클릭, Enter+Mouse 동시, Transition 중 입력.
- Retry: 결과 재시도 시 Reward·Flag 중복 없음.

## 16.4 Save Round Trip

- 자유일정 전·후.
- 전투 전.
- 전투 완료·Field 적용 후.
- 마도서 기록 후.
- App 종료·재실행.
- 이전 Save version Migration.

## 16.5 해상도

PC 우선 후보:

- 1280×720.
- 1366×768.
- 1920×1080.
- 2560×1440.
- 2560×1080.
- 3440×1440.
- Window resize와 UI scale.

Mobile 후행:

- 20:9 landscape.
- Safe area·gesture inset.
- Background resume.

## 16.6 실제 사람 검증

현재 `NOT_RUN`.

- 최초 3초 목표 이해.
- 입력 실패·설계 실패 구분.
- 수호 Summon과 메인 Companion 역할 구분.
- Field→Battle→Field 장소 연속성.
- 7회 직접 작성 피로.
- 결과 화면에서 원인과 포기한 것을 설명 가능.

---

# 17. 확인 필요한 결정

| ID | 질문 | 현재 상태 | 차단 범위 |
|---|---|---|---|
| ART-STYLE-01 | A/B/C 그림체 | USER_DECISION_REQUIRED | Theme·실자산 |
| ASSET-SPEC-01 | 내부 해상도·Asset 크기 | BLOCKED_BY_ART | Pixel size |
| AUDIO-DIRECTION-01 | BGM·SFX 언어 | PENDING | AudioDirector content |
| TECH-BATTLE-TIME-01 | Pause/Slow/Realtime | PLAYTEST_TUNING_REQUIRED | BattleClock |
| TECH-RECOGNITION-01 | 인식 알고리즘·허용치 | TECHNICAL_REVIEW_REQUIRED | Spell input |
| TECH-DATA-PIPELINE-01 | Sheet→JSON→Resource | TECHNICAL_REVIEW_REQUIRED | Content pipeline |
| TECH-TEST-FRAMEWORK-01 | Godot test framework | TECHNICAL_REVIEW_REQUIRED | CI runtime tests |
| UI-MAIN-01 | Main menu 최소 구성 승인 | USER_REVIEW_REQUIRED | SCREEN-01 |
| UI-GRIMOIRE-01 | 마도서 탭·탐색 방식 | USER_REVIEW_REQUIRED | SCREEN-03 |

---

# 18. Base 승격 후보

- `PROJECT-SITUATION-SCREEN-SPEC-01` 작업지시문.
- 필수 기준 화면 4종 감사.
- `CONFIRMED / IMPLEMENTED / INTERPRETATION / PROPOSAL / ASSUMPTION` 분류.
- P0~P3 상황 평가.
- Persistent Root + World Swap + Overlay + Snapshot 패턴.
- 상황별 A~T 구현 명세.
- 완료 기준·테스트 Checklist.
- Sheet row ID와 Runtime Definition 추적 계약.

Base 승격은 다른 프로젝트 적용 결과를 비교한 후 별도 승인한다.

# 19. 프로젝트 전용 유지

- `흐름 / 집중 / 분산` 글자 문법.
- 직접 작성·인식·조합·상황 판정.
- 마법학교 일정·시험·축제·현장실습.
- 메인 동반 정령·수호형 전투 보조 소환수.
- 마도서의 상황·의도·결과·부작용·발견 기록.
- 폭주 정령을 파괴하지 않고 관개 압력 원인을 해결하는 전투.

---

# 20. 현재 판정

```yaml
project_context_review: COMPLETE
actual_product_files: NONE_FOUND
benchmark: COMPLETE
required_screen_audit: COMPLETE
situation_inventory: COMPLETE
p0_detail_specs: WRITTEN_IN_LINKED_DOCUMENTS
implementation: NOT_STARTED
codex: BLOCKED
user_review: REQUIRED
```
