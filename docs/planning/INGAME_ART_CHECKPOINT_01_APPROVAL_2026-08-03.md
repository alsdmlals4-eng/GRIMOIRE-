# GM-INGAME-ART-CHECKPOINT-01 — 인게임 아트 중간점검 Board A·B 승인

## 1. 승인 상태

```yaml
decision_id: GM-INGAME-ART-CHECKPOINT-01
status: USER_APPROVED_VISUAL_CHECKPOINT
approved_at: 2026-08-03T08:40:00+09:00
approval_mode: USER_EXPLICIT_APPROVAL_OF_BOTH_IMAGES
visual_status: APPROVED_VISUAL_CHECKPOINT_REFERENCE
implementation_authority: NONE
asset_production_authority: NONE
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_playtest: NOT_RUN
```

사용자는 현재 대화에서 생성된 두 이미지 모두를 승인했다.

- Board A: 메인·일상/자유일정·수업/글자 연습·학교축제.
- Board B: 전투 관찰/소환 운용·전투 Writing Focus·소환 Event·결과/복귀.

## 2. 상위 권위와 관계

이 승인은 다음 상위 시각 권위를 교체하지 않는다.

- `ART-STYLE-01` — 잠긴 원본 비주얼 방향.
- `ART-BIBLE-01` — 이중 기준형 시각 계약.
- `GM-MOBILE-SUMMON-HUD-WIREFRAME-01` — Mobile 소환 HUD 구조 계약.

두 Board는 위 계약을 실제 장면 세트로 확인하기 위한 **파생 시각 중간점검 기준**이다. 잠긴 원본을 수정·재생성·대체하지 않는다.

## 3. 승인 범위

다음은 승인한다.

### Board A

1. 메인 화면에서 학교·주인공·메인 늑대형 동반 정령·글자 마법 정체성을 한눈에 전달하는 구성.
2. 고정 3/4 필드의 일상·자유일정 화면과 SD 캐릭터 운용 방향.
3. 현재 수업 장면을 유지한 채 글자 작성 Overlay를 전면 정보로 사용하는 수업 화면.
4. 학교축제에서 비전투 글자 마법을 사회적·놀이 맥락으로 사용하는 장면.
5. Soft Storybook 환경 + Clean Anime Cel 캐릭터 + Navy/Gold Academy UI의 일관된 조합.

### Board B

1. 강한 적 1개체·환경 목표·주인공·메인 동반 정령을 사용하는 고정 3/4 전투 구성.
2. 좌측 `MAIN → S1 → S2 → S3` 압축 Rail과 우측 Writing Panel의 공존 방향.
3. 보조 소환수를 전장 상시 몸체가 아니라 역할 배지와 짧은 Cut-in·FX로 표현하는 방식.
4. Writing Focus 중에도 적 의도·타이머·환경 위험·HP·마나·소환 Rail을 유지하는 구성.
5. 결과가 단순 Loot 정산이 아니라 환경 변화와 원래 장소 복귀로 이어지는 장면.
6. 주인공·메인 동반 정령·UI Frame·카메라·색조가 Board A와 같은 게임으로 읽히는 연속성.

## 4. 비정본·자리표시자 범위

아래 요소는 이미지 승인만으로 기획 정본이 되지 않는다.

- 이미지 내 영문 UI 문구와 최종 한국어 현지화 문구.
- 레벨, 재화, 에너지, 보석, HP·MP, Stock 수량, Timer 등 모든 예시 수치.
- `Runic Colossus`, 장소명, Quest명, 수업명 등 임시 고유명사.
- `A+`, Festival Points, Battle Result 항목과 평가 방식.
- Main 화면의 최종 메뉴 수·아이콘·계정/공지 구조.
- 일상 화면의 Classes·Library·Courtyard·Dorm·Quests 항목 구성.
- Board B의 `Attack +3`, `Heal +3` 표기.

특히 시스템 정본은 다음 값을 계속 우선한다.

```text
메인 [스톡] 1
생산형 [스톡] 2
수호형 [방어도] 2
공격형 [공격] 2
치유형 [치유] 2
```

이미지의 `+3` 표현은 시각적 자리표시자이며 수치 정본을 변경하지 않는다.

또한 `Support Chain Complete`는 네 소환수가 한 번에 자동 연쇄 행동한다는 뜻이 아니다. 실제 Event 처리와 주기는 `GM-SUMMON-SYSTEM-01`과 `GM-STOCK-SUMMON-STATE-INTERFACE-01`을 따른다.

## 5. 승인 Asset

기계 식별자는 `docs/planning/visual/INGAME_ART_CHECKPOINT_01_APPROVED_MANIFEST.json`을 따른다.

### Board A

- Asset ID: `GR-VISUAL-CHECKPOINT-BOARD-A-01`.
- Library: `/GRIMOIRE/Visual Checkpoints/GRIMOIRE_INGAME_CHECKPOINT_BOARD_A_APPROVED_2026-08-03.png`.
- 장면: Main / Daily Life / Class / Festival.

### Board B

- Asset ID: `GR-VISUAL-CHECKPOINT-BOARD-B-01`.
- Library: `/GRIMOIRE/Visual Checkpoints/GRIMOIRE_INGAME_CHECKPOINT_BOARD_B_APPROVED_2026-08-03.png`.
- 장면: Battle Observe / Writing Focus / Summon Event / Result Return.

## 6. 적대적 검토

### 통과

- 메인·일상·수업·축제·전투·작성·결과 여정이 두 Board에 분리되어 판독 가능하다.
- 주인공과 메인 동반 정령의 실루엣·색·의상 계보가 두 Board에서 유지된다.
- 보조 3체는 HUD 배지와 순간 FX로 표현되어 Art Bible의 상시 몸체 금지와 양립한다.
- Writing 화면에서 적과 환경 문맥이 완전히 사라지지 않는다.
- 결과 화면이 환경 변화와 복귀를 보여준다.

### 보호 Finding

- 이미지 생성 특성상 작은 UI 문구는 최종 현지화·접근성 증거가 아니다.
- 고정 해상도 Board는 실제 Safe Area·Touch target·Text Scale 검증을 대신하지 않는다.
- Board A의 메인·일상 메뉴는 기획 확정 메뉴가 아니다.
- Board B의 수치와 Result Grade는 시각 자리표시자다.
- 이 승인은 Runtime 구현·최종 Asset·성능·사람 검증 완료를 의미하지 않는다.

## 7. 다음 Gate

```text
GM-MOBILE-SUMMON-HUD-WIREFRAME-01 사용자 명세 검토
→ TDD Plan·Test Matrix
→ Godot Toolchain preflight
→ Base v9.4.3 Plan 재검증
→ Execution Readiness
```

시각 제작 경로에서는 다음을 별도로 수행한다.

```text
승인 Board에서 화면별 Asset Requirement 추출
→ ASSET-SPEC-01 또는 후속 화면별 Specification
→ 실제 한글 UI·Touch·Safe Area 검증
→ 개별 Asset 제작
```

## 8. 보호 경계

```text
APPROVED_IMAGES = 2
VISUAL_REFERENCE = APPROVED
FINAL_RUNTIME_SCREEN = NOT_APPROVED
FINAL_UI_TEXT = NOT_APPROVED
FINAL_NUMBERS = NOT_APPROVED
FINAL_ASSET_PRODUCTION = NOT_AUTHORIZED
GODOT_IMPLEMENTATION = NOT_AUTHORIZED
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
USER_MERGE_APPROVAL = NOT_GIVEN
```
