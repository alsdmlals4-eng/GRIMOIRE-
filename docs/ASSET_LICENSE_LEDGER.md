# 스펠 Asset License Ledger

- 프로젝트: `스펠` (임시)
- 마지막 검토일: 2026-07-27
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- 시각 표현: `LANDSCAPE_HYBRID_2D_WITH_SEPARATE_TACTICAL_BATTLE_CONFIRMED`
- 캐릭터 표현: `SD_FIELD_HALF_BODY_DIALOGUE_CONFIRMED`
- 외부 런타임 자산: `NO_EXTERNAL_ASSETS_REGISTERED`
- 생성·편집 런타임 자산: `NOT_STARTED`
- 비교용 시각 참조: `REGISTERED_BELOW`
- 대량 제작: `BLOCKED_BY_ART_STYLE_ART_BIBLE_ASSET_SPEC_AND_AUDIO_DIRECTION`

> 출처·사용 권리·생성 이력·파생 관계·사용자 승인·적용 경로를 확인하지 않은 자산을 최종 런타임 자산으로 승인하지 않는다.

## 1. 확정된 화면 전제

```text
가로형 16:9 기준
→ 18:9~20:9 좌우 확장

학교·자유일정·탐색
= 고정·장면 기반 3/4 필드
= 3.5~4등신 SD

대화
= 같은 장소 배경 위 반신 일러스트

전투
= 별도 고정 3/4 전술 전투장
= 필드 SD 비율 재사용

작성
= 현재 화면 감속·암전 + 작성 오버레이
```

세로형·자유 카메라·대형 자유 탐색·대형 전투장을 전제로 자산을 제작하지 않는다.

## 2. 조달 순서

```text
현재 확정 결정 확인
→ ART-STYLE-01 그림체 기준 샷 비교
→ Art Bible
→ Asset Specification
→ Audio Direction
→ 보유·외부·Godot 후보 조사
→ 라이선스·기술·스타일·성능 검토
→ 사용자 승인
→ 생성·편집·적용
→ 런타임 검수
```

외부 Godot 자산·플러그인 조사에는 `evaluating-godot-assets-and-plugins-before-creation`을 사용한다.

## 3. 자산·참조 원장

| Asset ID | 자산 | 용도 | 유형 | 출처 | 권리·라이선스 | 도구·날짜 | 파생 관계 | 사용자 승인 | 저장 상태 | 적용 경로 | 런타임 검증 | 상태 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| REF-VISUAL-001 | 필드 SD·대화 반신·별도 전술 전투장 구성 이미지 | 화면·캐릭터·전투 구성 기준 | 사용자 대화 내 생성 이미지 | ChatGPT 대화 첨부 | 런타임 사용 아님, 프리프로덕션 참조 | OpenAI image generation / 2026-07-27 | 이전 A/B/C 비교 이미지에서 선택된 두 번째 구성 | `USER_APPROVED_VISUAL_REFERENCE` | `BINARY_PENDING_REPOSITORY_IMPORT` | 문서 참조만 | `NOT_APPLICABLE` | `REFERENCE_APPROVED` |
| REF-SUMMON-001 | 신비한 늑대형 원소 정령수 레퍼런스 | 메인 동반 소환수 방향 | 사용자 제공 이미지 | 사용자 대화 첨부 | 런타임 사용 아님, 프리프로덕션 참조 | 사용자 제공 / 2026-07-27 | 메인 동반 원소 정령수 방향의 대표 참조 | `USER_APPROVED_DIRECTION_REFERENCE` | `BINARY_PENDING_REPOSITORY_IMPORT` | 문서 참조만 | `NOT_APPLICABLE` | `REFERENCE_APPROVED` |
| REF-SUMMON-002 | 메인 소환수 성장 4단계 콘셉트 시트 | 성장·크기·탑승 방향 탐색 | 생성 이미지 | ChatGPT 대화 첨부 | 런타임 사용 아님, 콘셉트 탐색 | OpenAI image generation / 2026-07-27 | REF-SUMMON-001 기반 개념 확장 | 성장 프레임 방향 승인, 세부 디자인 미승인 | `BINARY_PENDING_REPOSITORY_IMPORT` | 문서 참조만 | `NOT_APPLICABLE` | `CONCEPT_REFERENCE` |
| REF-SUMMON-003 | 전투 소환수 역할 콘셉트 이미지 시도 | 역할 실루엣 탐색 | 생성 시도·후보 이미지 | ChatGPT 대화 첨부 | 런타임 사용 아님 | OpenAI image generation / 2026-07-27 | 원소·정령·역할 분류 탐색 | 4역할 전체 시스템 미승인 | `NOT_CANONICAL_BINARY` | 없음 | `NOT_APPLICABLE` | `REFERENCE_CANDIDATE` |

현재 대화 첨부 바이너리는 GitHub 저장소에 직접 보관되지 않았다. 텍스트 결정은 정본에 반영했으며, 실제 파일을 저장소에 가져올 때 원본·파일명·해시·파생 관계를 추가한다.

## 4. 상태 정의

- `CONCEPT_EXPLORATION`
- `VISUAL_REFERENCE_CANDIDATE`
- `USER_APPROVED_VISUAL_REFERENCE`
- `USER_APPROVED_DIRECTION_REFERENCE`
- `ART_BIBLE_APPROVED`
- `ASSET_SPEC_APPROVED`
- `RUNTIME_ASSET_CANDIDATE`
- `RUNTIME_ASSET_APPROVED`
- `REJECT_LICENSE`
- `REJECT_STYLE`
- `REJECT_TECHNICAL`

생성 성공만으로 `RUNTIME_ASSET_APPROVED`가 되지 않는다.

## 5. 생성·편집 자산 필수 기록

- 실제 화면 역할
- 생성·편집 도구와 날짜
- 브리프·프롬프트 저장 경로
- 사용자 제공 참조와 외부 참조 출처
- 원본→수정본→최종본 파생 관계
- 상업 이용·수정 가능 여부
- 사용자 승인 상태
- Godot 적용 경로
- 실제 화면·성능·접근성 검증

## 6. 배경 자산 전제

- 가로형 3/4 고정 학교 필드
- 기준 16:9, 좌우 확장 레이어
- 학교 기본·시험·자유일정·축제 상태 변형
- 현장 필드와 같은 장소 정체성을 가진 별도 전투장
- 전투 결과의 손상·복구 상태를 필드에 반영
- 캐릭터 기준선과 핫스폿 일관성

배경을 화면비마다 별도 제작하지 않는다.

## 7. 캐릭터 자산 전제

- 필드·전투: 3.5~4등신 SD와 기본 골격 재사용
- 대화: 반신 일러스트
- 필드·전투 디자인 식별 요소 공유
- 핵심 인물만 반신·표정 제작
- 정확한 픽셀 규격·표정·애니메이션 수는 `ASSET-SPEC-01`

## 8. 메인 동반 소환수

- 세계관 역할: `CONFIRMED_BY_GM-MASCOT-01`
- 시각 방향: `ELEMENTAL_SPIRIT_BEAST_DIRECTION_CONFIRMED`
- 대표 레퍼런스: 늑대형 원소 정령수 계열
- 장기 성장: 4단계
- 이전 형상 선택: 가능
- 장기 탑승: 확정 방향
- Vertical Slice 런타임: 초기 형상 1개
- 2~4단계 전체·형상 선택 UI·탑승: 후행
- 정확한 이름·원소·색·최종 외형: `ART_STYLE_AND_ART_BIBLE_REQUIRED`

## 9. 전투 보조 소환수

- 원소·정령 중심 시각 언어
- Vertical Slice: 수호 또는 견제 1체
- 4역할 전체 체계: `REFERENCE_CANDIDATE`
- 성장·형상 선택·탑승: `UNRESOLVED`
- 대화 반신: 초기 Slice 제외

## 10. 이미지 생성 실패 처리

- 사용자에게 동일 요청 재입력을 기본 해결책으로 요구하지 않음
- 기존 브리프와 승인 참조를 보존
- 한글 장문·UI 복잡도·한 장의 요소 수를 줄여 단계적 재시도
- 상세 서버 오류를 확인할 수 없으면 추정과 사실을 구분
- 실패한 생성물을 완료로 주장하지 않음

## 11. 대량 제작 전 차단 조건

- `ART-STYLE-01` 사용자 승인
- Art Bible 승인
- 내부 해상도·안전 영역·자산 예산 확정
- 캐릭터·배경·UI·효과·사운드 규격 확정
- Audio Direction 승인
- 외부·생성 자산의 권리·출처 기록

스타일 비교용 소수 기준 이미지는 `ART-STYLE-01`에서 허용한다.

## 12. 현재 `NOT_RUN`

- Godot Asset Library 검색
- 플러그인 기술 Trial
- 제3자 라이선스 법률 검토
- UI Kit·폰트·사운드 후보 조사
- 그림체 기준 샷의 체계적 비교
- 실제 런타임 적용·성능·접근성 검수
- 사람 시각·청각 검수
