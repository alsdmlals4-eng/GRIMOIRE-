# 스펠 Asset License Ledger

- 프로젝트: `스펠` (임시)
- 마지막 검토일: 2026-07-27
- 현재 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- 시각 표현 구조: `LANDSCAPE_HYBRID_2D_CONFIRMED`
- 외부 자산: `NO_EXTERNAL_ASSETS_REGISTERED`
- 생성·편집 자산: `NOT_STARTED`
- 아트·사운드 대량 제작: `BLOCKED_BY_CHARACTER_PRESENTATION_ART_BIBLE_ASSET_SPEC_AND_AUDIO_DIRECTION`

> 실제 출처·라이선스·상업 이용·수정 가능 여부·생성 이력·적용 경로를 확인하지 않은 자산을 최종 자산으로 승인하지 않는다.

## 확정된 화면 전제

```text
가로형 16:9 기준 구도
→ 18:9~20:9 좌우 월드 확장

고정·장면 기반 3/4 월드
→ 기존 배경 위 대화 초상
→ 월드 감속·암전형 마법 작성 오버레이
```

자산은 세로형·자유 카메라·대형 자유 탐색을 전제로 제작하지 않는다.

## 조달 순서

```text
화면 방향·카메라·게임 표현 구조 — 확정
→ 캐릭터 표현 수준 정의
→ 그림체 후보 비교·선정
→ Art Bible·Asset Specification
→ Audio Direction
→ 기존 승인 자산
→ 보유 자산
→ Godot Asset Library·플러그인·외부 후보
→ 라이선스·기술·스타일·성능 검토
→ 채택·수정·Trial
→ 적합한 것이 없을 때만 생성
→ 실제 게임 적용·런타임 검수
```

외부 Godot 자산·플러그인을 조사할 때 `evaluating-godot-assets-and-plugins-before-creation`을 사용한다.

## 자산 원장

| Asset ID | 자산 | 용도 | 유형 | 출처·URL | 버전 | 가격 | 라이선스 | 상업 이용 | 수정 | 크레딧 | 생성·편집 도구 | 제작 브리프·프롬프트 경로 | 참조 자산·파생 관계 | 사용자 승인 | 적용 경로 | 런타임 검증 | 상태 |
|---|---|---|---|---|---|---:|---|---|---|---|---|---|---|---|---|---|---|
| 없음 | 외부·생성 자산 미등록 |  |  |  |  |  |  |  |  |  |  |  |  |  |  | `NOT_RUN` | `NOT_REGISTERED` |

## 후보 판정

- `ADOPT_AS_IS`
- `ADAPT`
- `COMBINE`
- `PROTOTYPE_ONLY`
- `CREATE_REQUIRED`
- `REJECT_LICENSE`
- `REJECT_STYLE`
- `REJECT_TECHNICAL`
- `UNVERIFIED`

## 생성·편집 자산 규칙

생성 또는 편집한 이미지·사운드·효과도 출처 추적 대상이다.

필수 기록:

- 자산의 실제 화면 역할
- 생성·편집 도구와 실행 날짜
- 제작 브리프 또는 프롬프트의 저장 경로
- 사용한 사용자 제공 참조와 외부 참조의 출처
- 원본→수정본→최종본 파생 관계
- 상업 이용과 수정 가능 여부
- 사용자 승인 상태
- Godot 적용 경로
- 실제 화면·성능·접근성 검증 결과

단순히 생성이 성공했다는 이유로 `APPROVED_FINAL`로 판정하지 않는다.

## 배경 자산 전제

- 가로형 3/4 고정 장면
- 기준 구도 16:9
- 18:9~20:9에서 좌우 확장 가능한 레이어
- 학교 기본·시험·자유일정·축제 상태 변형
- 현장 전투·환경·복구 상태 변형
- 캐릭터 기준선과 상호작용 지점 일관성

배경을 화면비마다 별도로 제작하지 않는다.

## 캐릭터 자산 전제

필요 슬롯:

- 필드·장면용 주인공·NPC 표현
- 대화용 초상 또는 반신
- 메인 동반 소환수의 필드·대화 반응
- 전투 보조 소환수의 전투 실루엣

정확한 비율·표정·애니메이션 수량은 `GM-CHARACTER-PRESENTATION-01`에서 확정한다.

## 메인 동반 소환수·마스코트

현재 상태:

- 세계관 역할: `CONFIRMED_BY_GM-MASCOT-01`
- 플레이어 관계: `ALWAYS_ACCOMPANIES_PLAYER`
- 핵심 기능: 학습·관계·일상·현장·마도서 기록 연결
- 전투 책임: 주력 전투 유닛 아님
- 화면 구조: 가로형 3/4 월드와 대화 반응 슬롯
- 시각 정체성: `NOT_DESIGNED`
- 스토어 아이콘·캡슐 역할: `NOT_DESIGNED`
- 사운드 정체성: `NOT_DESIGNED`

시각 정체성은 `GM-CHARACTER-PRESENTATION-01 → ART-STYLE-01` 이후 설계한다.

## 아트·사운드 제작 전 차단 조건

다음이 확정되기 전에는 대량 제작하지 않는다.

- 주인공·NPC·소환수의 필드·대화 표현 수준
- 그림체 기준 샷 사용자 승인
- Art Bible
- 목표 내부 해상도·안전 영역
- 캐릭터·배경·UI·효과·사운드 수량 예산
- 자산 상태·변형·파일 규격
- Audio Direction Card

스타일 비교용 소수의 기준 이미지는 `ART-STYLE-01` 단계에서 사용자 승인 후 제작할 수 있다.

## 현재 `NOT_RUN`

- Godot Asset Library 검색
- 플러그인 기술 Trial
- 제3자 라이선스 법률 검토
- UI Kit·폰트·사운드 후보 조사
- 그림체 기준 샷 제작
- 캐릭터·배경·효과·사운드 생성
- 실제 적용·성능·접근성 검수
- 사람 시각·청각 검수

자산 작업이 시작되면 후보별 출처와 확인 날짜를 기록한다.
