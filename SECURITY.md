# Security Notes

LCB Cinema is a public portfolio repository. Production credentials, private API keys, SMTP passwords, and database passwords must not be committed.

## Current Policy

- Database, mail, and third-party JavaScript settings use placeholders in the public tree.
- Local runtime values should be kept in private environment-specific files or deployment settings.
- Build outputs such as `target/` and WAR files are excluded from version control.
- Any credential accidentally committed to a public repository should be rotated immediately.
- Password recovery mail must not include the stored password. Send a reset instruction or one-time token flow instead.
- MyBatis mapper SQL should use `#{...}` parameter binding for user supplied values.
- Chat payloads should not be written to server logs as raw message bodies.

## Local Configuration

Use these files as local configuration points when running the Spring MVC application:

- `src/main/resources/db-config/Hikari.properties`
- `src/main/resources/mail-config/mail.properties`

Keep real values outside public commits.

## Portfolio Security Checklist

- `src/main/resources/db-config/Hikari.properties`: placeholder values only
- `src/main/resources/mail-config/mail.properties`: placeholder values only
- `src/main/resources/sqlmap/TimeTableMapper.xml`: parameter binding for date filtering
- `src/main/java/com/lcb404/controller/UserController.java`: no password echo in mail body
- `src/main/java/com/lcb404/utill/EchoHandler.java`: message length guard and payload log masking
