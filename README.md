# LCB Cinema

> 영화 탐색, 시간표, 좌석 예매, 스토어, 고객 게시판, 같이 보기 채팅, 운영 화면을 포함한 개인 영화관 서비스 포트폴리오입니다.

<p align="center">
  <a href="https://notetester.github.io/LCBPortfolio/"><b>Live Service Demo</b></a> ·
  <a href="https://notetester.github.io/LCBPortfolio/#booking"><b>Booking Flow</b></a> ·
  <a href="https://notetester.github.io/LCBPortfolio/docs/"><b>Technical Notes</b></a> ·
  <a href="SECURITY.md"><b>Security</b></a>
</p>

![LCB Cinema preview](src/main/webapp/resources/assets/img/main_slider01_2000.jpg)

## Overview

| Item | Detail |
| --- | --- |
| Project | 영화관 웹 서비스 |
| Role | 기획, 화면 설계, 구현, 문서화 |
| Backend | Java 8 target, Spring MVC 5, MyBatis, HikariCP, MySQL, JavaMail, WebSocket |
| View | JSP/JSTL, Bootstrap, jQuery |
| Packaging | Maven WAR |
| Portfolio Demo | GitHub Pages 기반 인터랙티브 서비스 시뮬레이터 |

## Feature Surface

- 영화 목록, 상세, 평점, 지점별 상영 시간표
- 지점/회차 선택, 인원 선택, 좌석 등급별 가격, 4분 좌석 선점
- 결제 승인 티켓, 취소/환불, 좌석 반환, 내 예매 관리
- 팝콘/음료 스토어, 장바구니, 픽업 주문 흐름
- 공지, Q&A, 분실물 게시판과 운영 문의 처리
- WebSocket/SockJS 기반 같이 보기 채팅 페이지 (`/show/trailer`)
- 운영자 관점의 회차 점유율, 활성 티켓, 취소, 임시 선점, 매출 메트릭
- 공개 데모에서 전체 사용자 흐름을 검토할 수 있는 클라이언트 상태 시뮬레이션

## Hard Problems Covered

- **예매 상태 전이**: 좌석 선택을 바로 티켓으로 만들지 않고 `AVAILABLE -> HELD -> PAID -> CANCELLED` 흐름으로 구성했습니다.
- **가격 정책 분리**: 회차 기본가, 좌석 등급, 조조/심야 정책, 멤버십 할인, 예매 수수료를 분리해 결제 예정 금액을 설명합니다.
- **운영자 관점**: 사용자의 예매/취소가 운영 콘솔의 활성 티켓, 매출, 임시 선점 수치에 반영됩니다.
- **공개 검토성**: 서버 없이도 GitHub Pages에서 영화관 서비스의 핵심 흐름을 직접 눌러볼 수 있습니다.
- **보안 정리**: SMTP/DB 자격증명 placeholder, 비밀번호 이메일 전송 제거, MyBatis parameter binding, 채팅 payload 로그 노출 완화를 적용했습니다.

## Demo Scenario

1. [영화 / 시간표](https://notetester.github.io/LCBPortfolio/#catalog)에서 영화와 회차를 고릅니다.
2. [빠른 예매](https://notetester.github.io/LCBPortfolio/#booking)에서 인원 수만큼 좌석을 선택하고 선점 타이머와 가격 산식을 확인합니다.
3. 예매를 확정한 뒤 [내 예매](https://notetester.github.io/LCBPortfolio/#tickets)에서 결제 승인 티켓을 확인합니다.
4. 티켓을 취소하고 [운영 콘솔](https://notetester.github.io/LCBPortfolio/#ops)에서 활성 티켓과 매출이 갱신되는지 확인합니다.
5. [Guided Demo](https://notetester.github.io/LCBPortfolio/demo/)에서 위 흐름을 면접용 시나리오로 볼 수 있습니다.

## Run Locally

이 프로젝트는 전통적인 Spring MVC WAR 프로젝트입니다. 로컬 DB와 WAS를 연결하면 서버 앱으로 실행할 수 있습니다.

```powershell
.\mvnw.cmd -DskipTests package
```

빌드 결과물:

```text
target/lcb-1.0.0-BUILD-SNAPSHOT.war
```

로컬 실행 시 `src/main/resources/db-config/Hikari.properties`와 `src/main/resources/mail-config/mail.properties`의 값을 개인 환경에 맞게 설정합니다. 실제 운영 자격증명은 저장소에 포함하지 않습니다.

정적 포트폴리오 검증:

```powershell
node --check portfolio/app.js
node portfolio/smoke-check.mjs
```

## Documentation

- [Domain Model](docs/domain.html)
- [Architecture Notes](docs/architecture.html)
- [Quality Notes](docs/quality.html)
- [Guided Demo](demo/index.html)
- [Security Notes](SECURITY.md)

## Status

`.\mvnw.cmd -DskipTests package` 기준 WAR 빌드가 성공합니다. 공개 포트폴리오 화면은 GitHub Pages에서 바로 실행되는 인터랙티브 영화관 서비스 데모로 제공합니다.
