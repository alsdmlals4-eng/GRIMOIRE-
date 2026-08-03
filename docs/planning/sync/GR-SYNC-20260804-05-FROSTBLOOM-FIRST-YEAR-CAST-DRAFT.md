# GR-SYNC-20260804-05 — Frostbloom First-Year Cast Draft

```yaml
sync_id: GR-SYNC-20260804-05-FROSTBLOOM-FIRST-YEAR-CAST-DRAFT
recorded_at: 2026-08-04T07:27+09:00
repository: alsdmlals4-eng/GRIMOIRE-
branch: agent/foundation-poc-readiness-review
pull_request: 57
draft_decision_id: GM-FROSTBLOOM-CAST-DIALOGUE-01
status: WRITTEN_FOR_USER_REVIEW_NOT_COUNTED
counter_before: 3
counter_after: 3
pending_approved_decisions: 3
implementation: NOT_STARTED
```

## User direction

- 인물을 필요 이상으로 늘리지 않는다.
- 1학년 과정의 지속 관계는 같은 학년 중심으로 구성한다.
- 동급생이 성급한 주문 응용으로 사고를 일으킨다.
- 상급생은 믿음직한 선배로 가끔 등장해 조언과 실무 정보만 제공한다.
- 선배와 교수는 사건의 핵심 목표를 대신 해결하지 않는다.

## Draft result

```text
에일린 교수
+ 카시안 동급생
+ 마렌 선배 카메오
+ 모트 동반 정령
```

- 기존 고립 학생 `네아`는 제거했다.
- 카시안은 `흐름+집중`을 닫힌 회수관에 사용해 역압 사고를 일으킨다.
- 카시안은 격벽 안쪽에서 밸브·격벽을 조작하며 해결에 협력한다.
- 마렌은 인접 온실 확산 차단을 담당하며 도면과 시설 명칭만 원격으로 설명한다.
- 제거된 정보 책임은 압력계·도면·시설 표식·교수 모니터·주문 잔향으로 이동했다.

## Updated draft files

- `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_DRAFT_2026-08-04.md`
- `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`
- `docs/superpowers/specs/2026-08-04-frostbloom-cast-dialogue-design.md`

## Guardrails

```text
EXCESSIVE_CAST_FOR_SINGLE_EVENT = PROHIBITED
UPPERCLASS_AS_REGULAR_FIRST_YEAR_PARTY_MEMBER = PROHIBITED
UPPERCLASS_SOLVES_CORE_OBJECTIVE = PROHIBITED
CLASSMATE_ACCIDENT_AS_MALICIOUS_PRANK = PROHIBITED
CLASSMATE_AS_PASSIVE_NUISANCE_ONLY = PROHIBITED
ONE_CHARACTER_OWNS_ALL_CRITICAL_INFORMATION = PROHIBITED
```

## Next gate

사용자가 축소된 인물 구성, 사고 발단, 동급생·선배 역할을 검토한다. 승인 전에는 `02_현재_확정결정`과 Grill 카운터에 새 Decision으로 반영하지 않는다.
