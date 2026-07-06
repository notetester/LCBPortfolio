# Security Notes

This public portfolio repository must not contain production credentials.

The surviving legacy source snapshot included hardcoded database, SMTP, and third-party JavaScript keys. Those values were removed from the current tree and replaced with local placeholders. Any credential that ever appeared in the original legacy project should be treated as compromised and rotated or revoked.

## Current Handling

- Database configuration uses localhost demo defaults in `src/main/resources/db-config/Hikari.properties`.
- SMTP configuration uses local dummy values in `src/main/resources/mail-config/mail.properties`.
- Kakao JavaScript integration points are guarded behind empty placeholder keys.
- Build artifacts are ignored with `target/` and `*.war`.

## Before Real Deployment

- Provide secrets through an external secret manager or server environment.
- Restrict all third-party API keys by domain and API scope.
- Recreate the database schema from reviewed migration scripts only.
- Run dependency and secret scanning before publishing a release.
