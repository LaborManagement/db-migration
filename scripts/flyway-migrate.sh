#!/usr/bin/env bash
set -euo pipefail

SCHEMAS=(audit auth payment_flow reconciliation)

if [ "$#" -eq 0 ]; then
  set -- flyway:migrate
fi

# Pre-migration: Ensure app roles and grants exist
# echo "Running pre-migration scripts: create roles and apply grants..."
# docker exec -it labormanagement psql -U postgres -d postgres -c "ALTER USER admin CREATEDB;"
# docker exec -i labormanagement psql -U admin -d postgres -v ON_ERROR_STOP=1 -f - < "$(dirname "$0")/../init-db-admin.sql"
# docker exec -i labormanagementpsql -U admin -d lbe -v ON_ERROR_STOP=1 -f - < "$(dirname "$0")/../extra-app-user-grants.sql"
# printf "Running Flyway goal '%s' for schemas: %s\n" "$*" "${SCHEMAS[*]}"

for schema in "${SCHEMAS[@]}"; do
  printf "\n==> Migrating schema: %s\n" "$schema"
  mvn -Pflyway-schema -Dschema="${schema}" "$@"
done
