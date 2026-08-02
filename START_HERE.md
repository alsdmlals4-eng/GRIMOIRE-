# GRIMOIRE 시작 지점

> 과거 대화 없이 현재 상태와 다음 작업을 복원하는 첫 화면이다. 세부 기획은 연결된 책임 원본을 우선한다.

## 현재 상태

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 1차 플랫폼 | `Mobile` |
| 후속 플랫폼 | `PC` |
| 방향 | `LANDSCAPE_FIXED` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Base 정본 | `v9.4.3` |
| 기준 main | `50a00f9f4ec992338a93e3dc75726b5bc6075a8b` |
| 마지막 main Sync | `GR-SYNC-20260802-24 / SHEET_READBACK_PASS` |
| 현재 Working Sync | `GR-SYNC-20260802-25` |
| 현재 Decision | `GM-STOCK-SYSTEM-01 / GM-SUMMON-SYSTEM-01` |
| 승인 방식 | `USER_DELEGATED_RECOMMENDED_OPTION` |
| Grill Batch | `2/10 / pending 2` |
| 구현 진입 | `APPROVED_CONDITIONAL_FOUNDATION_POC` |
| 제품 구현 | `NOT_STARTED` |
| Codex Plan | `ALLOWED` |
| Codex 실행 | `BLOCKED` |
| Runtime·실기기·성능·접근성·사람 검증 | `NOT_RUN` |

## 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/DESIGN_DOCUMENT_REGISTRY.json`
5. `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`
6. `docs/planning/SUMMON_SYSTEM_01_APPROVAL_2026-08-02.md`
7. `docs/planning/PLANNING_REMAINDER_AUDIT_2026-08-02.md`
8. `docs/planning/benchmarks/STOCK_SUMMON_SYSTEM_01_QUICK_BENCHMARK_2026-08-02.md`
9. `docs/planning/CORE_SYSTEM_ALIGNMENT_01_APPROVAL_2026-08-02.md`
10. `docs/planning/IMPLEMENTATION_ENTRY_01_APPROVAL_2026-08-02.md`
11. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
12. `docs/planning/sync/GR-SYNC-20260802-25-WORKING.md`
13. 질문 주제의 세부 책임 원본

## 플레이어 약속

> 마법학교 학생이 되어 글자의 의미와 상황의 조건을 배우고, 직접 작성·Stock·소환수 주기 지원을 상황에 맞게 운용해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

## 핵심 재미

```text
상황·조건·위험 판독
→ 직접 작성·Stock·소환 운용 중 수단 선택
→ 의미·대상·범위·출력·대가 설계
→ 명시적 Commit 또는 [소환] Commit
→ 원자 결과 적용
→ 설명 가능한 세계 변화
→ 마도서 기록·복기
```

## Stock 권장 기본값

```text
Stock = 확인된 글자 Token
Rack 4칸
동일 글자 최대 2개
Anchor에서 2개 미만이면 2개까지 보정
직접 첫 유효 Commit 후 글자별·Task별 +1
Commit 승인 시 소비
영구·Offline 누적 없음
```

Stock은 완성 주문·대상·상황·자동 최적 조합을 저장하지 않는다.

## 소환수 권장 기본값

```text
메인 소환수 1체 = 상시 활성
메인 Stock 지원 = 20초 후 Token 1개 / Task당 1회
기타 소환수 = [소환] Commit 후 최대 1체
비용 = 최대 마나 20%
지속 = Active Pressure 30초
Cooldown = 20초
주문형 Tick = 10초 / 최대 3회 / 비교 효과 60%
Stock형 Tick = 12초 / 최대 2개
소환수 Stock 합산 = Task당 최대 3개
```

Slice 수호형:

- 플레이어 피해 35% 완화.
- 환경 피해 25% 완화.
- 중첩 불가.
- 자동 주문은 불안정도 0·치명 목표 완료·마지막 승리 Event 금지.

`GM-SUMMON-SYSTEM-01`은 과거 Battle Rules의 수동 1회·자동 행동 금지 수호 소환수 규칙을 대체한다.

## 작성·자동화 예산

```text
의미 있는 주문 해결 7~10회
= 직접 작성 4~6회
+ Stock 보조 2~4회
+ 소환수 자동 행동 1~3회
```

직접 작성이 4회 미만 또는 전체 유효 해결의 40% 미만이면 핵심 경험 약화로 재작업한다.

## Vertical Slice

```text
첫 수업·교내 연습
→ 자유일정
→ 교내 일상 응용·대표 제작 미니게임
→ 학교축제 비전투 응용
→ 첫 현장실습 전투·환경 책임
→ 귀환·마도서 기록
→ 축약 학기 평가·장기 Preview
```

- 별도 시험 Chapter 없음.
- 목표 46분, 콘텐츠 상한 53분, 하드 상한 60분.
- 대표 글자 `흐름 / 집중 / 분산`.
- 대표 제작 미니게임 권장: `촉매 배합·안정화 1개`.
- 추가 선택형 현장실습 전투는 실제 Slice에서 빼고 Preview로 제시하는 안을 권장한다.

## 남은 기획

### P1 — 구현 준비 전 필수

- Stock·Summon State/Ledger/Save 인터페이스.
- 작성·자동화·시간 예산 검증.
- Mobile HUD.
- 전용 자동화·사람 Test 계약.
- Godot Toolchain·Implementation Plan 재검증.

### P2 — Vertical Slice 제작 전 필수

- Battle Tuning·Result Grading.
- 대표 제작 미니게임 최종 계약.
- Grimoire·Main·Audio.
- 접근성·난이도 기본값.
- Year-One 6~8 Chapter Map.
- 커리큘럼 글자 Catalog·수강 슬롯·전문화 시점.
- 성장·학기평가·재료·레시피·인벤토리 수치.
- Slice 장면별 시간 예산.

### P3 — Slice 검증 후

- Boss 다중 페이즈.
- 소환수 장기 성장·탑승·전체 Roster.
- 2·3학년 상세 콘텐츠.
- 출시·Store·PC Adaptation.
- 최종 대량 Asset.

## 구현 진입 경계

Execution Readiness PASS 뒤 최소 Foundation POC만 허용 후보이다.

계속 금지:

- 전체 46~53분 콘텐츠.
- 실제 글자 인식·ML·훈련 데이터.
- 최종 Art·Audio·Asset Import.
- 완성 Grimoire/Main.
- Stock·Summon Runtime의 무단 추가.
- 최종 밸런스·Store·사업화.

## 다음 작업 순서

```text
GM-STOCK-SYSTEM-01·GM-SUMMON-SYSTEM-01 PR 검증
→ 사용자 병합 승인
→ main·Sheet Readback
→ State/Ledger/Save Interface
→ Stock·Summon HUD·Test
→ Slice 제작 미니게임·시간 예산
→ Battle/Result Tuning
→ Grimoire/Main/Audio·접근성
→ Toolchain preflight·Plan 재검증
→ GM-FOUNDATION-POC-EXECUTION-READINESS-01
→ P0=0·P1=0일 때만 코드 실행
```

## 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE = NOT_STARTED
CODE_EXECUTION = BLOCKED
STOCK_DEFAULTS = APPROVED_FOR_PROTOTYPE
SUMMON_DEFAULTS = APPROVED_FOR_PROTOTYPE
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
