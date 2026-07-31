# GRIMOIRE 개발·기획 게이트

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
baseline_date: 2026-07-31
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
work_mode: PLAN
gate_1: APPROVED
planning_complete: true
benchmark_complete: true
adversarial_review_complete: true
art_style_01: APPROVED_A_MODIFIED
locked_visual_reference: APPROVED_NO_EDIT
next_greenlight: ART-BIBLE-01
implementation_ready: false
codex: BLOCKED
```

현재 승인은 콘셉트·기획·범위·플랫폼·Art Style과 화면 구성 방향을 확정한다. 구현·런타임·성능·접근성·사람 플레이테스트 통과를 의미하지 않는다.

## 1. 전체 제품 경로

```text
Gate 1 콘셉트·Vertical Slice — 완료
→ 기획 완결 패스 — 완료
→ 벤치마킹 패스 — 완료
→ 적대적 기획 검토 — 완료
→ ART-STYLE-01 — 승인 완료
→ ART-BIBLE-01 — 현재 Gate
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan
→ 기술 검수
→ 실행 프로필 전환 재검토
→ Validation-First 구현
→ QA·외부 플레이테스트
```

`CORE_POC`는 `REMOVED_BY_USER_DECISION / REINTRODUCTION_FORBIDDEN`이다.

## 2. Gate 1 — 콘셉트·Slice

상태: `APPROVED`

승인 범위:

- 플레이어 약속과 비타협 코어.
- 메인 1 + 보조 0개 이상 문법.
- 수업·시험·축제·현장실습.
- 자유일정 3회.
- 공통 Situation Challenge.
- 45~50분 목표·60분 하드 상한.
- 2계층 소환수.
- 필드·대화·별도 전술 전투 표현.

책임 원본:

- `docs/planning/GATE_1_FINAL_APPROVAL.md`.
- `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`.

## 3. 기획 완결 게이트

### 3.1 PLANNING-CONTENT-01

상태: `APPROVED`

- 글자 `흐름 / 집중 / 분산`.
- 주인공·교수·동급생·동반자 역할.
- 다섯 Situation Challenge와 복수 해법.
- 자유일정 효과와 무최적해 원칙.
- 귀환·마도서 기록 보상.

### 3.2 PLANNING-PLATFORM-01

상태: `APPROVED_WITH_PLAYTEST_TUNING_PENDING`

- PC 마우스 드래그·펜 보조.
- 키보드 Undo·취소·후보 확정.
- 명시적 시전 전 자원 미소모.
- 정상 완주 필수 성공 작성 7회.
- 안내형 복구 포함 목표 상한 10회.
- Gamepad `DEFERRED / NOT_PROMISED`.
- 모바일은 후속 별도 적응·검증.

미확정:

- 획 허용 오차.
- 선 보정·떨림 완화 수치.
- 화면 감속 비율.
- 인식 알고리즘.

### 3.3 PLANNING-SCOPE-01

상태: `APPROVED_WITH_SOLO_PRODUCTION_CONDITION`

- 목표 중앙값 46분.
- 콘텐츠 상한 53분.
- 하드 상한 60분.
- 학교 공용 장면 1 + 축제 상태 변형 1.
- 현장 장면 1 + 동일 장소 전술 전투장 1.
- 작성 Overlay 1.
- 마도서 화면 1.
- 주인공·교수·동급생.
- 메인 동반 정령·수호형 보조 소환수·폭주 정령.
- 글자 3개.
- Situation Challenge 5개.

### 3.4 PLANNING-REVIEW-01

상태: `PASS_WITH_CORRECTIONS_APPLIED`

책임 원본:

- `docs/planning/GRIMOIRE_PLANNING_ADVERSARIAL_REVIEW_2026-07-31.md`.

## 4. 벤치마킹 게이트

정책: `GM-BENCHMARK-FIRST-01 / ACTIVE`.

새 시스템·핵심 규칙·콘텐츠 구조·UX 흐름을 설계하거나 의미 있게 변경할 때 범위에 맞는 `QUICK / STANDARD / DEEP` 벤치마킹을 수행하고 `ADOPT / ADAPT / REJECT`를 기록한다.

## 5. ART-STYLE-01

상태: `APPROVED_A_MODIFIED`

승인일: `2026-07-31`.

승인 방향:

```text
Soft Storybook Cel 2D Hybrid A 수정안
= 필드 SD
+ 대화 반신
+ 탐색·비전투 글자 작성 Overlay
+ 별도 고정 3/4 전술 전투장
+ 전투 중 작성 Overlay
+ 결과 후 원래 장면 복귀
```

잠긴 기준 이미지:

- Library: `/GRIMOIRE/Visual Authority/GRIMOIRE_ART_STYLE_01_LOCKED_REFERENCE.png`.
- SHA-256: `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`.
- Manifest: `docs/planning/visual/ART_STYLE_01_LOCKED_REFERENCE_MANIFEST.json`.
- 승인 정본: `docs/planning/ART_STYLE_01_APPROVAL_2026-07-31.md`.

잠금:

- 원본 수정·재생성·리터치 금지.
- 원본 크롭·업스케일·텍스트 교체 파일로 대체 금지.
- 패널·색·캐릭터·배경·UI 변경 금지.
- 후속 작업은 별도 파일로 제작.
- 변경은 명시적 사용자 재승인 필요.

통과 근거:

1. 필드 SD·반신·별도 전투 관계가 명확함.
2. 직접 글자 작성이 탐색과 전투에서 모두 읽힘.
3. 주인공과 동반 정령의 화면 간 연속성이 유지됨.
4. 수업·시험·축제·현장실습의 시각 변화가 한 언어로 연결됨.
5. 사용자가 해당 이미지를 기준으로 직접 승인함.

이 승인은 최종 런타임 Asset 크기·Font·Animation·VFX 규격 승인과 다르다.

## 6. ART-BIBLE-01

상태: `NEXT_PRODUCT_GATE`

목적:

승인 기준 이미지를 **수정하지 않고**, 반복 제작 가능한 시각 규칙으로 해석한다.

확정 대상:

- 선 굵기·선 색·셀 명암 단계.
- 필드 SD·대화 반신·전투 SD의 동일 인물 규칙.
- 주인공·동반 정령·보조 소환수의 얼굴·의상·실루엣 키.
- 배경 깊이·질감 밀도·플레이 영역 대비.
- 학교·시험·축제·현장 색 스크립트.
- 네이비·금색 UI Panel·Button·Icon 규칙.
- Font 계층 후보와 가독성 기준.
- 글자 획·집중·분산·위험·대상 FX.
- 전투와 필드의 시각 인과.
- 접근성·모션 감소·무음 피드백.
- PC 16:9 Safe Frame과 Mobile 후속 적응.

통과 조건:

1. 잠긴 기준판 해시를 모든 Art Bible 산출물에 기록.
2. 원본을 편집하지 않고 규칙만 추출.
3. 화면 간 캐릭터·UI·배경 일관성 규칙 확정.
4. 글자·목표·위험을 가리지 않는 대비 기준 확정.
5. 사용자가 Art Bible을 승인.

## 7. ASSET-SPEC-01

상태: `BLOCKED_BY_ART_BIBLE`

확정 대상:

- 내부 해상도·화면비·안전 영역.
- 캐릭터·배경·UI·FX 상태 수량.
- Animation·표정·전투 변형.
- 파일 형식·명명·폴더·라이선스.
- 제작량과 재사용 경계.

## 8. AUDIO-DIRECTION-01

상태: `PENDING_AFTER_ART_BIBLE`

확정 대상:

- 학교·시험·축제·현장·귀환의 음향 정체성.
- 글자 작성·후보·시전·실패 원인 피드백.
- 동반 정령과 수호형 소환수의 청각 구분.
- 무음 대체.
- 제작·라이선스 우선순위.

## 9. 기획·아트 통합 검수

상태: `BLOCKED_BY_ART_BIBLE_ASSET_SPEC_AUDIO`

확인:

- 그림체가 글자·목표·위험을 가리지 않는가.
- 기획 제작량과 Asset Spec 수량이 일치하는가.
- 46분 목표에 연출·대화·입력 시간이 들어가는가.
- PC 우선 입력과 UI가 일치하는가.
- 모바일 후속 적응을 방해하는 하드코딩 가정이 없는가.
- 소환수·인물·배경이 Slice를 팽창시키지 않는가.

## 10. Codex Plan 진입

상태: `BLOCKED`

필수 조건:

1. `ART-STYLE-01` 승인 — 완료.
2. `ART-BIBLE-01` 승인 — 미완료.
3. `ASSET-SPEC-01` 승인 — 미완료.
4. `AUDIO-DIRECTION-01` 승인 — 미완료.
5. 기획·아트 통합 검수 통과.
6. 사용자의 Codex Plan 승인.
7. Base v9.3 Adapter·Snapshot·CI 정합화.
8. Godot 버전·Renderer·플랫폼 범위 재확인.

그 뒤에만 Codex read-only Plan을 작성한다. 구현은 기술 검수와 사용자 승인 뒤 마지막 단계다.

## 11. 구현 중단 조건

- 승인 원본 이미지를 임의로 수정하거나 재생성함.
- 화면마다 주인공·동반 정령·UI가 다른 게임처럼 보임.
- 최종 Art·FX가 글자 궤적·위험·대상을 가림.
- 입력 실패와 설계 실패를 구분하지 못함.
- 직접 작성이 7회 계약을 넘어 반복 피로를 만듦.
- 문제마다 전용 시스템·Scene이 필요함.
- `집중` 또는 특정 자유일정이 전역 최적해가 됨.
- 첫 완주가 60분을 구조적으로 초과.
- 마도서가 자동 주문 Stock으로 작동.
- 보조 소환수 운용이 주문 설계보다 복잡.
- 별도 전투장이 필드와 무관하게 느껴짐.
- 장면·인물·Asset이 제작량 잠금을 초과.

## 12. 현재 검증 경계

- Godot 코드·Scene·Resource·게임 데이터 없음.
- Codex 미실행.
- Art Style 승인 기준판은 방향·화면 구성 권위이며 런타임 Asset이 아님.
- 대량 이미지·사운드 Asset 미착수.
- 외부 Asset·Font·Sound 라이선스 승인 `NOT_RUN`.
- 런타임·PC 입력·모바일·접근성·성능·사람 플레이 `NOT_RUN`.
- PR은 사용자 검토 전 병합하지 않음.
- Sheet 동기화는 working branch 상태와 main 상태를 구분해 수행.
