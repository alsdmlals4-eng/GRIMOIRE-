# GRIMOIRE Android Debug APK 설치 안내

이 ZIP은 **별형 주문 회로 Low-fi 기능 확인용 Debug 빌드**입니다. 출시용 APK나 Google Play 제출본이 아닙니다.

## 포함 파일

- `GRIMOIRE-Star-Circuit-POC.apk`
- `SHA256SUMS.txt`
- `BUILD_INFO.json`
- `설치안내.txt`

패키지 ID:

```text
com.alsdmlals4eng.grimoire.poc
```

## 휴대폰에서 설치

1. ChatGPT에서 `GRIMOIRE-Android-Debug-POC.zip`을 다운로드합니다.
2. 휴대폰의 내 파일·파일 관리자 앱에서 ZIP 압축을 풉니다.
3. 압축을 푼 폴더에서 `GRIMOIRE-Star-Circuit-POC.apk`를 누릅니다.
4. Android가 차단하면 해당 파일 관리자 또는 브라우저에 대해 **알 수 없는 앱 설치 허용**을 일시적으로 켭니다.
5. 설치를 완료하고 `GRIMOIRE Star Circuit POC`를 실행합니다.
6. 화면을 가로 방향으로 사용합니다.

설치가 끝난 뒤에는 보안을 위해 **알 수 없는 앱 설치 허용**을 다시 끄는 것을 권장합니다.

## 기존 빌드와 서명 충돌

같은 패키지 ID가 다른 Debug 키로 이미 설치돼 있으면 Android가 업데이트를 거부할 수 있습니다. 이 경우 기존 `GRIMOIRE Star Circuit POC`를 삭제한 뒤 새 APK를 설치하세요. 앱 삭제 시 해당 Debug 앱의 로컬 데이터도 제거될 수 있습니다.

## SHA-256 확인

`SHA256SUMS.txt`에는 APK의 SHA-256 값이 들어 있습니다. PC에서 확인하려면:

```powershell
Get-FileHash .\GRIMOIRE-Star-Circuit-POC.apk -Algorithm SHA256
```

출력값이 `SHA256SUMS.txt`의 값과 같아야 합니다.

## 직접 확인할 흐름

1. Main 글자를 선택합니다.
2. Auxiliary 슬롯을 0~5개 설정합니다.
3. `PREVIEW CIRCUIT`을 누릅니다.
4. `FLOWER` 또는 `WARD` Target을 선택합니다.
5. Success·Mana·Typed Stock 정보를 확인합니다.
6. `COMMIT`을 누른 뒤 `CONFIRM COMMIT`을 다시 누릅니다.
7. Mana와 일치하는 Typed Stock이 한 번만 소비되는지 확인합니다.
8. `CANCEL`과 중복 Auxiliary 거부 상태도 확인합니다.

## 검증 경계

APK 생성 자동화가 성공해도 아래 항목은 실제 휴대폰에서 확인하기 전까지 `NOT_RUN`입니다.

- 물리 기기 설치·실행
- Touch·손가락 가림·Safe Area
- 프레임 성능
- TalkBack 등 Screen Reader
- 사람 이해도와 피로
- 전체 버티컬 슬라이스 대표성

이 파일은 테스트용 Debug 배포물이며 출시용 서명·스토어 승인·최종 등급·법률 검토 완료를 의미하지 않습니다.
