# GRIMOIRE Decision Log Addendum — 2026-08-01F

## 사용자 지시

> 작업 진행 중 승인 필요한 사항은 일괄 승인 할테니 권장안대로 진행해.

이 지시는 현재 전수 운영·기획 감사와 그 후속 교정에서 제시하는 권장안을 별도 질문 없이 진행하도록 승인한다. 다만 실행하지 않은 런타임·성능·사람 검증이나 Prototype 수치를 검증 완료로 간주하지 않는다.

---

## GM-PROJECT-OPERATING-RECONCILIATION-01

```yaml
status: APPROVED_WORK_SCOPE
approval: USER_BATCH_APPROVAL
```

승인 내용:

- Base v9.3 현행 구조를 기준으로 프로젝트 운영 Drift를 교정한다.
- GitHub 권위 문서·계획 데이터·Google Sheet를 같은 상태로 복구한다.
- 생성 Adapter View와 Snapshot은 손으로 수정하지 않고 원자적으로 재생성한다.
- 제품 코드·Godot 구현은 현재 작업 범위에 포함하지 않는다.
- 검증 통과 시 Draft PR 정리와 병합을 진행한다.

감사 원본:

- `docs/planning/PROJECT_WIDE_OPERATING_AND_DESIGN_AUDIT_2026-08-01.md`.
- Audit ID: `GR-AUDIT-20260801-02`.

---

## ART-BIBLE-01

```yaml
status: APPROVED_DUAL_STANDARD_ART_BIBLE
approval: USER_BATCH_APPROVAL_RECOMMENDED_OPTION
```

승인 내용:

- 비주얼 권위 기준과 Vertical Slice 제작 기준을 분리하는 이중 기준형.
- Soft Storybook 배경 + 선명한 Anime Cel 캐릭터.
- Navy/Gold UI + 고대비 Blue Glyph.
- 고정 주인공 1명, 전투 상시 초상 1개.
- 동반 정령·수호 소환수는 상태 배지로 분리.
- 전투 작성 패널은 축소 Rail에서 행동 시 확장.
- 본문 고딕계, 제목 제한적 세리프계 방향.
- Grimoire 파생 화면을 Main보다 먼저 설계.
- 서사 이름은 `NAMING-PASS-01`로 분리하며 Art Bible을 차단하지 않음.

권위:

- `docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md`.
- 전투 교정: `docs/planning/ART_BIBLE_01_BATTLE_CORRECTION_ADDENDUM_2026-08-01.md`.

---

## GM-BATTLE-RULES-01

```yaml
status: APPROVED_SITUATION_RESOLUTION_RULES
approval: USER_BATCH_APPROVAL_RECOMMENDED_OPTION
benchmark: GR-BM-BATTLE-RULES-01 / QUICK_COMPLETE
```

승인 내용:

- 기본 적에게 일반 HP를 두지 않고 `불안정도`를 사용한다.
- 상황에 맞는 주문으로 불안정도 0에 도달하면 진정·해결한다.
- 별도 포획·Finish·두 번째 게이지는 사용하지 않는다.
- 플레이어 HP 0 또는 선언된 치명적 환경 붕괴가 패배다.
- 환경 보존도·부작용·남은 HP·해결 방식은 결과 품질을 만든다.
- 수호형 소환수는 수동으로 다음 공격의 피해를 완화하지만 타이머·작성·판단을 대신하지 않는다.
- 정확한 수치는 Prototype·사람 검증 전 최종 확정하지 않는다.

권위:

- `docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md`.
- 상태: `docs/planning/BATTLE_RULES_01_STATE.json`.

---

## 다음 Gate

```text
현재 정본 복구·Base Adapter 정합화
→ ASSET-SPEC-01
→ BOSS-PHASE-01·Grimoire/Main 파생 화면
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ 구현
```

정확한 공격 간격·피해량·마나·불안정도 변화량·수호 완화율은 `PLAYTEST_TUNING_REQUIRED`다.
