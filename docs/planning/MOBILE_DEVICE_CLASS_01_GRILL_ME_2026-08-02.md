# GM-MOBILE-DEVICE-CLASS-01 — Mobile 기기 범위 Grill Me

```yaml
decision_id: GM-MOBILE-DEVICE-CLASS-01
status: USER_DECISION_REQUIRED
parent_gate: MOBILE-FOUNDATION-01
orientation: LANDSCAPE_FIXED
blocks: REQUIRED_ASPECT_MATRIX / TABLET_LAYOUT_RULES / MINIMUM_DEVICE_MATRIX
nonblocking: RESUME_SAVE / SMARTPHONE_LAYOUT_CANDIDATES / STATE_ERROR_HIERARCHY
```

## 질문

Vertical Slice에서 Smartphone과 Tablet을 어떤 지원 범위로 볼 것인가?

## A — Smartphone 우선, Tablet Best-effort 검증

**권장안.**

- Vertical Slice의 필수 지원·품질 Gate는 Smartphone Landscape로 한정한다.
- Tablet은 실행·Safe Area·정보 위계 Smoke Test를 하지만 동일 품질·최종 Layout을 약속하지 않는다.
- Tablet 전용 4:3·3:2 재배치는 Vertical Slice 이후 평가한다.
- 지원 문구에서 Tablet 정식 대응을 약속하지 않는다.

장점:

- Solo 제작 범위와 QA Matrix를 통제한다.
- 직접 작성 Canvas·Battle 정보 위계를 Phone에서 먼저 검증할 수 있다.
- Tablet을 완전히 차단하지 않아 이후 확장 증거를 수집할 수 있다.

위험:

- 초기 Tablet 화면은 여백이 크거나 밀도가 낮을 수 있다.
- Tablet 정식 지원 결정이 후속 작업으로 남는다.

## B — Smartphone·Tablet 동시 정식 지원

- Phone 16:9~20:9와 Tablet 4:3·3:2를 같은 Vertical Slice 통과 조건으로 둔다.
- Field·Dialogue·Writing·Battle·Result·Grimoire·Main에 Tablet 재배치 규칙을 함께 만든다.
- 최소 기기·성능·Text/Canvas Scale Matrix도 두 기기군으로 확장한다.

장점:

- 넓은 Canvas와 Stylus 사용 가능성이 있는 Tablet 경험을 일찍 확보한다.
- 출시 플랫폼 범위를 빠르게 넓힌다.

위험:

- Layout·Asset Consumer·QA 경우의 수가 크게 증가한다.
- 핵심 재미 검증보다 반응형 UI 제작이 선행될 수 있다.
- 현재 Solo Vertical Slice 범위와 충돌할 가능성이 높다.

## C — Smartphone 전용, Tablet 명시적 미지원

- Vertical Slice와 초기 출시 범위에서 Tablet을 차단하거나 미지원으로 명시한다.
- Phone Matrix만 검증한다.

장점:

- 가장 작은 제작·QA 범위.
- Layout 기준이 명확하다.

위험:

- Stylus·넓은 작성 Canvas에 적합한 기기군을 조기에 배제한다.
- 후속 Tablet 지원 시 구조 변경 비용이 커질 수 있다.

## 권장 판정

```text
추천 = A
이유 = 핵심 직접 작성·상황 해결 경험을 Smartphone에서 먼저 증명하면서
       Tablet 확장 가능성은 Smoke Test로 보존하기 때문
```

A를 채택하면 초기 필수 Aspect Matrix는 Smartphone Landscape `16:9 / 18:9 / 19.5:9 / 20:9 + 좌우 Cutout`으로 두고, Tablet `4:3 / 3:2`는 Best-effort 기록만 남긴다.

## 답변 형식

- `A` 또는 `권장안대로`
- `B`
- `C`
- 수정 조건을 직접 작성
