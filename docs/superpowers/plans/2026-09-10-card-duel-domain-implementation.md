# Card Duel Domain Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task in the current task. Do not dispatch agents without a separate applicable authorization. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 승인된 첫 카드 결투의 판정·손패·중복 방지·재개를 UI와 독립된 작은 도메인으로 구현한다.

**Architecture:** 고정 규칙, 무변경 교환 미리보기, 가변 매치 상태와 명령 적용을 분리한다. 현재 그리기/별형 Coordinator나 미병합 #253의 카드 모델을 가져오지 않는다. 이미지 후보는 별도 검토 자료이며 이 단계에서 runtime에 연결하지 않는다.

**Tech Stack:** 현재 프로젝트의 Godot 4.7 계열, GDScript, 기존 테스트 실행 체계. 새 유료 라이브러리·서버 없음.

**Spec:** `docs/superpowers/specs/2026-09-10-card-duel-blueprint.md`. 상태 승인 owner는 `docs/planning/REPLANNING_INTAKE_2026-09-10.md`; PDF의 DESIGN_REVIEW는 발행 당시 상태로 보존한다.

## Global Constraints

- 사용자 후속 `권장안대로 진행`으로 상세 권장 규칙 채택. 4종/8장/손패4/결계16/예산2는 조정 가능한 시험값.
- 카드 1~2장, 다른 종류 두 장의 순서 무관. 같은 종류 2장·3장 이상 거부. 단독 사용 가능.
- 한 교환의 양쪽 결과를 모두 계산한 뒤 승패. 방어 설정 → 제거 → 공격 감소 → 방어/피해 → 반사 → 종료.
- 인물 카드·직접 그리기·서클3/라운드3·7/7/6 기본 규칙·자동 시전 없음.
- 새 기능 범위는 대표 결투 도메인. 메인 진입 교체·이야기 보상·이미지 정본 승격은 후속 UI/스토리 통합 단계이며 이 계획으로 완료 주장하지 않는다.
- 기존 사용자 fixture 수정과 open PR #253/#249/#187/#166은 수정하지 않는다.

## 실행 환경과 검사 경로

실행 직전에 Godot 프로젝트 연결과 현재 엔진 경로를 확인한다. 프로젝트의 `tests/test_runner.gd`와 `tests/test_case.gd` 등록 규칙을 읽고 새 테스트를 연결한다. 변경 전 기존 테스트 실패를 따로 기록한다.

빠른 검증은 기존 테스트 실행기의 실제 인자를 확인해 사용한다. 정식 PR 증거는 현재 PR 번호·exact HEAD·fresh base SHA가 확보된 뒤 다음 프로젝트 검증기로 실행한다. 과거 PR 번호를 채우지 않는다.

```powershell
./tools/run_local_gut_validation.ps1 -ExpectedHead $taskHead -BaseSha $freshBase -PullRequest $currentPr -Mode full -GodotExecutable $verifiedGodot
```

위 변수는 실행 시 실제 조회로 얻는 값이다. 아직 실행한 명령 또는 완료 증거가 아니다.

## Task 1: 고정 카드와 무순서 조합 정의

**Files:** Create `src/core/card_duel/duel_rules.gd`; Create `tests/unit/test_card_duel_rules.gd`; Modify `tests/test_runner.gd`의 실제 등록 지점.

**Interfaces:** `DuelRules.effect(kinds: Array[StringName]) -> Dictionary`. 출력 키는 `status`, `attack`, `guard`, `attack_reduction`, `strip_guard`, `reflect_cap`, `cost`다. 실패는 `status`만으로 이유를 반환하며 상태를 변경하지 않는다.

- [ ] 4개 단독, 6개 유효 쌍, 모든 역순, 같은 종류 쌍, 알 수 없는 ID, 0장/3장을 검사하는 실패 테스트를 먼저 쓴다.

```gdscript
var rules = preload("res://src/core/card_duel/duel_rules.gd").new()
var a = rules.effect([&"EMBER", &"WIND"])
var b = rules.effect([&"WIND", &"EMBER"])
assert(a == b)
assert(a.attack == 3 and a.attack_reduction == 2)
assert(rules.effect([&"EMBER", &"EMBER"]).status == &"DUPLICATE_KIND")
```

- [ ] 등록한 새 테스트를 실행하고 새 클래스 부재로 실패하는지 확인한다.
- [ ] 단독/조합 표를 명시적 데이터로 구현한다. `EMBER`:3공격, `WIND`:1공격/2방어, `WARD`:4방어, `GATHER`:2공격. 쌍의 수치는 Spec 04를 그대로 사용한다. 모든 효과는 같은 출력 키를 가진다.

```gdscript
func effect(kinds: Array[StringName]) -> Dictionary:
    # First reject count/unknown/duplicate IDs; only then normalize pair order.
    var key_parts := kinds.duplicate()
    key_parts.sort()
    # Exact declared table lookup; return a deep copy, never live shared data.
    return _lookup_declared_effect(key_parts).duplicate(true)
```

`_lookup_declared_effect`는 같은 파일의 내부 함수로 4개 단독/6개 조합과 위 오류를 처리한다. 일반 주문 문법 엔진을 추가하지 않는다.
- [ ] 모든 표와 역순 테스트를 통과시키고 이 파일/테스트만 커밋한다.

## Task 2: 부작용 없는 한 교환 해소

**Files:** Create `src/core/card_duel/duel_exchange.gd`, `tests/unit/test_card_duel_exchange.gd`.

**Interfaces:** `preview(effect: Dictionary, opponent: Dictionary, player_barrier: int, opponent_barrier: int) -> Dictionary`. opponent는 `attack`,`guard`; 출력은 `player_damage`,`opponent_damage`,`blocked`,`reflected`,`player_barrier`,`opponent_barrier`,`outcome`이다. 입력 Dictionary를 변경하지 않는다.

- [ ] 방어 제거·반사0·반사상한·공격감소 하한0·양쪽0 무승부 테스트를 먼저 실행해 실패시킨다.

```gdscript
var result = exchange.preview(rules.effect([&"WIND", &"WARD"]), {"attack":4,"guard":0}, 16, 16)
assert(result.player_damage == 1)
assert(result.reflected == 2)
assert(result.opponent_damage == 2)
```

- [ ] 다음 계산식을 하나의 미리보기 함수에 구현한다. 확정에서 별도 수식을 복제하지 않는다.

```gdscript
var foe_guard = 0 if effect.strip_guard else opponent.guard
var foe_attack = maxi(0, opponent.attack - effect.attack_reduction)
var blocked = mini(foe_attack, effect.guard)
var reflected = mini(blocked, effect.reflect_cap)
var player_damage = maxi(0, foe_attack - effect.guard)
var opponent_damage = maxi(0, effect.attack - foe_guard) + reflected
```

- [ ] 각 결계를 0까지 clamp하고, 둘 다0→DRAW / 상대만0→WIN / 자신만0→LOSS / 그 외ONGOING을 검사한다. 공격 중간 조기 종료 금지.
- [ ] 변경 전후 입력 직렬화가 같은지 검사하고 커밋한다.

## Task 3: 손패·확정·저장 재개

**Files:** Create `src/core/card_duel/duel_match.gd`, `tests/unit/test_card_duel_match.gd`.

**Interfaces:** `create(seed_value: int) -> Dictionary`, `preview(state: Dictionary, instance_ids: Array[StringName]) -> Dictionary`, `apply(state: Dictionary, command: Dictionary) -> Dictionary`, `restore(snapshot: Dictionary) -> Dictionary`.

state 키: `schema_version`, `rules_version`, `revision`, `exchange_index`, `player_barrier`, `opponent_barrier`, `budget`, `hand`, `draw_pile`, `discard_pile`, `rng_state`, `resolved_commands`, `outcome`. 카드 인스턴스는 `instance_id`,`kind`의 객체로 정의한다.

command 키: `command_id`,`expected_revision`,`kind`(CAST 또는 WAIT),`instance_ids`. apply 출력은 `status`,`state`,`result`; 실패에는 원상태의 깊은 복사본을 반환한다. 같은 command ID 재요청은 기존 결과를 반환하고 상태를 변경하지 않는다. 재요청 확인은 revision 검사보다 먼저 수행한다.

- [ ] 생성 시 8개의 고유 ID, 손패4/덱4, 교환1의 예고4공격/0방어를 검사한다. 매치가 아직 없어서 실패하는 것을 확인한다.
- [ ] 고정 순서 카드 목록을 seed로 섞고 RNG 상태를 저장한다. 교환마다 손패 부족분만 보충; 덱 고갈 시 버림을 섞는다. 손패 중복 인스턴스 금지.
- [ ] 다음 실패/중복 테스트부터 실행한 뒤 apply를 구현한다.

```gdscript
var command = {"command_id":"cast-1", "expected_revision":state.revision, "kind":"CAST", "instance_ids":[state.hand[0].instance_id]}
var first = match.apply(state, command)
var repeat = match.apply(first.state, command)
assert(repeat.state == first.state)
assert(repeat.result == first.result)
assert(match.apply(state, {"command_id":"bad", "expected_revision":-1,"kind":"CAST","instance_ids":[]}).status == &"STALE_STATE")
```

- [ ] apply는 모든 검증 후 state를 복제하고 동일 preview의 결과·카드 이동·예산 소비를 한 번에 반영한다. 종료 시 다음 보충을 하지 않는다. 계속되는 경우 임시 효과를 없애고 다음 예고를 설정한다.
- [ ] 상대 예고는 4/0 → 2/4 → 6/0 반복. WAIT는 효과0·소비0, 상대 행동을 받고 다음 교환으로 간다. 선택된 카드를 WAIT가 몰래 시전하지 않는다.
- [ ] 동일 snapshot에서 같은 다음 명령의 결과/손패/RNG가 같은지 검사한다. 손상/미지원 버전은 명시 오류, 기존 저장 자동 덮어쓰기 없음.
- [ ] 위 검사와 기존 회귀를 실행하고 커밋한다. 이 성공은 UI/Human PASS가 아니다.

## 후속 UI·이미지·스토리 패키지의 진입 조건

이 계획은 핵심 도메인만 독립적으로 검토·구현 가능한 단위로 분리했다. 다음 패키지는 새 `src/ui/card_duel/` scene, 탭 선택/명시 시전, 모든 상태 피드백, approved 개별 아트, 이야기 handoff/보상 ID를 연결한다. 패키지 착수 전 실제 이미지 consumer·Godot live-editor skill·현재 scene 등록과 저장 owner를 다시 읽는다.

그 패키지의 수락 항목은 Spec 02/06/07/08/09 전체다. 대표 화면 후보는 단일 raster이므로 분리 자산으로 재제작해야 한다. 임시 자르기로 배경·투명 인물·모션 프레임이 확보됐다고 주장하지 않는다. 포즈 승인 후 Aseprite 레이어/프레임 export를 필요에 따라 사용한다.

## 검토 기록과 현재 상태

5회 자체 검토: (1) 최신 규칙 승인과 시각 승인 분리, (2) 기존 main/PR와 경로 충돌 점검, (3) 조합·해소 수식과 Spec 대조, (4) 중복/저장/RNG 복구 경계, (5) UI·이미지·스토리 미포함을 전체 완료로 오인하지 않도록 패키지 경계 명시.

이 계획의 테스트 예시는 실행 전이다. 구현·Runtime·Human·Device는 NOT_RUN. 현재 프로젝트 validator만 OPERATING_CONTRACT_VALID. 새 Base 계약이나 새로운 공용 스킬을 만들지 않는다.
