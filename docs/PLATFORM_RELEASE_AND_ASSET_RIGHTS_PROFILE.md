# GRIMOIRE 플랫폼 출시·에셋 권리 Profile

> Base 정본: `alsdmlals4-eng/Base/docs/knowledge/game-development/PLATFORM_REVIEW_ASSET_RIGHTS_AND_REFERENCE_PRODUCTION_GUIDE.md`  
> 기준 main: `4c50b462a8e296e24583b727ab93c82ba1e9c041`

## 전략

```yaml
rating_strategy: LOWEST_VIABLE_RATING
adult_only_avoidance: AVOID_ADULTS_ONLY
content_rating_target: UNASSIGNED_PENDING_REPRESENTATIVE_BUILD
rating_candidate_range: ALL_OR_12_CANDIDATE
target_audience: GENERAL_AND_TEEN_MAGIC_RPG_PLAYERS_PENDING_VALIDATION
children_in_target_audience: UNDECIDED
families_policy_applicable: UNDECIDED
platforms:
  Mobile: PRIMARY
  Android: PRIMARY
  Google_Play: PRIMARY_RELEASE_CANDIDATE
  PC: PC_LATER
  Steam: PC_LATER_EVALUATION_CANDIDATE
  STOVE: PC_LATER_EVALUATION_CANDIDATE
```

전체이용가는 후보지만 강제하지 않는다. 마법 전투·환경 피해·세계 변화·대가 표현을 대표 빌드 기준으로 정직하게 공개하고 청소년이용불가·18+는 기본적으로 피한다.

## 콘텐츠 위험 초안

| Risk | 현재 관찰 | 출시 전 확인 |
|---|---|---|
| violence | 전투·마법·대상·환경 변화 | 피격·상처·사망·고통·신체 변화 강도 |
| horror / crime / language / sexual content / drugs | 전수 근거 부족 | 모든 시나리오·대사·일러스트 |
| gambling/simulated gambling | Stock·자원은 현행상 게임 규칙 | 확률형 보상·유료 재화와의 연결 여부 |
| ads/IAP | 사업 모델 미확정 | 광고 SDK·보상형 광고·IAP·환불 |
| UGC/online interaction | 현행 정본에서 확인되지 않음 | 실제 출시 기능 |
| AI-generated/live-generated content | 이미지·텍스트·음향별 증빙 필요 | 모델·서비스·버전·입력 권리·약관·플랫폼 공개 |

낮은 콘텐츠 등급을 아동 대상 선언으로 자동 변환하지 않는다. Google Play의 target audience, Families, 광고 SDK, 데이터·개인정보는 별도 검토한다.

## 자산·참조 기반 독립 제작

음악·효과음, 폰트, 캐릭터·일러스트·UI·마법 Glyph, 3D·애니메이션, 플러그인·에셋, OSS, AI 출력·약관, 외주, 성우·작곡·번역 계약을 자산별로 관리한다.

```text
합법적인 reference source
→ 기능·회로 정보 위계·일반 제작 원리
→ forbidden_expression
→ GRIMOIRE 고유 reference_brief
→ 독립 working files·final_asset_record
→ similarity and rights review
```

다른 작품의 마법진·Glyph·캐릭터·UI skin·작가 스타일을 식별 가능하게 복제하거나 원본을 AI로 변환하는 방식은 독립 제작으로 인정하지 않는다.

## Gate

권리·조건 이행·OSS 고지·AI 입력 권리·Google Play target audience/Families/SDK·build/store/questionnaire 일치 중 하나라도 미확인이면 `RELEASE_BLOCKED_UNVERIFIED`다.

```text
RUNTIME_ASSET_USE_CHECKED: NOT_RUN
BUILD_STORE_CONSISTENCY_CHECKED: NOT_RUN
GOOGLE_PLAY_SUBMISSION: PLATFORM_SUBMISSION_NOT_RUN
STEAM_STOVE_PC_LATER: PLATFORM_SUBMISSION_NOT_RUN
FINAL_RATING: NOT_ASSIGNED
LEGAL_REVIEW_NOT_PERFORMED
```
