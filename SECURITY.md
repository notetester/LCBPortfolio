# Security Notes

LCB Cinema is a public portfolio repository. Production credentials, private API keys, SMTP passwords, and database passwords must not be committed.

## Current Policy

- Database, mail, and third-party JavaScript settings use placeholders in the public tree.
- Local runtime values should be kept in private environment-specific files or deployment settings.
- Build outputs such as `target/` and WAR files are excluded from version control.
- Any credential accidentally committed to a public repository should be rotated immediately.

## Local Configuration

Use these files as local configuration points when running the Spring MVC application:

- `src/main/resources/db-config/Hikari.properties`
- `src/main/resources/mail-config/mail.properties`

Keep real values outside public commits.
