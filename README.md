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

- 영화 목록, 상세, 평점, 상영 시간표
- 지점/회차 선택, 좌석 선택, 예매 확정, 내 예매
- 팝콘/음료 스토어와 장바구니 주문 흐름
- 공지, Q&A, 분실물 게시판
- WebSocket/SockJS 기반 같이 보기 채팅 페이지 (`/show/trailer`)
- 운영자 관점의 회차 점유율과 처리 업무 화면
- 공개 데모에서 전체 사용자 흐름을 검토할 수 있는 mock state

## Portfolio Direction

LCB Cinema는 영화관 서비스의 핵심 사용자 여정을 한 번에 보여주는 포트폴리오입니다. GitHub Pages에서는 서버 없이도 제품 흐름을 볼 수 있도록 mock 데이터를 사용하고, 저장소에는 Spring MVC 기반 서버 소스와 JSP 화면 구조를 함께 보관합니다.

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

## Documentation

- [Architecture Notes](docs/architecture.html)
- [Quality Notes](docs/quality.html)
- [Security Notes](SECURITY.md)

## Status

`.\mvnw.cmd -DskipTests package` 기준 WAR 빌드가 성공합니다. 공개 포트폴리오 화면은 GitHub Pages에서 바로 실행되는 인터랙티브 데모로 제공합니다.
