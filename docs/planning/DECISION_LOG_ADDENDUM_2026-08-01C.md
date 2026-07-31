# Decision Log Addendum — 2026-08-01C

## GM-BATTLE-SINGLE-ENEMY-FOCUS-01

- 상태: `APPROVED_ENCOUNTER_DIRECTION`
- 승인자: 사용자
- 승인 시각: 2026-08-01 05:26 KST
- 범위: Vertical Slice 기본 전투 조우

### 결정

강한 적 1개체에 집중하는 전투를 기본형으로 사용한다.

```text
강한 적 1개체
+ 적·환경 중심 전장
+ 좌측 하단 아군 초상
+ 우측 축소형→확장형 마법 작성
```

### 제외

- 기본 조우의 다수 잡몹.
- 웨이브 증원.
- 아군·수호 소환수 몸체의 전장 상시 배치.

### 후행

- `BATTLE-UX-01`: 화면 동선·정보 위계·패널 상태.
- `BATTLE-RULES-01`: 행동 순서·페이즈·승리 조건.
- `ASSET-SPEC-01`: 적 표현 규격·초상·FX 수량.
- 밸런스 Gate: HP·비용·피해·행동 빈도.

### 검증 경계

Godot 구현, Runtime, PC 입력, 사람 플레이테스트는 모두 `NOT_RUN`이다.
