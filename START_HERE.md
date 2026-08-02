# GRIMOIRE 시작 지점

> 과거 대화 없이 현재 상태와 다음 작업을 복원하는 첫 화면이다.

## 한눈에 보기

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 1차 플랫폼 | `Mobile` |
| 후속 플랫폼 | `PC` |
| 플랫폼 Decision | `GM-PLATFORM-02` |
| Mobile 방향 | `GM-MOBILE-ORIENTATION-01 / LANDSCAPE_FIXED` |
| Portrait·자동 회전 | `VERTICAL_SLICE 제외` |
| 엔진 기준 후보 | `Godot 4.7.1 stable` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| 기획 | `APPROVED` |
| Art Style | `APPROVED_A_MODIFIED_LOCKED` |
| Art Bible | `APPROVED_DUAL_STANDARD_ART_BIBLE` |
| 전투 규칙 | `APPROVED_SITUATION_RESOLUTION_RULES` |
| Asset Spec | `APPROVED_SPEC` |
| 현재 제품 Gate | `MOBILE-FOUNDATION-01` |
| 구현 | `NOT_STARTED` |
| Codex | `BLOCKED` |
| Base | `v9.4.0` |
| Orientation Authority | `ebc3f8f38d4346cc8b5751f5981e3c5997d0b41b` |
| Orientation Main | `0bb1f4e2ee48f426579228e716abdba7edcbfc9c` |
| PR | `#29 / MERGED / CI·ADVERSARIAL PASS` |
| Sheet | `SYNCED_TO_MAIN / MAIN_SHEET_READBACK_PASS` |
| Sync Receipt | `docs/planning/sync/GM-MOBILE-ORIENTATION-01-MAIN.md` |

## 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
4. `docs/planning/PLATFORM_MOBILE_FIRST_02_2026-08-02.md`
5. `docs/planning/MOBILE_ORIENTATION_01_APPROVAL_2026-08-02.md`
6. `docs/planning/TOTAL_PLANNING_ADVERSARIAL_AUDIT_2026-08-02.md`
7. `docs/planning/sync/GM-MOBILE-ORIENTATION-01-MAIN.md`
8. `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`
9. `docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md`
10. `docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md`
11. `docs/planning/ASSET_SPEC_01_APPROVAL_2026-08-01.md`
12. `docs/DEVELOPMENT_GATES.md`
13. `docs/UX_UI_SYSTEM.md`
14. `skills/PROJECT_BASE_ADAPTER.json`

## 현재 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

비타협 코어:

- 의미를 가진 글자와 직접 작성.
- `메인 글자 1개 + 보조 글자 0개 이상`.
- 상황·목표·위험에 따른 주문 설계 판단.
- 입력 실패·문법 실패·상황 설계 실패·비용 부족 분리.
- 즉각적이고 설명 가능한 세계 변화.
- 학습→증명→표현→응용→발견·기록 순환.

## Vertical Slice

```text
첫 수업·교내 연습
→ 자유일정 A
→ 첫 실기시험
→ 자유일정 B
→ 학교축제
→ 자유일정 C
→ 첫 현장실습
→ 귀환·마도서 기록
```

- 글자: `흐름 / 집중 / 분산`.
- 목표 `45~50분`, 콘텐츠 상한 `53분`, 하드 상한 `60분`.
- 직접 작성 성공 7회, 안내형 복구 포함 목표 상한 10회.
- 같은 문제에서 확인한 글자는 Token 재선택 허용.
- 메인 동반 정령 초기 형상 1개, 수호형 보조 소환수 1체.
- 마도서는 해결 과정·결과·부작용·발견을 기록하며 자동 주문 Stock이 아니다.

## 현재 전투

```text
강한 적 1개체
→ 다음 공격 예고·타이머
→ 글자 작성
→ [구현]
→ 마나 검증·즉시 시전
→ 적 불안정도·환경 변화
→ 진정 또는 다음 공격
```

- 일반 적은 단일 페이즈.
- 판단·작성 중 타이머 진행, 시스템 해결 중 정지.
- 선택형 작성 감속 초기 후보 `0.5×`는 `TEST_VALUE`.
- 기본 적의 승리는 HP 0 처치가 아니라 `불안정도 0 → 진정·해결`.
- 플레이어 HP 0 또는 선언된 치명적 환경 붕괴가 패배.
- 환경 보존도·부작용·남은 HP가 결과 품질을 만든다.

## Mobile Landscape 계약

`GM-MOBILE-ORIENTATION-01`에 따라 Mobile Vertical Slice의 핵심 화면은 Landscape 고정이다.

```text
Landscape Main
→ Landscape Field / Dialogue / Schedule
→ Landscape Writing Overlay
→ Landscape Battle
→ Landscape Result
→ Landscape Field Return
→ Landscape Grimoire
```

적용:

- Main·Field·Dialogue·Schedule·Writing·Battle·Result·Grimoire·Settings 전부 Landscape.
- Portrait Gameplay·화면별 혼합 방향·Runtime 자동 회전은 Vertical Slice 제외.
- 기존 16:9 자료는 Landscape 파생 기준으로 보존하지만 Mobile 실기기 통과 증거가 아니다.
- 직접 작성 Canvas와 적 위험·상태·작성 정보의 동시 판독을 우선한다.
- Landscape 고정의 세션 마찰은 Resume Anchor·자동 저장·이어하기로 보완한다.

## 현재 화면·아트

- 고정 3/4 Field, 같은 장소 Half-body Dialogue, 별도 Battle, Result 후 Field 복귀.
- Soft Storybook 배경 + Anime Cel 캐릭터, Navy/Gold UI + Blue Glyph.
- 우측 Writing Panel은 축소 Rail에서 작성 시 확장한다.
- Grimoire 파생 화면을 Main보다 먼저 설계한다.
- 잠긴 기준 이미지 SHA-256: `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`.
- 잠긴 원본 수정·재생성·리터치·재배치 금지.

## MOBILE-FOUNDATION-01

현재 작성 순서:

1. Resume Anchor·Save Ownership.
2. Landscape 지원 Aspect·Safe Area·Notch·System gesture.
3. Touch·Stylus stroke, 후보, Undo·부분 삭제·초기화·취소·확정·구현.
4. 작은 화면에서 적 위험·목표·주인공 상태·Writing Panel 정보 위계.
5. App pause/resume·background/foreground·interrupted stroke·stale request.
6. Device·Memory·Texture·load·frame pacing·battery·thermal 검증 계획.
7. 후속 PC Mouse·Pen·Keyboard 적응 원칙.

아직 확정하지 않는 것:

- Android/iOS·Store 우선순위.
- 지원 Aspect Ratio와 최소 기기.
- Touch target·Canvas·Text scale 최종값.
- Frame rate·Memory·Battery·Thermal 수치.
- 인식 알고리즘·Latency·허용치.

## 적대적 총기획 감사

확인된 첫 P0 충돌인 “방향 미확정 ↔ 가로형·16:9 활성 소비자”는 `GM-MOBILE-ORIENTATION-01`로 해결했다.

남은 분류:

- 자동 보완: Resume Anchor, Save Ownership, 자유일정 효과, PC 입력의 후속 부록화.
- 테스트 필요: Active Timer 접근성, 7~10회 필기 피로, 기기·성능.
- 사용자 중요 결정: 실제 범위 분기나 기획 충돌이 확인될 때만 Grill Me.

## 검증된 운영 상태

PR #29 branch head `ebc3f8f...`, Actions run `30729161745`:

- Generator check: PASS.
- Base v9.4 adoption unit tests: PASS.
- JSON·Registry·authority path checks: PASS.
- Adversarial gate: PASS.

Sheet:

- `00·02·04·10·60·99` 관련 범위 반영.
- Main commit `0bb1f4e...` 재조회.
- `04!H23`, `99!H24`: `MAIN_SHEET_READBACK_PASS`.

## 다음 작업

```text
Resume Anchor·Save Ownership 명세
→ Landscape Aspect·Safe Area·Touch 정보 위계
→ 작은 화면 Writing/Battle 레이아웃 후보
→ MOBILE-FOUNDATION-01 통합 계약
→ 중요 충돌만 Grill Me
→ BOSS-PHASE-01·GRIMOIRE-SCREEN-01
→ AUDIO-DIRECTION-01
→ Mobile 기준 통합 검수
→ Codex Plan 승인·기술 검수
→ 구현
```

## 현재 검증 경계

- Planning·Orientation 문서 정합성: `PASS`.
- GitHub PR #29: `MERGED`.
- Sheet Main Readback: `PASS`.
- Godot Runtime·Mobile device·Aspect·Performance·Accessibility·Human: `NOT_RUN`.

## 현재 금지

- 기본 브랜치 직접 수정.
- Godot 제품 코드·Scene·Resource·게임 데이터 생성.
- Codex Build.
- 잠긴 기준 이미지 편집·재생성.
- Portrait·자동 회전을 승인 없이 Vertical Slice 범위로 확장.
- 미검증 수치를 최종값 또는 검증 완료로 표시.
