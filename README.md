# 스펠 (임시)

모바일 터치 기반 마법 글자·회로 전투와 마법학교 생활을 결합한 Godot 프로젝트입니다.

- 저장소: `https://github.com/alsdmlals4-eng/Spell`
- 프로젝트명: `스펠` (임시)
- 엔진: Godot
- 목표 플랫폼: Android / Google Play
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- 시각 표현 구조: `LANDSCAPE_HYBRID_2D_CONFIRMED`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`

## 시작

1. `START_HERE.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/planning/GATE_1_FINAL_APPROVAL.md`
4. `docs/planning/GATE_2_ADVERSARIAL_REVIEW_LOOP_2026-07-27.md`
5. `docs/planning/GATE_2_VISUAL_PRESENTATION_SYSTEM.md`
6. `docs/DEVELOPMENT_GATES.md`
7. `docs/DESIGN_DOCUMENT_REGISTRY.json`
8. `docs/ASSET_LICENSE_LEDGER.md`

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

- 첫 완주 목표: `45~50분`
- 허용 상한: `60분`
- 공통 문제 계약: `Situation Challenge`
- CORE_POC: `REMOVED_BY_USER_DECISION`

## 시각 표현 구조

```text
가로형
+ 고정·장면 기반 3/4 월드
+ 기존 배경 위 대화 초상
+ 월드 감속·암전형 마법 작성 오버레이
+ 같은 장면에서 적·환경·보조 소환수 확인
```

- 기준 구도: `16:9`
- 확장 대응: `18:9~20:9`
- 자유 이동형 대형 학교는 초기 Slice에서 제외
- 학교 장면은 수업·시험·자유일정·축제 상태로 재사용
- 현장 장면은 전투·환경·복구 상태로 재사용

## 다음 결정

`GM-CHARACTER-PRESENTATION-01`

```text
캐릭터 표현 수준
→ 그림체 선정
→ Art Bible·Asset Specification
→ 캐릭터·배경·효과 이미지
→ Audio Direction·사운드
→ 실행 프로필 전환 재검토
```

현재는 대량 자산 제작, Godot 구현, Codex 실행, Draft PR 병합을 하지 않습니다.
