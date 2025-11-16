#!/usr/bin/env bash
set -euo pipefail

SCHEMAS=(audit auth payment_flow reconciliation)

if [ "$#" -eq 0 ]; then
  set -- flyway:migrate
fi

printf "Running Flyway goal '%s' for schemas: %s\n" "$*" "${SCHEMAS[*]}"

for schema in "${SCHEMAS[@]}"; do
  printf "\n==> Migrating schema: %s\n" "$schema"
  mvn -Pflyway-schema -Dschema="${schema}" "$@"
done
