# Base UX/UI 채택 기록

- Base repository: `alsdmlals4-eng/Base`
- Base main commit: `0fd95f4513343e77fd664af2763a01b02f52545b`
- Shared Skill: `auditing-and-refining-ui-art`
- Project source of truth: `docs/UX_UI_SYSTEM.md`
- Project adapter: `skills/PROJECT_BASE_SKILL_ADAPTER.json`
- Adopted at: `2026-07-29`

## 적용 범위

- 모바일 마법 글자 작성·인식·수정 UX
- 인식 실패와 주문 문법/설계 실패 분리
- 점진 학습, 실행 전 비용·위험, 오류 복구, 결과 인과
- Godot UI와 인식·주문 도메인 상태 소유권 분리

## 검증 상태

- 문서·JSON·PR 검증: 실행
- 제품 코드·Scene·data·asset 변경: 없음
- Godot project/runtime: `NOT_AVAILABLE_NO_BUILD`
- Android device: `NOT_RUN`
- Human understanding: `HUMAN_NOT_RUN`

공용 원리는 Base에 유지하고 마법 글자·문법·인식 알고리즘·실제 수치·플레이테스트 결과는 GRIMOIRE에 유지한다.
