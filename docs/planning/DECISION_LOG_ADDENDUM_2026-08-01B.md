# GRIMOIRE 결정 원장 Addendum — 2026-08-01B

## GM-BATTLE-SCREEN-LAYOUT-01

```yaml
status: APPROVED_LAYOUT_DIRECTION
approved_at: 2026-08-01T05:04:00+09:00
approved_by: USER
refines: GM-BATTLE-PRESENTATION-01
benchmark: GR-BM-BATTLE-SCREEN-LAYOUT-01 / QUICK_COMPLETE
```

사용자가 전투 화면의 시각·UX 방향을 다음과 같이 승인했다.

```text
전투장 상단·중앙
= 적과 환경 목표만 상시 표시

좌측 하단
= 아군 얼굴 초상·자원·상태

우측
= 직접 마법 글자·마법진 작성 영역
```

### 해석

- 별도 고정 3/4 전술 전투장 결정은 유지한다.
- 아군 주인공·동료·수호 소환수의 몸체는 전장에 상시 배치하지 않는다.
- 아군 행동·피격·보호는 초상 반응, 방향성 FX, 짧은 Cut-in으로 표현할 수 있다.
- 수호 소환수는 좌측 하단 상태 배지와 발동 순간 연출을 사용하며 적을 장시간 가리지 않는다.
- 작성 중에도 적의 행동 예고·대상·환경 위험이 보여야 한다.
- 파티 인원, 수치, 패널의 정확한 비율은 아직 확정하지 않는다.

### 책임 원본

- `docs/planning/BATTLE_SCREEN_LAYOUT_01_APPROVAL_2026-08-01.md`
- `docs/planning/BATTLE_SCREEN_LAYOUT_01_STATE.json`
- `docs/planning/benchmarks/BATTLE_SCREEN_LAYOUT_01_QUICK_BENCHMARK_2026-08-01.md`

### 후행

- `ART-BIBLE-01` 최종본에 반영.
- `BATTLE-UX-01`에서 작성 패널 개폐 방식·초상 정보·행동 순서 결정.
- `ASSET-SPEC-01`에서 실제 크기·수량·상태·파일 규격 결정.
- Codex·Godot 구현은 계속 차단한다.
