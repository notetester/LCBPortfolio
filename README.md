# LCB Cinema Portfolio

> Java Spring MVC, JSP, MyBatis 기반 영화 예매 서비스의 공개 포트폴리오 재구성본입니다.

원본 팀 이력과 커밋 히스토리는 보존되지 않았기 때문에, 이 저장소는 남아 있는 소스 스냅샷을 기준으로 제가 단독으로 복구, 보안 정리, 빌드 정상화, 포트폴리오 문서화한 버전입니다.

<p align="center">
  <a href="https://notetester.github.io/LCBPortfolio/"><b>Live Portfolio</b></a> ·
  <a href="https://notetester.github.io/LCBPortfolio/demo/"><b>Static Demo</b></a> ·
  <a href="https://notetester.github.io/LCBPortfolio/docs/"><b>Technical Notes</b></a> ·
  <a href="SECURITY.md"><b>Security</b></a>
</p>

![LCB Cinema preview](src/main/webapp/resources/assets/img/main_slider01_2000.jpg)

## Overview

| Item | Detail |
| --- | --- |
| Project | 영화 조회, 예매, 좌석 선택, 리뷰, Q&A, 이벤트, 스토어, 회원 기능을 포함한 영화관 웹 서비스 |
| Role | 개인 포트폴리오 재구성. 유실된 팀/커밋 이력은 기재하지 않음 |
| Backend | Java 8 target, Spring MVC 5, MyBatis, HikariCP, MySQL, JavaMail, WebSocket |
| View | JSP/JSTL, Bootstrap, jQuery |
| Packaging | Maven WAR |
| Portfolio layer | GitHub Pages 정적 데모, 기술 문서, 보안 정리 문서 |

## What Was Recovered

- Maven 빌드 실패 원인이던 구버전 Lombok과 Maven plugin 문제를 정리했습니다.
- `target/` 산출물, IDE 메타파일, 로컬 설정 파일이 공개 repo에 섞이지 않도록 `.gitignore`를 정리했습니다.
- DB, SMTP, Kakao 앱 키처럼 공개 repo에 남기면 안 되는 값을 더미 설정으로 치환했습니다.
- 실제 서버와 DB 없이도 흐름을 설명할 수 있도록 GitHub Pages용 정적 데모를 추가했습니다.
- 원본의 한계를 숨기지 않고 복구 기준, 기술 부채, 다음 개선 계획을 문서화했습니다.

## Feature Surface

- 영화 차트, 상세, 댓글, 좋아요
- 시간표, 극장 위치, 좌석 선택, 예매 내역
- 회원 가입, 로그인, 마이페이지, 비밀번호/아이디 찾기
- 공지사항, Q&A, 분실물 게시판
- 이벤트, 멤버십, 스토어, 채용 페이지
- WebSocket 기반 알림/에코 핸들러 실험 코드

## Run Locally

이 프로젝트는 전통적인 Spring MVC WAR 프로젝트입니다. 로컬 DB와 WAS가 필요합니다.

```powershell
.\mvnw.cmd -DskipTests package
```

빌드 결과물:

```text
target/lcb-1.0.0-BUILD-SNAPSHOT.war
```

로컬 실행을 위해서는 `src/main/resources/db-config/Hikari.properties`와 `src/main/resources/mail-config/mail.properties`의 더미 값을 개인 환경에 맞게 바꿔야 합니다. 실제 운영 자격증명은 커밋하지 않습니다.

## Documentation

- [Architecture Notes](docs/architecture.html)
- [Recovery Audit](docs/recovery-audit.html)
- [Security Notes](SECURITY.md)

## Current Status

`mvn -DskipTests package` 기준 WAR 빌드는 성공합니다. 데이터베이스 스키마와 실 데이터는 별도 복구가 필요하므로, 공개 데모는 정적 mock으로 제공합니다.
