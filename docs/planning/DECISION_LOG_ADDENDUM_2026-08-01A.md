# GRIMOIRE 결정 원장 Addendum — 2026-08-01A

## 1. ART-BIBLE-01 접근 방식 승인

```yaml
decision_id: ART-BIBLE-01
approved_scope: APPROACH_ONLY
approved_approach: DUAL_STANDARD
status: APPROACH_APPROVED_DRAFT_USER_REVIEW_REQUIRED
approved_at: 2026-08-01T04:34:00+09:00
approved_by: USER
```

사용자는 `ART-BIBLE-01`을 다음 이중 기준형으로 진행하도록 승인했다.

```text
비주얼 권위 기준
= 최종적으로 보여야 하는 인상·화면 언어·캐릭터 연속성

Vertical Slice 제작 기준
= 1인 제작 범위에서 허용되는 단순화·재사용·복잡도 상한
```

이 승인은 접근 방식에 대한 승인이다. 상세 Art Bible 규칙 전체의 최종 승인이 아니며, 상세 초안은 사용자 검토 후 별도로 승인한다.

책임 문서:

- `docs/planning/ART_BIBLE_01_DRAFT_2026-08-01.md`.
- `docs/planning/ART_BIBLE_01_STATE.json`.

## 2. 잠긴 기준판 보호

- `ART-STYLE-01 = APPROVED_A_MODIFIED` 유지.
- `GR-VISUAL-SITUATION-BOARD-01 = APPROVED_LOCKED_REFERENCE_BOARD` 유지.
- SHA-256: `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`.
- 원본 수정·재생성·리터치·재배치 금지.
- Art Bible은 원본을 변경하지 않고 규칙만 추출.

## 3. 프로젝트 전체 적대적 검토 추가

```yaml
audit_id: GR-AUDIT-20260801-01
status: PASS_WITH_CORRECTIONS_REQUIRED
scope: REPOSITORY_GITHUB_SHEET_VISUAL_AUTHORITY
```

사용자는 Art Bible 작업 이후 기존 프로젝트를 꼼꼼히 살펴보고 누락·충돌·보완 사항을 적대적 검토루프로 확인하도록 지시했다.

책임 문서:

- `docs/planning/PROJECT_ADVERSARIAL_AUDIT_2026-08-01.md`.

핵심 발견:

1. `AGENTS.md`와 `START_HERE.md`의 다음 Gate·최신 Addendum 포인터 지연.
2. Base v9.3 권위와 `BASE_RULES_VERSION`·Adapter v8/v9.1 불일치.
3. Adapter의 Sheet `BLOCKED` 상태와 실제 Readback Pass 충돌.
4. PC 우선과 Mobile Touch 중심 문구·이미지 UI 혼합.
5. 잠긴 이미지의 이름·수치·파티·적 수가 정본으로 오인될 위험.
6. 배경·소환수 예시가 Vertical Slice 제작량을 팽창시킬 위험.
7. Main·Grimoire 완성 화면 Board 누락.
8. 주인공 외형 잠금 범위·동반자 이름·청색/주황 FX 의미 미정.

## 4. 현재 게이트

```text
ART-STYLE-01 = APPROVED_A_MODIFIED
ART-BIBLE-01 = DRAFT_USER_REVIEW_REQUIRED
ASSET-SPEC-01 = BLOCKED_BY_ART_BIBLE
AUDIO-DIRECTION-01 = PENDING_AFTER_ART_BIBLE
CODEX = BLOCKED
GODOT = NOT_STARTED
```

## 5. 구현·자산 경계

- 제품 코드·Scene·Resource·게임 데이터 생성 없음.
- 새 이미지 생성 없음.
- 잠긴 원본 변경 없음.
- 대량 Asset 제작 권한 없음.
- Runtime·PC Input·Mobile·Human 검증 `NOT_RUN`.
- PR #22 Draft·미병합 유지.

## 6. 사용자 검토 필요

1. 주인공 정확한 외형을 최종 고정할 범위.
2. 이미지 속 동반자 이름의 공식 채택 여부.
3. 청색 기본 획·주황 위험/Commit 상태 색 규칙.
4. Main·Grimoire 파생 Board 제작 순서.
5. 제목 Serif·본문 Gothic 이중 Font 방향.
