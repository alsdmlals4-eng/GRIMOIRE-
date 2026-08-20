# Research Receipt — Frostbloom 44~46 Portfolio / Preview Evidence Echo

```yaml
work_unit: FROSTBLOOM_44_46_PORTFOLIO_PREVIEW
research_date_kst: 2026-08-20
decision_target: GM-FROSTBLOOM-PORTFOLIO-PREVIEW-EVIDENCE-ECHO-01
base_main_observed: 3cdb82f94af402fedcc9c1e80902d1d01b8d3ab3
project_main_parent: 7d760559f218dcd6513748a2fc8123f174e699b9
scope: PATTERN_LEVEL_ONLY
competitor_expression_copying: FORBIDDEN
```

## Work question

첫 세션 마지막 2분에서 어떻게 플레이어의 실제 행동과 원리를 인정하면서도 멘토 채점, 결과 재점수화, 새 퀘스트/분기, 두 번째 사건, 긴 예고편으로 scope가 커지는 것을 막을 것인가?

## Existing Solution First

이미 저장소에는 다음 권위가 있다.

- `BEAT_08 — 44–46 PORTFOLIO_AND_PREVIEW`
- Portfolio evidence records the completed spiral.
- Festival remains `PREVIEW_ONLY`.
- no separate exam / second incident / mandatory branch.
- 39~44 Result/Grimoire는 five-axis result, actual-receipt causality, player-authored principle을 소유한다.

따라서 이번 work unit은 새 평가·퀘스트·Festival 시스템을 만들지 않고 마지막 표시/반응 순서만 refinement한다.

## Sources

### 1. Hades reactive acknowledgement

- Source: Game Developer, “How Supergiant weaves narrative rewards into Hades' cycle of perpetual death”
- URL: https://www.gamedeveloper.com/design/how-supergiant-weaves-narrative-rewards-into-i-hades-i-cycle-of-perpetual-death
- Role: developer-interview-based industry source
- Freshness: evergreen design reference; checked 2026-08-20
- Relevant observation: Greg Kasavin describes reactivity as a narrative goal so players can feel that the game is paying attention to what happened.
- Disposition: **ADAPT** the acknowledgement pattern only. Do not copy dialogue, characters, or event-trigger implementation.

### 2. Outer Wilds curiosity-driven exploration

- Source: GDC / Alex Beachum, “Sparking Curiosity-Driven Exploration”
- URL: https://media.gdcvault.com/GDC%2B2021/beachum_gdc_2021%281%29.pdf
- Supporting official studio archive: https://www.mobiusdigitalgames.com/news/category/outer-wilds
- Role: primary/developer design material
- Freshness: evergreen design reference; checked 2026-08-20
- Relevant observation: curiosity starts with a question that motivates discovery; Mobius also describes pathing choices as ideally motivated by curiosity rather than random choice.
- Disposition: **ADAPT** one open question as curiosity fuel, explicitly not a quest/objective.

### 3. Heaven's Vault remembered/reactive choices

- Source: inkle official press kit / game page
- URL: https://www.inklestudios.com/press/heavensvault/
- URL: https://www.inklestudios.com/heavensvault/
- Role: first-party product/design description
- Freshness: evergreen product reference; checked 2026-08-20
- Relevant observation: the narrative engine remembers choices and paths, and characters react to what the player says/does; translations can remain uncertain rather than immediately becoming objective truth.
- Disposition: **ADAPT** remembered evidence and descriptive reaction; preserve uncertainty.

### 4. Pentiment lasting consequences

- Source: Xbox Wire, “Pentiment Available Now”
- URL: https://news.xbox.com/en-us/2022/11/15/pentiment-available-now/
- Role: first-party publisher/developer release description
- Freshness: evergreen product reference; checked 2026-08-20
- Relevant observation: player decisions and accusations have lasting consequences that persist through the community.
- Disposition: **REFERENCE_ONLY** for consequence continuity. Do not use the final 2 minutes to replay a broad consequence montage or create a verdict screen.

## Alternatives considered

| Option | Core | Benefit | Primary risk | Disposition |
|---|---|---|---|---|
| A · Evidence Echo + One Open Question | evidence acknowledgement → save receipt → open question/glimpse | preserves ownership + curiosity | can still become mentor grading if wording slips | **ADOPT** |
| B · Mentor Evaluation + Teaser | mentor verdict + teaser | very clear | bypasses no-global-grade via mentor | AVOID |
| C · Cinematic Festival Stinger | strong audiovisual teaser | high spectacle | buries player's just-authored principle | AVOID for first-slice close |
| D · Next-Inquiry Choice Hook | choose next inquiry | agency | creates branch/objective authority | AVOID |

## Synthesis

Best-fit pattern:

```text
ACTUAL PLAYER EVIDENCE
→ DESCRIPTIVE REACTIVE ACKNOWLEDGEMENT
→ SAVE/CONTINUITY CONFIRMATION
→ ONE UNRESOLVED QUESTION
→ NON-PLAYABLE WORLD GLIMPSE
→ CLOSE
```

The system should demonstrate memory, not judgment. The next-session hook should generate curiosity, not obligation.

## 5-pass adversarial summary

1. Mentor grading attack → `MENTOR_RESPONSE_DESCRIPTIVE_NOT_VERDICT`, `NO_MENTOR_GRADE`.
2. Result rescoring attack → Portfolio receipt only confirms saved/linked/carried state.
3. Questification attack → `OPEN_QUESTION_NOT_OBJECTIVE`, no reward/marker/tracking/branch.
4. Festival scope creep → `FESTIVAL_PREVIEW_ONLY`, no playable second incident/tutorial/lore dump.
5. Two-minute overload → max 3 echo elements + 3 receipt fields + one question + one glimpse + no new gameplay decision.

## Evidence ceiling

Research supports design patterns and risk controls only. It does not prove GRIMOIRE's two-minute pacing, emotional closure, comprehension, mobile readability, or fun. Those remain `NOT_RUN` until Human/Device validation.
