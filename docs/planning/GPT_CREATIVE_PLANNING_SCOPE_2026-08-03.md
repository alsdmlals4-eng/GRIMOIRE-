# GPT 창의 기획·디자인 작업 범위

## 목적

GRIMOIRE 작업에서 GPT와 Codex의 역할을 명확히 분리한다.

```text
GPT = 무엇을 만들지, 왜 재미있는지, 어떻게 보여줄지 설계
Codex = 승인된 설계를 Godot에서 실제로 구현하고 검증
```

GPT 대화에서는 개발환경 설치·Godot 프로젝트 생성·GDScript 구현을 주 작업으로 삼지 않는다. 해당 작업은 Codex 실행 인계 문서에 보관하고 실제 구현 세션에서 수행한다.

## GPT의 우선 작업

### 1. 핵심 재미

- 플레이어가 반복해서 하고 싶은 행동을 한 문장으로 정의한다.
- `상황 판독 → 글자 선택·작성 → 주문 설계 → Commit → 세계 변화 → 복기` 루프가 실제로 재미를 만드는지 검증한다.
- 직접 작성, Stock, 소환수 중 어느 수단을 선택할지 고민하게 만드는 갈등을 설계한다.
- 단순 정답 맞히기가 아니라 해석·응용·책임의 재미가 유지되는지 적대적으로 검토한다.
- 실패가 입력 실수, 문법 오류, 상황 판단 오류로 명확히 구분되는지 확인한다.

### 2. 콘텐츠 기획

- 1학년 Chapter Map.
- 글자 Catalog와 학습 순서.
- 수업, 시험, 현장실습, 제작, 전투의 콘텐츠 비율.
- 대표 사건·상황·적·환경 퍼즐.
- 주문 조합이 서로 다른 결과와 대가를 만드는 콘텐츠 예시.
- 소환수 역할별 사용 상황과 상호작용.
- 마도서 기록·복기·발견 콘텐츠.
- Vertical Slice에 들어갈 실제 플레이 시나리오와 시간 예산.

### 3. UX·화면 기획

- Main Screen과 Grimoire Screen 정보구조.
- 전투·작성·Stock·소환수 HUD의 관계.
- Mobile Landscape Safe Area와 입력 우선순위.
- 작성 Canvas, 후보 선택, Commit 확인, 결과 설명의 흐름.
- 화면별 Wireframe과 상태 전이.
- 접근성·텍스트 크기·터치 영역·정보 밀도.

### 4. 이미지·아트 방향

- 게임의 시각적 정체성.
- 학교, 교실, 마도서, 글자, 주문, 소환수, 전투 공간의 Art Direction.
- 색·재질·조명·실루엣·UI 장식 규칙.
- 캐릭터·소환수·환경·아이콘·이펙트의 Style Guide.
- 이미지 생성용 Prompt와 Reference Brief.
- Concept Art, Moodboard, Key Art, UI Mockup, 아이콘·이펙트 시안.
- 생성 이미지가 실제 Godot 제작 자산으로 전환 가능한지 검토하는 Asset Breakdown.

### 5. 적대적 검토

모든 기획·이미지·아트 제안은 다음을 확인한다.

- 핵심 재미를 강화하는가, 단순 장식인가.
- 다른 시스템과 중복되거나 충돌하지 않는가.
- 모바일 화면에서 읽히는가.
- 제작 비용과 콘텐츠 양이 현실적인가.
- 이미지 시안이 게임 플레이 공간과 UX를 방해하지 않는가.
- 비주얼이 세계관과 기능을 동시에 설명하는가.
- Vertical Slice에서 검증할 수 있는가.

## GPT의 산출물

```text
핵심 재미 정의와 검증 기록
게임 루프·콘텐츠 구조
Chapter·글자·사건·적·소환수 기획
화면 정보구조와 Wireframe
Art Bible과 Style Guide
Concept Art·Moodboard·UI Mockup
이미지 생성 Prompt·Asset Brief
Vertical Slice 콘텐츠 조립안
Codex 구현용 명세와 Acceptance Criteria
```

## Codex로 넘길 작업

```text
project.godot 생성
GDScript 구현
Scene·Resource 제작
Godot Runtime 실행
Headless·Unit·Integration 테스트
Save·Resume·Ledger 구현 검증
CI·Export·실기기 검증
성능·배터리·발열 측정
```

GPT가 구현 세부를 작성할 수는 있지만, 이는 Codex가 실행할 명세·계획으로만 취급한다. GPT 대화의 중심은 창의 기획·디자인과 그 품질 검증이다.

## 현재 GPT 기획 우선순위

1. GRIMOIRE의 핵심 재미를 플레이 단위로 재검증한다.
2. Foundation POC 이후 Vertical Slice에서 실제로 보여줄 대표 콘텐츠를 선정한다.
3. Main·Grimoire·전투·작성 화면의 전체 UX 지도를 정리한다.
4. 게임 전체 Art Direction과 화면별 이미지 시안을 만든다.
5. 1학년 Chapter Map과 글자 Catalog를 설계한다.
6. 전투 수치·결과 평가·성장·경제는 위 콘텐츠 구조가 정리된 뒤 조정한다.

## 현재 상태

```yaml
foundation_poc_technical_plan: READY_FOR_CODEX
foundation_poc_product_implementation: DEFERRED_TO_CODEX
current_gpt_focus: CORE_FUN_CONTENT_UX_IMAGE_ART
required_planning_block_before_gpt_creative_work: NONE
```