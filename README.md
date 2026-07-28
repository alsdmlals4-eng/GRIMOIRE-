# GRIMOIRE: 세계를 다시 쓰는 법 

모바일 터치 기반 마법 글자·회로 전투와 마법학교 생활을 결합한 Godot 프로젝트입니다.

- 저장소: `https://github.com/alsdmlals4-eng/Spell`
- 엔진: Godot
- 목표 플랫폼: Android / Google Play
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- 적대적 검토 루프 02: `PASS_WITH_CORRECTIONS`
- 시각 표현: `LANDSCAPE_HYBRID_2D_WITH_SEPARATE_TACTICAL_BATTLE_CONFIRMED`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`

## 시작

1. `START_HERE.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
4. `docs/planning/DECISION_LOG.md`
5. `docs/planning/GATE_2_ADVERSARIAL_REVIEW_LOOP_2026-07-27B.md`
6. `docs/planning/GATE_2_VISUAL_PRESENTATION_SYSTEM.md`
7. `docs/planning/GATE_2_CHARACTER_PRESENTATION_SYSTEM.md`
8. `docs/planning/GATE_2_SUMMON_GROWTH_AND_FORM_SYSTEM.md`
9. `docs/DEVELOPMENT_GATES.md`
10. `docs/DESIGN_DOCUMENT_REGISTRY.json`

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

- 첫 완주 목표 `45~50분`, 상한 `60분`
- 공통 문제 계약 `Situation Challenge`
- 자유일정 `휴식 / 준비 / 교류`
- CORE_POC `REMOVED_BY_USER_DECISION`

## 화면·캐릭터·전투

```text
학교·자유일정·탐색
= 가로형 고정·장면 기반 3/4 필드
= 3.5~4등신 SD 캐릭터

대화
= 같은 장소 배경 위 반신 일러스트

전투
= 별도 고정 3/4 전술 전투장
= 필드 SD 비율 재사용

마법 작성
= 현재 화면 감속·암전 + 작성 오버레이

전투 종료
= 결과를 반영한 필드 복귀
```

- 기준 구도 `16:9`
- 확장 대응 `18:9~20:9`
- 자유 이동형 대형 학교와 대형 전투장은 초기 Slice 제외

## 소환수

```text
메인 동반 소환수
= 원소·정령 중심의 고정 동반자
= 장기 4단계 성장
= 해금된 이전 형상 선택 가능
= 장기 탑승 기능

전투 보조 소환수
= 위험·전투에서 호출
= Vertical Slice는 수호 또는 견제 1체
```

Vertical Slice는 메인 동반 초기 형상 1개만 런타임 필수입니다. 2~4단계 전체, 형상 선택 UI와 탑승은 후행합니다.

## 재질문 방지

이미 확정된 내용을 다시 묻기 전에 반드시 다음을 확인합니다.

```text
START_HERE
→ ACTIVE_CONTEXT
→ CURRENT_CONFIRMED_DECISIONS
→ DECISION_LOG
→ 주제별 책임 원본
```

## 다음 결정

`ART-STYLE-01`

승인된 필드 SD·대화 반신·별도 전투장·원소 정령 소환수 구성을 동일하게 사용해 그림체 후보를 예상 인게임 이미지로 비교합니다.

현재는 대량 자산 제작, Godot 구현, Codex 실행, Draft PR 병합을 하지 않습니다.
