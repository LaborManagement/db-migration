-- Add foreign keys for better integrity

ALTER TABLE payment_flow.toli_master ADD CONSTRAINT fk_toli_master_employer_id
FOREIGN KEY (employer_id) REFERENCES payment_flow.employer_master(id),
                                     ADD CONSTRAINT fk_toli_master_board_id
FOREIGN KEY (board_id) REFERENCES payment_flow.board_master(id);


ALTER TABLE payment_flow.worker_master ADD CONSTRAINT fk_worker_master_board_id
FOREIGN KEY (board_id) REFERENCES payment_flow.board_master(id);


ALTER TABLE payment_flow.worker_toli_relation ADD CONSTRAINT fk_worker_toli_worker
FOREIGN KEY (worker_id) REFERENCES payment_flow.worker_master(id),
                                   ADD CONSTRAINT fk_worker_toli_toli
FOREIGN KEY (toli_id) REFERENCES payment_flow.toli_master(id);


ALTER TABLE payment_flow.employer_master ADD CONSTRAINT fk_employer_master_board_id
FOREIGN KEY (board_id) REFERENCES payment_flow.board_master(id);


ALTER TABLE auth.user_tenant_acl ADD CONSTRAINT fk_user_tenant_acl_board_id
FOREIGN KEY (board_id) REFERENCES payment_flow.board_master(id),
                                  ADD CONSTRAINT fk_user_tenant_acl_employer_id
FOREIGN KEY (employer_id) REFERENCES payment_flow.employer_master(id);