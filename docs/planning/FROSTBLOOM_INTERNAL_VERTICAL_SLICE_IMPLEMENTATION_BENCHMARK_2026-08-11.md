# Frostbloom Internal Vertical Slice — Implementation Benchmark / Industry Research

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
sync_id: GR-SYNC-20260811-10-FROSTBLOOM-INTERNAL-VERTICAL-SLICE
checked_at: 2026-08-11T09:49+09:00
purpose: PRE_IMPLEMENTATION_BENCHMARK_AND_INDUSTRY_RESEARCH
product_mutation_authority: NONE
copying_policy: PATTERNS_AND_CONSTRAINTS_ONLY_NO_CONTENT_OR_EXPRESSION_COPYING
```

이 문서는 D 구현 계획 작성 **전에** 수행한 벤치마킹/현업조사 결과다. 사례의 콘텐츠·미술·대사·레벨을 복제하지 않고, 검증할 패턴과 피할 함정만 추출한다.

## 1. GRIMOIRE 장르 분류

### 외부 설명용

- Primary commercial genre: `RPG`
- Closest market sub-position: `Magic-School Life Sim / Social RPG`
- Project descriptive label: **시스템형 마법학교 RPG (Systemic Magic-School RPG)**
- Extended descriptor: **마법학교 생활형 시스템 RPG / Narrative Systemic Magic-School RPG**

### 설계 DNA

| 축 | GRIMOIRE에서의 의미 | 비교 역할 |
|---|---|---|
| Life Sim / Social RPG | 학기·자유일정·관계·학교생활 | 구조 벤치마크 |
| Narrative RPG | 장기 선택·증거·책임·복기·마도서 | 장기 결과 벤치마크 |
| Systemic problem solving | 같은 사건의 복수 합리 해법과 문맥 기반 결과 | 핵심 차별점 |
| Crafting RPG | 사건 준비 도구가 해결 조건·대가에 영향 | 보조 핵심 |
| Embodied spellcasting | 직접 쓴 glyph가 주문 의미의 출발점 | 입력 차별점 |

`Immersive Sim`은 내부 설계 레퍼런스로는 유용하지만 현재 상점 1차 장르로 고정하지 않는다. 1인칭 잠입/샌드박스 기대를 만들 수 있고, GRIMOIRE의 실제 비중은 학교생활·서사 RPG·직접 작성·사건 해결의 결합이기 때문이다.

## 2. Source register

| Source | Role | Freshness checked | Supported fact used |
|---|---|---|---|
| Witchbrook official site | Primary product source | 2026-08-11 | 스스로 `life-sim and social RPG`로 설명하고 마법학교·관계·졸업을 전면에 둠 |
| Persona 5 Royal official ATLUS site | Primary product source | 2026-08-11 | 학교생활 RPG 구조 비교군 |
| Atelier Ryza official web manual | Primary product/manual | 2026-08-11 | 재료 조합 제작물이 탐사·채집·전투 등에 쓰이고 재료 선택이 효과를 바꿈 |
| Bethesda, Dishonored 2 — Play Your Way | Primary studio/publisher article | 2026-08-11 | 복수 해법이 실제 시스템 선택이어야 하며 `smoke and mirrors`가 아니어야 한다는 설계 철학 |
| I Was a Teenage Exocolonist official | Primary product source | 2026-08-11 | 장기간 선택·스킬·관계가 삶/결과를 바꾸는 Narrative RPG 비교군 |
| GOG Arx Fatalis product page | Vendor source / historical product fact | 2026-08-11 | gesture-based spellcasting의 역사적 인접 사례 |
| Steamworks Tags documentation | Primary platform source | 2026-08-11 | 태그가 탐색/추천/노출에 영향을 주며 가장 구체적인 장르·하위 장르를 우선해야 함 |
| GDC Vault — The Vertical Slice Challenge | Professional production source | 2026-08-11 | vertical slice를 production/readiness 관점에서 다루는 업계 자료 |
| Microsoft Game Dev Office Hours 2025 | Primary platform/professional source | 2026-08-11 | 작은 검증 단위로 가설을 증명하고 학습·반복하는 개발 접근 |
| ID@Xbox Office Hours 2026 | Primary platform/professional source | 2026-08-11 | vertical slice는 게임마다 달라야 하고 직접 플레이가 재미와 고유성을 보여야 함 |

## 3. Benchmark dispositions

### Witchbrook — ADAPT market framing, REJECT mechanical imitation

**ADAPT**
- `마법학교 + 생활 + 관계 + 성장`이 함께 묶이는 시장 언어.
- 학교가 단순 메뉴가 아니라 생활 맥락이어야 한다는 기대.

**REJECT**
- GRIMOIRE를 cozy-life-sim 중심으로 축소하는 것.
- 주문 의미 설계·현장 책임·복수 해법을 부수 활동으로 내리는 것.

**GRIMOIRE delta**
- 마법을 ‘배운다’에서 끝나지 않고 직접 작성→회로→대상→세계 변화→기록/책임까지 연결한다.

### Persona 5 Royal — ADAPT calendar meaning, REJECT optimization treadmill

**ADAPT**
- 학교 일정과 자유시간 선택이 관계·성장과 연결되는 구조.
- 제한된 시간 선택이 플레이어 정체성을 만든다는 점.

**REJECT**
- 촘촘한 일일 최적화·사회 스탯 체크리스트.
- 특정 자유일정 축이 필수 스토리 정보/성장을 독점하는 구조.

**GRIMOIRE delta**
- Year-One 자유일정은 6회이고 D Slice에서는 대표 1회만 실제 플레이한다. 네 선택 모두 메인 진행을 막지 않는다.

### Atelier Ryza — ADAPT consequential crafting, REJECT breadth explosion

**ADAPT**
- 재료 선택과 조합이 결과물 기능을 실제로 바꾸는 것.
- 제작물이 탐사/전투/현장 문제와 연결되는 것.

**REJECT**
- Year-One에서 대규모 레시피·품질·특성·재료 계층을 여는 것.
- 제작 자체가 메인 사건보다 더 큰 경제 시스템이 되는 것.

**GRIMOIRE delta**
- D는 사건 연결형 소형 제작 1회, B는 6 재료군 / 8 core recipes / 최대 3 inputs / 군별 cap12의 TEST_VALUE를 유지한다.

### Dishonored 2 — ADAPT real systemic choice, REJECT genre identity

**ADAPT**
- 복수 해법을 UI의 ‘루트 버튼’이 아니라 시스템 상호작용으로 실제 지원한다.
- 첫 선택이 결과를 만들고 다른 선택도 정당한 trade-off를 갖게 한다.

**REJECT**
- 잠입/살상·비살상 중심의 액션 판타지.
- GRIMOIRE의 5개 intent를 메뉴형 정답 route로 고정하는 것.

**GRIMOIRE delta**
- `시설복구/생명구조/정령교섭/봉쇄/전투제압`은 사후 Intent/Result semantics다. Target + FIVE_POINT_STAR circuit + context + protected value가 결과를 만든다.

### I Was a Teenage Exocolonist — ADAPT longitudinal consequence, REJECT deckbuilding/timeloop

**ADAPT**
- 여러 해 동안의 선택·스킬·관계가 플레이어의 장기 정체성과 결과를 만든다는 구조.
- 실패/부분성공도 이후 판단의 근거가 될 수 있다는 관점.

**REJECT**
- Deckbuilding이나 timeloop를 GRIMOIRE 시스템으로 가져오는 것.

**GRIMOIRE delta**
- 장기 증거는 Grimoire와 포트폴리오가 소유하고, 동일 실패를 지워 완벽 루트를 찾는 반복은 금지한다.

### Arx Fatalis — ADAPT embodied magic fantasy, REJECT high-frequency gesture burden

**ADAPT**
- 플레이어 몸/손 입력과 마법 발동이 직접 연결되는 감각.

**REJECT**
- 전투 중 매 행동마다 정확한 gesture를 강제하는 구조.
- 직접 입력이 피로 때문에 시스템 회피를 만드는 것.

**GRIMOIRE delta**
- `GM-WRITING-FREQUENCY-01`: 정상 성공 작성 7회, guided recovery 포함 10회 상한. 이미 확인한 glyph는 Vault/Typed Stock/명시적 token reuse를 허용한다.

## 4. Professional vertical-slice disposition

### GDC / Microsoft / ID@Xbox — ADAPT hypothesis/readiness gate

D의 46분 Slice는 content sampler가 아니다. 다음 질문을 검증하는 **Single-Incident production hypothesis**다.

1. 직접 작성 7회가 마법 판타지를 강화하면서 피로를 통제하는가?
2. 2-of-4 조사와 자유일정 1회가 숨은 정답 없이 다른 문맥을 만든다고 느껴지는가?
3. 첫 해결이 실제 개선을 만든 뒤 새 문맥이 드러나도 플레이어가 `처음부터 틀렸다`고 느끼지 않는가?
4. FIVE_POINT_STAR + Stage2/Stage3가 2개 이상의 합리적 해결 방향을 실제로 지원하는가?
5. Result/Grimoire/교수 피드백이 플레이어 자신의 행동 증거와 연결되는가?
6. A1–A4와 Draft/Snapshot 복구가 duplicate Result/Reward/Record 없이 중단복귀를 보존하는가?

**REJECT**
- “RPG니까 전투, 제작, 학교, 축제를 하나씩 넣는다”는 checklist slice.
- 46분 안에 Year-One 전체를 요약 재현하는 것.
- 단지 예쁘게 보이는 pitch demo를 vertical slice PASS로 간주하는 것.

## 5. Store/tag implication — provisional only

Steamworks는 태그가 탐색/추천과 상점 노출에 영향을 주고, 상위 태그가 게임을 설명하므로 실제 콘텐츠를 정확히 반영해야 한다고 설명한다. 따라서 현재 단계의 **가설적** 상위 태그 후보는 다음처럼 관리한다.

```text
RPG
Life Sim
Choices Matter
Magic
Story Rich
```

Secondary candidates after actual build evidence:

```text
Crafting
Atmospheric
Singleplayer
Puzzle
Immersive Sim  # only if systemic depth is demonstrated in playtest
```

이 목록은 Steam Tag Wizard 확정값이 아니다. 실제 플레이 비중과 테스트 결과가 달라지면 재분류한다.

## 6. Implementation consequences

벤치마킹 결과를 코드 구조로 번역하면 다음과 같다.

- 일정/조사/제작/전투를 하나의 `FrostbloomScript`에 하드코딩하지 않는다.
- 기존 `SpellWorkflowCoordinator`, `AtomicSpellUseService`, `AtomicResultLedger`, `SaveRepository`를 재사용한다.
- 온실 전용 주문 계산기·마나 ledger·3×3 회로를 새로 만들지 않는다.
- 사건 layer는 `context → intent → existing spell use → consequence → record`만 소유한다.
- 첫 해결 transaction은 불변 evidence로 보존하고 context reveal은 새 evidence를 **추가**한다.
- 5개 intent는 data-derived tag이지 버튼/분기 enum이 아니다.
- Save/Resume는 Node reference가 아니라 plain data snapshot을 저장한다.
- 실제 시간을 자동화 테스트가 증명했다고 주장하지 않는다. 46/53/60은 content/test gate이고 Human run 전 `FUN_VERIFIED`가 아니다.

## 7. Source URLs

- Witchbrook official: https://www.witchbrook.com/
- Persona 5 Royal official: https://persona.atlus.com/p5r/
- Atelier Ryza official manual: https://www.koeitecmoeurope.com/manual/ryza/en/4100.html
- Dishonored 2 Play Your Way: https://bethesda.net/en-EU/news/dishonored-2-play-your-way
- I Was a Teenage Exocolonist official: https://www.exocolonist.com/
- Arx Fatalis GOG product page: https://www.gog.com/en/game/arx_fatalis
- Steamworks Tags: https://partner.steamgames.com/doc/store/tags
- GDC Vault — The Vertical Slice Challenge: https://gdcvault.com/play/1022328/The-Vertical-Slice
- Microsoft Game Dev Office Hours — Stacey Haffner: https://developer.microsoft.com/en-us/games/articles/2025/09/office_hours_recap_stacey_haffner_072525/
- ID@Xbox Office Hours: https://developer.microsoft.com/en-us/games/articles/2026/01/office_hours_recap_idxbox_091225/

## 8. Decision

```yaml
benchmark_result: PASS_TO_WRITING_PLANS
recommended_architecture: INCIDENT_ORCHESTRATION_OVER_EXISTING_AUTHORITIES
primary_market_classification: RPG
project_descriptor: SYSTEMIC_MAGIC_SCHOOL_RPG
copy_competitor_content: FORBIDDEN
persistent_godot_execution: BLOCKED_BY_HIGODOT_EXECUTOR_AND_TASK8_DEPENDENCY
```
