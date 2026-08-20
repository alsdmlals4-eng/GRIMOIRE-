# W6 Bounded Consequence Forecast — Fresh Research Receipt

```yaml
research_id: GR-RESEARCH-20260820-W6-BOUNDED-FORECAST
work_unit: GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01
date_kst: 2026-08-20
scope: MINUTE_23_TO_30_W6_PLAYER_EXPERIENCE
project_main_observed: bdfd7d8c711379a01a65c4e84103c7f452a41b34
base_main_observed: 3cdb82f94af402fedcc9c1e80902d1d01b8d3ab3
fresh_research_required: true
competitor_expression_copying: FORBIDDEN
human_validation: NOT_RUN
```

## Work question

`Known 2 / Unknown 2 / Lens 1`만 가진 첫 세션 플레이어가 W6에서 정답 버튼을 받지 않으면서도, 주문 사용 전에 **자신이 알고 있는 결과와 아직 모르는 위험을 공정하게 구분하고 책임 있게 Commit**하게 하려면 어떤 Preview가 필요한가?

## Fresh benchmark

### Into the Breach — consequence legibility

Official source: https://www.subsetgames.com/itb.html

- 공식 소개는 적 공격이 telegraph되고 플레이어가 매 턴 이를 분석해 대응하도록 설계됐다고 설명한다.
- `ADAPT`: 결과 가독성. 플레이어가 이미 알 수 있는 인과는 숨기지 않는다.
- `AVOID`: GRIMOIRE를 완전정보 퍼즐로 만들거나 모든 미래 결과를 확정적으로 노출하는 것.

### Pentiment — incomplete investigation with consequences

Official source: https://news.xbox.com/en-us/2022/11/15/pentiment-available-now/

- 제한된 시간 때문에 모든 단서를 볼 수 없고, 플레이어가 조사할 lead를 고른 뒤 확보한 정보로 판단하며 결과를 감수한다.
- `ADAPT`: 불완전한 정보 자체를 실패가 아니라 책임 있는 판단 조건으로 사용한다.
- `AVOID`: 미조사 사실을 숨은 정답 체크리스트로 만들어 사후에 플레이어를 함정에 빠뜨리는 것.

### Magicka — player-authored spell combination

Official source: https://www.paradoxinteractive.com/games/magicka/about

- 공식 소개는 elements를 조합하는 dynamic spell system과 creative thinking을 핵심으로 둔다.
- `ADAPT`: 주문 조합이 플레이어 표현으로 남아야 한다.
- `AVOID`: `시설복구 / 생명구조 / 정령안정` 같은 상위 의도 버튼이 실제 회로·Target 결정을 대신하는 것.

## Existing Solution First

현재 GRIMOIRE에는 이미 필요한 권위가 있다.

```text
Stage 2 = circuit placement + BASE_SPELL_SUCCESS + base preview + no target + no mana consumption
Stage 3 = explicit target + FINAL_TARGET_SUCCESS + expected result/risk/mana + explicit use
W6 existing case = first major solution must improve real state and remain preserved through Reveal/W7
```

따라서 새 intent system, route selector, parallel draft optimizer, 별도 forecast transaction을 만들지 않는다.

## Alternatives reviewed

| Alternative | Value | Main failure mode | Disposition |
|---|---|---|---|
| A · Bounded Consequence Forecast | Known과 Unknown을 분리하고 기존 Stage 2/3를 그대로 소비 | Preview가 정답 추천으로 과도해질 수 있음 | **ADOPT / USER_APPROVED** |
| B · Explicit Priority Declaration | 보호가치가 명확함 | named route가 회로/Target 표현을 대체 | AVOID_FOR_FIRST_SLICE |
| C · Minimal Forecast / Cast-to-Learn | 신비감이 강함 | 현재 Stage 3 detailed preview와 충돌, 숨은 실패 체감 | REJECT |
| D · Two-Draft Compare | 비교 전략이 선명함 | 첫 세션 최적화 화면/인지부하 증가 | DEFER |

## Selected synthesis

```text
Observed Evidence
→ FIVE_POINT_STAR design
→ Stage 2 base preview (NO TARGET)
→ explicit Target
→ Known Improvement
→ Uncertain Consequence
→ FINAL_TARGET_SUCCESS breakdown
→ exact Mana cost
→ explicit Commit
→ actual consequence
→ preserved W6 fact + remaining uncertainty
```

`Known Improvement`는 관찰한 사실과 현재 선택한 회로·Target으로 정당화할 수 있는 방향만 보여준다. `Uncertain Consequence`는 미조사 사실의 결과를 발명하지 않고 **무엇을 장담할 수 없는지** 표시한다. Unknown은 숨은 숫자 감점이나 정답 누락 판정으로 변환하지 않는다.

## Evidence ceiling

이 receipt와 이후 문서/fixture/TDD는 구조·정보 경계·권위 정합성만 검증한다. 실제 23~30분 달성, 플레이어가 Preview를 공정하다고 느끼는지, 선택 이유를 이해하는지, 모바일 화면 가독성은 Human/Device test 전까지 `NOT_RUN`이다.
