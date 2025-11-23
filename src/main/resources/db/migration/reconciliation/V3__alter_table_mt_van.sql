alter table reconciliation.statement_transaction
  add column is_mapped boolean default false;

alter table reconciliation.van_transaction
  add column is_mapped boolean default false;