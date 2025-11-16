# Centralized DB Migrations

This project manages all database schema changes for the platform using Flyway.

## Structure

- `src/main/resources/db/migration/auth/` — Auth schema migrations
- `src/main/resources/db/migration/payment_flow/` — Payment Flow schema migrations
- `src/main/resources/db/migration/reconciliation/` — Reconciliation schema migrations

## Usage

1. Provide your database connection details either via environment variables (`FLYWAY_URL`, `FLYWAY_USER`, `FLYWAY_PASSWORD`) or Maven properties (`-Dflyway.url=... -Dflyway.user=... -Dflyway.password=...`).
2. Run a single schema migration by activating the `flyway-schema` profile and specifying which schema folder to use:
   ```sh
   mvn -Pflyway-schema -Dschema=auth flyway:migrate
   # valid schema values: audit, auth, payment_flow, reconciliation
   ```
3. To migrate all schemas sequentially, use the helper script:
   ```sh
   ./scripts/flyway-migrate.sh -Dflyway.url=jdbc:postgresql://localhost:5432/lbe -Dflyway.user=dbuser -Dflyway.password=secret
   ```
   The script defaults to the `flyway:migrate` goal; append a different goal at the end if needed.
4. Add new migration scripts in the appropriate schema folder, following Flyway naming conventions (e.g., `V2__add_table.sql`).

## Notes

- All migrations are versioned and applied in order.
- For cross-schema dependencies, ensure correct versioning and script order.
- See the main platform documentation for DB onboarding and conventions.
