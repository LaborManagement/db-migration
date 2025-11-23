
-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);

SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Ensure referenced board_master row exists for FK in user_tenant_acl
INSERT INTO payment_flow.board_master (id, board_id, board_name, board_code, state_name, district_name, address, contact_person, contact_email, contact_phone, status, created_at, updated_at)
VALUES (1, '1', 'Default Board', 'DEF001', 'Default State', 'Default District', '123 Default St', NULL, NULL, NULL, 'ACTIVE', '2025-11-01 00:00:00', '2025-11-01 00:00:00');


SELECT pg_catalog.setval('payment_flow.board_master_id_seq', 4, true);


--
-- Data for Name: endpoints; Type: TABLE DATA; Schema: auth; Owner: -
--

INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (71, 'auth', 'v1', 'PUT', '/api/auth/users/{userId}', 'Update user information', true, '2025-11-03 07:26:07.157144', '2025-11-03 07:26:07.157144', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (72, 'auth', 'v1', 'DELETE', '/api/auth/users/{userId}', 'Delete user (soft delete)', true, '2025-11-03 07:26:07.157144', '2025-11-03 07:26:07.157144', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (74, 'role', 'v1', 'POST', '/api/role-policies/assign', 'Assign a policy to a role', true, '2025-11-03 16:36:02.907418', '2025-11-03 16:36:02.907418', 'ACTION');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (75, 'role', 'v1', 'POST', '/api/role-policies/assign-multiple', 'Assign multiple policies to a role in a single operation', true, '2025-11-03 16:36:02.907418', '2025-11-03 16:36:02.907418', 'ACTION');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (76, 'role', 'v1', 'DELETE', '/api/role-policies/remove', 'Remove a policy assignment from a role', true, '2025-11-03 16:36:02.907418', '2025-11-03 16:36:02.907418', 'ACTION');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (77, 'role', 'v1', 'PUT', '/api/role-policies/replace', 'Replace all policies for a role with a new set of policies', true, '2025-11-03 16:36:02.907418', '2025-11-03 16:36:02.907418', 'ACTION');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (78, 'role', 'v1', 'GET', '/api/role-policies/role/{roleId}/policies', 'Get all policies assigned to a specific role', true, '2025-11-03 16:36:02.907418', '2025-11-03 16:36:02.907418', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (79, 'role', 'v1', 'GET', '/api/role-policies/policy/{policyId}/roles', 'Get all roles that have a specific policy assigned', true, '2025-11-03 16:36:02.907418', '2025-11-03 16:36:02.907418', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (80, 'role', 'v1', 'GET', '/api/role-policies/role/{roleId}/assignments', 'Get detailed role-policy assignments with metadata for a specific role', true, '2025-11-03 16:36:02.907418', '2025-11-03 16:36:02.907418', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (91, 'auth', 'v1', 'GET', '/api/auth/users/{userId}/roles', 'Get roles assigned to users', true, '2025-11-04 14:46:18.156931', '2025-11-04 14:46:18.156934', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (81, 'role', 'v1', 'GET', '/api/role-policies/check', 'Check if a specific role has a specific policy assigned', true, '2025-11-03 16:36:02.907418', '2025-11-03 16:36:02.907418', 'ACTION');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (95, 'meta', 'v1', 'GET', '/api/meta/ui-access-matrix', 'UI Access Matrix', true, '2025-11-05 18:42:22.687937', '2025-11-05 18:42:22.687939', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (83, 'admin', 'v1', 'GET', '/api/admin/policies/{id}', 'Get policy by ID with capabilities', true, '2025-11-03 16:36:02.907418', '2025-11-03 16:36:02.907418', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (84, 'admin', 'v1', 'POST', '/api/admin/policies', 'Create a new policy', true, '2025-11-03 16:36:02.907418', '2025-11-03 16:36:02.907418', 'ACTION');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (85, 'admin', 'v1', 'PUT', '/api/admin/policies/{id}', 'Update an existing policy', true, '2025-11-03 16:36:02.907418', '2025-11-03 16:36:02.907418', 'ACTION');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (86, 'admin', 'v1', 'DELETE', '/api/admin/policies/{id}', 'Delete a policy', true, '2025-11-03 16:36:02.907418', '2025-11-03 16:36:02.907418', 'ACTION');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (87, 'admin', 'v1', 'PATCH', '/api/admin/policies/{id}/toggle-active', 'Toggle policy active/inactive status', true, '2025-11-03 16:36:02.907418', '2025-11-03 16:36:02.907418', 'ACTION');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (18, 'admin', 'v1', 'POST', '/api/admin/roles/assign', 'Assign role to user', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (19, 'admin', 'v1', 'POST', '/api/admin/roles/revoke', 'Revoke role from user', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (20, 'admin', 'v1', 'GET', '/api/admin/policies', 'List all policies', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (29, 'admin', 'v1', 'GET', '/api/admin/capabilities', 'List all capabilities', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (30, 'admin', 'v1', 'GET', '/api/admin/capabilities/{id}', 'Get capability by ID', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (31, 'admin', 'v1', 'POST', '/api/admin/capabilities', 'Create new capability', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (32, 'admin', 'v1', 'PUT', '/api/admin/capabilities/{id}', 'Update capability', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (33, 'admin', 'v1', 'DELETE', '/api/admin/capabilities/{id}', 'Delete capability', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (34, 'admin', 'v1', 'PATCH', '/api/admin/capabilities/{id}/toggle-active', 'Toggle capability active status', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (35, 'admin', 'v1', 'GET', '/api/admin/endpoints', 'List all endpoints', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (36, 'admin', 'v1', 'GET', '/api/admin/endpoints/{id}', 'Get endpoint by ID', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (37, 'admin', 'v1', 'POST', '/api/admin/endpoints', 'Create new endpoint', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (38, 'admin', 'v1', 'PUT', '/api/admin/endpoints/{id}', 'Update endpoint', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (39, 'admin', 'v1', 'DELETE', '/api/admin/endpoints/{id}', 'Delete endpoint', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (40, 'admin', 'v1', 'PATCH', '/api/admin/endpoints/{id}/toggle-active', 'Toggle endpoint active status', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (41, 'admin', 'v1', 'GET', '/api/admin/endpoints/{id}/policies', 'Get policies for endpoint', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (42, 'admin', 'v1', 'POST', '/api/admin/endpoints/{id}/policies', 'Link policy to endpoint', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (43, 'admin', 'v1', 'DELETE', '/api/admin/endpoints/{id}/policies/{policyId}', 'Unlink policy from endpoint', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (44, 'admin', 'v1', 'POST', '/api/admin/endpoints/bulk-policy-assignment', 'Bulk assign policies to endpoints', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (45, 'admin', 'v1', 'GET', '/api/admin/ui-pages', 'List UI pages', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (46, 'admin', 'v1', 'GET', '/api/admin/ui-pages/all', 'Get all UI pages hierarchical', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (47, 'admin', 'v1', 'GET', '/api/admin/ui-pages/{id}', 'Get UI page by ID', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (48, 'admin', 'v1', 'POST', '/api/admin/ui-pages', 'Create new UI page', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (49, 'admin', 'v1', 'PUT', '/api/admin/ui-pages/{id}', 'Update UI page', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (50, 'admin', 'v1', 'DELETE', '/api/admin/ui-pages/{id}', 'Delete UI page', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (51, 'admin', 'v1', 'PATCH', '/api/admin/ui-pages/{id}/toggle-active', 'Toggle UI page active status', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (52, 'admin', 'v1', 'PATCH', '/api/admin/ui-pages/{id}/reorder', 'Reorder UI pages', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (53, 'admin', 'v1', 'GET', '/api/admin/ui-pages/{id}/children', 'Get child pages', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (54, 'admin', 'v1', 'GET', '/api/admin/page-actions', 'List page actions', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (100, 'worker', 'v1', 'POST', '/api/worker/uploaded-data/files/secure-summaries', 'Summary of uploaded files', true, '2025-11-06 11:39:04.121713', '2025-11-06 12:00:13.798432', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (109, 'worker', 'v1', 'POST', '/api/worker/uploaded-data/file/{fileId}/generate-request', 'Generate request for uploaded file against selected file', true, '2025-11-06 12:03:53.927896', '2025-11-06 12:03:53.927897', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (110, 'worker', 'v1', 'POST', '/api/worker/receipts/{receiptNumber}/send-to-employer', 'Send receipt request to employer', true, '2025-11-06 12:16:19.090397', '2025-11-06 12:16:19.090398', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (112, 'worker', 'v1', 'GET', '/api/worker/receipts/{receiptNumber}', 'Get receipts by receipt number', true, '2025-11-06 12:17:23.309538', '2025-11-06 12:17:23.309539', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (113, 'admin', 'v1', 'POST', '/api/master/uploads/workers', 'Worker master upload', true, '2025-11-15 21:08:14.818883', '2025-11-15 21:08:14.818885', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (116, 'admin', 'v1', 'POST', '/api/master/uploads/boards', 'Board master upload', true, '2025-11-16 21:13:56.622437', '2025-11-16 21:13:56.622439', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (73, 'worker', 'v1', 'POST', '/api/worker/uploaded-data/secure-paginated', 'view uploaded data', true, '2025-11-03 14:07:45.322513', '2025-11-03 14:07:45.322521', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (55, 'admin', 'v1', 'GET', '/api/admin/page-actions/{id}', 'Get page action by ID', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (56, 'admin', 'v1', 'GET', '/api/admin/page-actions/page/{pageId}', 'Get actions for page', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (57, 'admin', 'v1', 'POST', '/api/admin/page-actions', 'Create new page action', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (58, 'admin', 'v1', 'PUT', '/api/admin/page-actions/{id}', 'Update page action', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (59, 'admin', 'v1', 'DELETE', '/api/admin/page-actions/{id}', 'Delete page action', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (60, 'admin', 'v1', 'PATCH', '/api/admin/page-actions/{id}/toggle-active', 'Toggle page action active status', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (102, 'admin', 'v1', 'PUT', '/api/admin/policies/{id}/endpoints', 'Update policy endpoint assignment', true, '2025-11-06 06:16:11.864443', '2025-11-06 06:16:11.864443', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (111, 'worker', 'v1', 'POST', '/api/worker/receipts/all/secure', 'Get all generated receipts', true, '2025-11-06 12:16:48.450728', '2025-11-06 12:16:48.450731', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (114, 'admin', 'v1', 'POST', '/api/master/uploads/toli', 'Toli master upload', true, '2025-11-15 21:08:34.029446', '2025-11-15 21:08:34.029448', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (3, 'auth', 'v1', 'POST', '/api/auth/users', 'Register new user account', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (1, 'auth', 'v1', 'POST', '/api/auth/login', 'User login with credentials', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (2, 'auth', 'v1', 'POST', '/api/auth/logout', 'User logout', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (4, 'auth', 'v1', 'GET', '/api/auth/ui-config', 'Get UI configuration for logged-in user', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (5, 'auth', 'v1', 'GET', '/api/auth/users', 'Get all users', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (6, 'auth', 'v1', 'GET', '/api/auth/users/role/{role}', 'Get users by role', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (7, 'auth', 'v1', 'PUT', '/api/auth/users/{userId}/status', 'Enable/disable user account', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (8, 'auth', 'v1', 'PUT', '/api/auth/users/{userId}/roles', 'Update user roles', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (9, 'auth', 'v1', 'POST', '/api/auth/users/{userId}/invalidate-tokens', 'Invalidate all user tokens', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (10, 'auth', 'v1', 'GET', '/api/auth/roles', 'Get all available roles', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (107, 'worker', 'v1', 'POST', '/api/worker/uploaded-data/upload', 'Upload worker payment file', true, '2025-11-06 12:02:11.822639', '2025-11-06 12:02:11.822642', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (93, 'meta', 'v1', 'GET', '/api/meta/user-access-matrix/{user_id}', 'Get user access matrix ', true, '2025-11-04 17:44:36.424054', '2025-11-04 17:44:36.424057', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (115, 'admin', 'v1', 'POST', '/api/master/uploads/employers', 'Employer master upload', true, '2025-11-15 21:08:56.215705', '2025-11-15 21:08:56.215707', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (11, 'admin', 'v1', 'GET', '/api/admin/roles', 'List all roles', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (12, 'admin', 'v1', 'GET', '/api/admin/roles/with-permissions', 'Get roles with permission counts', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (13, 'admin', 'v1', 'GET', '/api/admin/roles/{id}', 'Get role by ID', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (14, 'admin', 'v1', 'GET', '/api/admin/roles/by-name/{name}', 'Get role by name', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (15, 'admin', 'v1', 'POST', '/api/admin/roles', 'Create new role', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (16, 'admin', 'v1', 'PUT', '/api/admin/roles/{id}', 'Update role', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (17, 'admin', 'v1', 'DELETE', '/api/admin/roles/{id}', 'Delete role', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (62, 'auth', 'v1', 'GET', '/api/me/authorizations', 'Get current user authorizations', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (66, 'internal', 'v1', 'POST', '/internal/auth/introspect', 'Internal: Token introspection', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (67, 'internal', 'v1', 'GET', '/internal/authz/endpoints/{endpointId}', 'Internal: Get endpoint policies', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (68, 'internal', 'v1', 'GET', '/internal/authz/users/{userId}/matrix', 'Internal: Get user authorization matrix', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (69, 'internal', 'v1', 'GET', '/internal/authz/endpoints/metadata', 'Internal: Get endpoints metadata', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (70, 'internal', 'v1', 'POST', '/internal/authz/policies/evaluate', 'Internal: Evaluate policies', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (61, 'admin', 'v1', 'PATCH', '/api/admin/page-actions/{id}/reorder', 'Reorder page actions', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'FORM');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (63, 'meta', 'v1', 'GET', '/api/meta/service-catalog', 'Get service catalog', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (64, 'meta', 'v1', 'GET', '/api/meta/endpoints', 'Get endpoints metadata', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (65, 'meta', 'v1', 'GET', '/api/meta/pages', 'Get UI pages metadata', true, '2025-11-03 04:59:40.424687', '2025-11-03 04:59:40.424687', 'LIST');
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (99, 'admin', 'v1', 'GET', '/api/admin/policies/{id}/endpoints', 'Get endpoints attached to policy', true, '2025-11-05 19:23:07.334613', '2025-11-05 19:23:07.334614', NULL);
INSERT INTO auth.endpoints (id, service, version, method, path, description, is_active, created_at, updated_at, ui_type) VALUES (108, 'worker', 'v1', 'POST', '/api/worker/uploaded-data/file/{fileId}/validate', 'Validate file with file id', true, '2025-11-06 12:03:08.694172', '2025-11-06 12:03:08.694173', NULL);


--
-- Name: endpoints_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.endpoints_id_seq', 116, true);


--
-- PostgreSQL database dump complete
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: policies; Type: TABLE DATA; Schema: auth; Owner: -
--

INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (18, 'WORKER_UPLOAD_DATA_READ_POLICY', 'Policy for worker upload data read', 'RBAC', '{"roles": ["WORKER_UPLOAD_DATA_VIEW"]}', true, '2025-11-03 13:57:50.210621', '2025-11-03 13:57:50.210625', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (19, 'TECHNICAL_BOOTSTRAP', 'Technical bootstrap policy for system initialization and administrative endpoints', 'RBAC', NULL, true, '2025-11-03 16:36:02.902559', '2025-11-03 16:36:02.902559', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (20, 'WORKER_RECEIPT_MANAGE_POLICY', 'Manage receipts of worker', 'RBAC', NULL, true, '2025-11-06 12:14:00.825785', '2025-11-06 12:14:00.825787', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (21, 'MASTER_UPLOAD_POLICY', 'Policy for upload master data', 'RBAC', NULL, true, '2025-11-15 21:09:42.45984', '2025-11-15 21:09:42.459842', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (1, 'BASIC_USER_POLICY', 'Baseline access to authorization APIs and the service catalog for all authenticated users.', 'RBAC', '{"roles": ["BASIC_USER"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (2, 'USER_ACCOUNT_MANAGE_POLICY', 'Manage user accounts and lifecycle operations.', 'RBAC', '{"roles": ["BUSINESS_ADMIN", "TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (3, 'ROLE_READ_POLICY', 'Read role catalog and metadata.', 'RBAC', '{"roles": ["BUSINESS_ADMIN", "TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (4, 'ROLE_ASSIGN_POLICY', 'Assign or revoke roles from users.', 'RBAC', '{"roles": ["BUSINESS_ADMIN", "TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (5, 'ROLE_MANAGE_POLICY', 'Create, update, delete, or toggle roles.', 'RBAC', '{"roles": ["TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (6, 'CAPABILITY_READ_POLICY', 'Read capability catalog and matrices.', 'RBAC', '{"roles": ["TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (7, 'CAPABILITY_MANAGE_POLICY', 'Create, update, delete, or toggle capabilities.', 'RBAC', '{"roles": ["TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (8, 'POLICY_READ_POLICY', 'Read policy catalog and attached capabilities.', 'RBAC', '{"roles": ["TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (9, 'POLICY_MANAGE_POLICY', 'Create, update, delete, toggle, and maintain policy-capability links.', 'RBAC', '{"roles": ["TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (10, 'ENDPOINT_READ_POLICY', 'Read registered endpoint metadata.', 'RBAC', '{"roles": ["TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (11, 'ENDPOINT_MANAGE_POLICY', 'Create, update, delete, toggle, and link endpoints to policies.', 'RBAC', '{"roles": ["TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (12, 'UI_PAGE_READ_POLICY', 'Read UI page catalog and hierarchy.', 'RBAC', '{"roles": ["TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (13, 'UI_PAGE_MANAGE_POLICY', 'Create, update, delete, reorder, and toggle UI pages.', 'RBAC', '{"roles": ["TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (14, 'UI_ACTION_READ_POLICY', 'Read page actions and mappings.', 'RBAC', '{"roles": ["TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (15, 'UI_ACTION_MANAGE_POLICY', 'Create, update, delete, reorder, and toggle page actions.', 'RBAC', '{"roles": ["TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (16, 'SYSTEM_READ_POLICY', 'Read audit trails, system settings, and ingestion status.', 'RBAC', '{"roles": ["TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);
INSERT INTO auth.policies (id, name, description, type, expression_deprecated, is_active, created_at, updated_at, policy_type, conditions) VALUES (17, 'SYSTEM_MANAGE_POLICY', 'Update system settings and trigger ingestion jobs.', 'RBAC', '{"roles": ["TECHNICAL_BOOTSTRAP"]}', true, '2025-11-03 06:49:41.790528', '2025-11-03 06:49:41.790528', 'PERMISSION', NULL);


--
-- Name: policies_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.policies_id_seq', 21, true);




--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: roles; Type: TABLE DATA; Schema: auth; Owner: -
--

INSERT INTO auth.roles (id, name, description, created_at, updated_at, is_active) VALUES (1, 'BASIC_USER', 'Baseline role assigned to ALL authenticated users. Grants fundamental access to authorization APIs and service catalog. Required for basic system operations and user authentication. Every user must have this role.', '2025-11-03 05:00:10.390007', '2025-11-03 05:00:10.390007', true);
INSERT INTO auth.roles (id, name, description, created_at, updated_at, is_active) VALUES (2, 'BUSINESS_ADMIN', 'Business-facing administrator. Can create users, assign roles, and manage user accounts. Limited to user management operations. All other roles and system configuration are managed by TECHNICAL_BOOTSTRAP user. Must also be assigned BASIC_USER role.', '2025-11-03 05:00:10.390007', '2025-11-03 05:00:10.390007', true);
INSERT INTO auth.roles (id, name, description, created_at, updated_at, is_active) VALUES (3, 'TECHNICAL_BOOTSTRAP', 'Technical bootstrap administrator. Full system configuration access for initial setup. Can create roles, policies, capabilities, UI pages, endpoints, and all system configuration. Used during onboarding phase only. Must also be assigned BASIC_USER role.', '2025-11-03 05:00:10.390007', '2025-11-03 05:00:10.390007', true);
INSERT INTO auth.roles (id, name, description, created_at, updated_at, is_active) VALUES (4, 'WORKER_UPLOAD_DATA_MANAGE', 'Read only role of view uploaded data', '2025-11-03 13:47:57.996975', '2025-11-06 11:37:30.008774', true);
INSERT INTO auth.roles (id, name, description, created_at, updated_at, is_active) VALUES (5, 'WORKER_RECEIPT_MANAGE', 'Worker receipt management', '2025-11-06 12:05:31.05924', '2025-11-06 12:05:31.05924', true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.roles_id_seq', 5, true);


--
-- PostgreSQL database dump complete
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: -
--

INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (38, 'business.admin', 'business.admin@system.local', '$2a$10$zxNRGRU4nRpoDD3zJxG/W.9gKV4VroeZh0iga2uYrhMUi2IiHYwFy', 'Business Administrator', 'ADMIN', true, true, true, true, '2025-11-03 05:03:38.142121', '2025-11-03 12:36:10.598528', '2025-11-03 12:36:10.593972', 1, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (3, 'WORKER', 'ram@gmail.com', '$2a$10$u1NYF1njJbIm8Dy3uOlCC.m1bJ3AdalTq7/Q7uGnnBGRepc8tjFI6', 'Ram', 'USER', true, true, true, true, '2025-10-30 08:23:17', '2025-11-14 19:58:28.895285', '2025-11-14 19:58:28.894267', 5, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (37, 'test.user', 'test.user@system.local', '$2a$10$OyCA1lgOZBk/qb8dahYeD.UrSyuY2urN2eC1IHYgOzuSOaBhBoD4u', 'Test User For QA', 'USER', true, true, true, true, '2025-11-02 14:08:14.722667', '2025-11-02 14:08:14.722667', NULL, 1, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (34, 'board1', 'board1@company.local', '$2a$10$97nkDtl5VXGUWs6jd7XOV.gjtGe3bwS/NgDFuykUZka/2kWTjWxbC', 'Board Member One', 'BOARD', false, true, true, true, '2025-11-02 14:08:14.722667', '2025-11-05 00:33:24.46589', '2025-11-02 19:44:44.144484', 2, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (8, 'test', 'test@tets.com', '$2a$10$h0.i.5ftglB76teVZANaqOnaSzyZXojfMRkB.3N/vXk5CrYChZvqK', 'test user', 'USER', true, true, true, true, '2025-11-02 10:34:40.364349', '2025-11-03 20:46:44.718335', NULL, 4, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (36, 'worker1', 'worker1@company.local', '$2a$10$aTm0BsUSwGerSrNrOau8..lV8V7Z5VQO0mnaa1txPLLLgX3A8xRbW', 'Worker User One', 'WORKER', true, true, true, true, '2025-11-02 14:08:14.722667', '2025-11-02 14:08:14.722667', NULL, 1, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (31, 'platform.bootstrap', 'bootstrap@system.local', '$2a$10$K7ZdK4muqK0KrXwcTwV/auNw6C8AF0VYPtrUlB8IGIeByIWFJ1ie6', 'Platform Bootstrap', 'ADMIN', true, true, true, true, '2025-11-02 14:08:14.722667', '2025-11-02 14:08:14.722667', NULL, 1, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (6, 'sysadmin', 'sysadmin@hotmail.com', '$2a$10$L6/AjFAS7QjMJHWvKekii.NIb7hGzCmnfl.zW0B9JEx264Iv6GRB6', 'SYS', 'ADMIN', true, true, true, true, '2025-10-31 06:04:41', '2025-11-05 09:38:05.78236', '2025-10-31 06:07:39', 4, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (35, 'employer1', 'employer1@company.local', '$2a$10$zFVoBF9dPxD01NoD6srsIeU4I2fHeQxJBzZxlMVPc9ZKIqFJ1FSyG', 'Employer Staff One', 'EMPLOYER', true, true, true, true, '2025-11-02 14:08:14.722667', '2025-11-02 14:08:14.722667', NULL, 1, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (42, 'business.ops', 'bus@gmail.com', '$2a$10$iLNVwNPBXFZLYF8qA38FduEpEpHb2JlA16xkeOR0pBomNIfA6Po2m', 'Business User', 'ADMIN', true, true, true, true, '2025-11-03 14:11:07.704656', '2025-11-03 18:01:49.202923', '2025-11-03 18:01:49.199595', 3, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (4, 'Ram1', 'ram1@gmail.com', '$2a$10$zINvAmN0YsUJmnft.IKv2.aYYHDnaBBtNu3gHWG2nTXX/GBi5ZDYO', 'Ram1', 'EMPLOYER', false, true, true, true, '2025-10-30 10:15:17', '2025-11-04 09:23:02.882972', NULL, 2, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (33, 'admin.ops', 'admin.ops@system.local', '$2a$10$RsCl4r3u43sTIToUOsjKyOKYh.lmix.hWMCAhRgwDHVdPratagQRW', 'Operations Administrator', 'ADMIN', true, true, true, true, '2025-11-02 14:08:14.722667', '2025-11-02 20:27:34.51013', '2025-11-02 20:27:34.507889', 1, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (7, 'techadmin', 'techadmin@hotmail.com', '$2a$10$rARXHknkkq5552y3Ae.WyextQ5a3Z24c66ybQ4Zqg3AODFptTqWu2', 'SYS', 'ADMIN', true, true, true, true, '2025-10-31 09:27:00', '2025-11-05 09:41:15.999897', NULL, 5, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (32, 'admin.tech', 'admin.tech@system.local', '$2a$10$m2WyB7vO.wPiScT1Dm.gw.64oC2Eq4lOzEy798QR0ktIg4jdBgaT.', 'Tech Administrator', 'ADMIN', true, true, true, true, '2025-11-02 14:08:14.722667', '2025-11-02 20:44:20.804625', '2025-11-02 20:44:20.803854', 1, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (39, 'tech.bootstrap', 'tech.bootstrap@system.local', '$2a$10$qwblAK4hJlSWWQ8j7FIIueUEQCD/R1k6Lu7Nee5lFQxWFC9KIb2VG', 'Technical Bootstrap Administrator', 'ADMIN', true, true, true, true, '2025-11-03 05:03:38.142121', '2025-11-17 15:31:38.947113', '2025-11-17 15:31:38.944518', 1, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (1, 'admin', 'admin@example.com', '$2b$10$ZuNPpWnsWE/DVaHFzPGnHuh0ANT7.ZlT8YeSCnY3W8pInAOKk/vwu', 'System Administrator', 'ADMIN', false, true, true, true, '2025-10-09 15:23:20', '2025-11-05 10:01:51.008601', '2025-11-02 10:27:03.960444', 12, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (2, 'rahul', 'rahul@hotmail.com', '$2a$10$9KbZe.9oH.ybQl03KyOcKu9GqsVfib6l9J5aHnRmPIjVUrTlfbOGi', 'rahul c', 'ADMIN', false, true, true, true, '2025-10-29 06:23:05', '2025-11-04 15:54:54.744435', '2025-10-29 06:27:48', 8, 'ADMIN');
INSERT INTO auth.users (id, username, email, password, full_name, role, is_enabled, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, created_at, updated_at, last_login, permission_version, user_type) VALUES (5, 'Ram2', 'ram2@gmail.com', '$2a$10$1mYbHoutHH5O3XcsyyQrheoEIhfj7C552lfgRA7ybDp12ij00QdUe', 'Ram1', 'EMPLOYER', false, true, true, true, '2025-10-30 10:26:55', '2025-11-04 15:54:57.878647', NULL, 6, 'ADMIN');


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.users_id_seq', 42, true);


--
-- PostgreSQL database dump complete
--

-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: endpoint_policies; Type: TABLE DATA; Schema: auth; Owner: -
--

INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (521, 35, 11);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (522, 99, 11);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (523, 102, 9);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (532, 100, 18);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (533, 73, 18);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (534, 107, 18);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (535, 108, 18);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (536, 109, 18);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (537, 112, 20);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (538, 110, 20);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (539, 111, 20);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (547, 113, 21);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (548, 114, 21);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (403, 5, 2);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (404, 6, 2);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (405, 7, 2);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (406, 8, 2);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (407, 9, 2);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (408, 3, 2);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (409, 10, 3);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (410, 11, 3);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (411, 12, 3);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (412, 13, 3);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (413, 14, 3);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (549, 115, 21);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (550, 116, 21);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (551, 64, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (552, 74, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (553, 75, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (419, 20, 8);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (554, 76, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (555, 77, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (556, 78, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (557, 79, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (558, 80, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (559, 81, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (560, 83, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (561, 84, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (428, 29, 6);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (429, 30, 6);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (430, 31, 7);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (431, 32, 7);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (432, 33, 7);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (433, 34, 7);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (562, 85, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (563, 86, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (564, 87, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (437, 37, 11);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (438, 38, 11);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (439, 39, 11);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (440, 40, 11);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (441, 42, 11);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (442, 43, 11);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (443, 44, 11);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (444, 45, 12);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (445, 46, 12);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (446, 47, 12);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (447, 53, 12);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (448, 48, 13);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (449, 49, 13);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (450, 50, 13);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (451, 51, 13);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (452, 52, 13);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (453, 54, 14);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (454, 55, 14);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (455, 56, 14);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (456, 57, 15);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (457, 58, 15);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (458, 59, 15);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (459, 60, 15);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (460, 61, 15);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (461, 71, 2);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (462, 72, 2);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (565, 93, 19);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (502, 18, 4);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (503, 19, 4);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (504, 16, 5);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (505, 17, 5);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (506, 91, 5);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (507, 15, 5);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (516, 69, 1);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (517, 70, 1);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (518, 62, 1);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (519, 95, 1);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (520, 63, 1);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (512, 66, 1);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (513, 67, 1);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (514, 4, 1);
INSERT INTO auth.endpoint_policies (id, endpoint_id, policy_id) VALUES (515, 68, 1);


--
-- Name: endpoint_policies_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.endpoint_policies_id_seq', 565, true);


--
-- PostgreSQL database dump complete
--



--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: role_policies; Type: TABLE DATA; Schema: auth; Owner: -
--

INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (1, 4, 18, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (2, 1, 1, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (3, 2, 2, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (4, 3, 2, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (5, 2, 3, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (6, 3, 3, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (7, 2, 4, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (8, 3, 4, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (9, 3, 5, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (10, 3, 6, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (11, 3, 7, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (12, 3, 8, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (13, 3, 9, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (14, 3, 10, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (15, 3, 11, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (16, 3, 12, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (17, 3, 13, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (18, 3, 14, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (19, 3, 15, '2025-11-03 16:23:16.74128', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (22, 3, 19, '2025-11-03 16:54:38.692654', NULL, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (23, 3, 1, '2025-11-04 15:31:27.062405', 39, false, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (21, 3, 17, '2025-11-03 16:23:16.74128', NULL, false, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (20, 3, 16, '2025-11-03 16:23:16.74128', NULL, false, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (24, 5, 20, '2025-11-06 12:14:35.806663', 39, true, NULL, NULL);
INSERT INTO auth.role_policies (id, role_id, policy_id, assigned_at, assigned_by, is_active, conditions, priority) VALUES (25, 3, 21, '2025-11-15 21:10:23.562743', 39, true, NULL, NULL);


--
-- Name: role_policies_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.role_policies_id_seq', 25, true);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: auth; Owner: -
--

INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (58, 38, 1, '2025-11-03 05:04:15.925411');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (59, 38, 2, '2025-11-03 05:04:15.925411');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (60, 39, 1, '2025-11-03 05:04:15.925411');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (61, 39, 3, '2025-11-03 05:04:15.925411');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (66, 42, 4, '2025-11-03 14:11:57.253306');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (67, 42, 1, '2025-11-03 14:13:41.690342');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (70, 37, 1, '2025-11-03 14:58:03.873824');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (71, 36, 1, '2025-11-03 14:58:03.873824');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (72, 4, 2, '2025-11-03 14:58:03.882106');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (73, 5, 2, '2025-11-03 14:58:03.882106');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (74, 6, 2, '2025-11-03 14:58:03.882106');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (75, 7, 2, '2025-11-03 14:58:03.882106');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (76, 1, 2, '2025-11-03 14:58:03.882106');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (77, 39, 2, '2025-11-03 14:58:03.882106');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (78, 31, 2, '2025-11-03 14:58:03.882106');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (79, 35, 2, '2025-11-03 14:58:03.882106');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (80, 42, 2, '2025-11-03 14:58:03.882106');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (81, 33, 2, '2025-11-03 14:58:03.882106');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (82, 32, 2, '2025-11-03 14:58:03.882106');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (83, 2, 2, '2025-11-03 14:58:03.882106');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (84, 6, 3, '2025-11-03 14:58:03.883539');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (85, 7, 3, '2025-11-03 14:58:03.883539');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (86, 31, 3, '2025-11-03 14:58:03.883539');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (87, 3, 4, '2025-11-04 15:55:55.360676');
INSERT INTO auth.user_roles (id, user_id, role_id, assigned_at) VALUES (88, 3, 5, '2025-11-06 12:15:21.092394');


--
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.user_roles_id_seq', 88, true);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: notification_templates; Type: TABLE DATA; Schema: auth; Owner: -
--

INSERT INTO auth.notification_templates (id, template_key, template_name, template_type, subject_template, body_template, is_active, created_by, created_at, updated_by, updated_at) VALUES (1, 'WORKER_PAYMENT_PROCESSED', 'Worker Payment Processed', 'EMAIL', 'Payment Processed - {{workerName}}', 'Dear {{workerName}},

Your payment of {{amount}} has been processed successfully.

Transaction Reference: {{transactionRef}}
Date: {{processedDate}}

Thank you.', true, 'SYSTEM', '2025-10-09 07:27:45', NULL, '2025-10-09 07:27:45');
INSERT INTO auth.notification_templates (id, template_key, template_name, template_type, subject_template, body_template, is_active, created_by, created_at, updated_by, updated_at) VALUES (2, 'EMPLOYER_RECEIPT_VALIDATED', 'Employer Receipt Validated', 'EMAIL', 'Receipt Validated - {{receiptNumber}}', 'Dear {{employerName}},

Your receipt {{receiptNumber}} has been validated successfully.

Amount: {{amount}}
Validated Date: {{validatedDate}}

Thank you.', true, 'SYSTEM', '2025-10-09 07:27:45', NULL, '2025-10-09 07:27:45');
INSERT INTO auth.notification_templates (id, template_key, template_name, template_type, subject_template, body_template, is_active, created_by, created_at, updated_by, updated_at) VALUES (3, 'FILE_PROCESSING_COMPLETED', 'File Processing Completed', 'SYSTEM', 'File Processing Status', 'File {{fileName}} processing completed.
Total Records: {{totalRecords}}
Success: {{successCount}}
Failures: {{failureCount}}', true, 'SYSTEM', '2025-10-09 07:27:45', NULL, '2025-10-09 07:27:45');
INSERT INTO auth.notification_templates (id, template_key, template_name, template_type, subject_template, body_template, is_active, created_by, created_at, updated_by, updated_at) VALUES (4, 'ACCOUNT_LOCKED', 'Account Locked', 'EMAIL', 'Account Security Alert', 'Dear User,

Your account has been locked due to multiple failed login attempts.
It will be unlocked after {{lockDuration}} minutes.

If this was not you, please contact support.', true, 'SYSTEM', '2025-10-09 07:27:45', NULL, '2025-10-09 07:27:45');


--
-- Name: notification_templates_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.notification_templates_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: ui_pages; Type: TABLE DATA; Schema: auth; Owner: -
--

INSERT INTO auth.ui_pages (id, page_id, label, route, icon, module, parent_id, display_order, is_menu_item, is_active, created_at, updated_at) VALUES (1, 'dashboard', 'Admin Dashboard', '/dashboard', NULL, 'default', NULL, 1, true, true, '2025-11-04 23:01:52.239769', '2025-11-04 23:01:52.239774');
INSERT INTO auth.ui_pages (id, page_id, label, route, icon, module, parent_id, display_order, is_menu_item, is_active, created_at, updated_at) VALUES (2, 'rbac', 'RBAC', '/rbac', NULL, 'default', NULL, 2, true, true, '2025-11-04 23:02:14.008306', '2025-11-04 23:02:14.008309');
INSERT INTO auth.ui_pages (id, page_id, label, route, icon, module, parent_id, display_order, is_menu_item, is_active, created_at, updated_at) VALUES (3, 'rbac.endpoints', 'Endpoints', '/rbac/endpoints', NULL, 'default', 2, 1, true, true, '2025-11-04 23:02:52.078715', '2025-11-04 23:02:52.078719');
INSERT INTO auth.ui_pages (id, page_id, label, route, icon, module, parent_id, display_order, is_menu_item, is_active, created_at, updated_at) VALUES (4, 'rbac.policies', 'Policies', '/rbac/policies', NULL, 'default', 2, 2, true, true, '2025-11-04 23:03:23.323505', '2025-11-04 23:03:23.323507');
INSERT INTO auth.ui_pages (id, page_id, label, route, icon, module, parent_id, display_order, is_menu_item, is_active, created_at, updated_at) VALUES (5, 'rbac.roles', 'Roles', '/rbac/roles', NULL, 'default', 2, 3, true, true, '2025-11-04 23:03:41.102902', '2025-11-04 23:03:41.102905');
INSERT INTO auth.ui_pages (id, page_id, label, route, icon, module, parent_id, display_order, is_menu_item, is_active, created_at, updated_at) VALUES (6, 'rbac.users', 'Users', '/rbac/users', NULL, 'default', 2, 4, true, true, '2025-11-04 23:04:01.590321', '2025-11-04 23:04:01.590324');
INSERT INTO auth.ui_pages (id, page_id, label, route, icon, module, parent_id, display_order, is_menu_item, is_active, created_at, updated_at) VALUES (7, 'ui', 'UI', '/ui', NULL, 'default', 3, 3, true, true, '2025-11-04 23:04:25.184841', '2025-11-04 23:04:25.184843');
INSERT INTO auth.ui_pages (id, page_id, label, route, icon, module, parent_id, display_order, is_menu_item, is_active, created_at, updated_at) VALUES (8, 'ui.page_actions', 'Page Actions', '/ui/page_actions', NULL, 'default', 3, 1, true, true, '2025-11-04 23:04:56.212016', '2025-11-04 23:04:56.212019');
INSERT INTO auth.ui_pages (id, page_id, label, route, icon, module, parent_id, display_order, is_menu_item, is_active, created_at, updated_at) VALUES (9, 'ui.pages', 'UI Pages', '/ui/pages', NULL, 'default', 3, 2, true, true, '2025-11-04 23:05:16.137564', '2025-11-04 23:05:16.137566');
INSERT INTO auth.ui_pages (id, page_id, label, route, icon, module, parent_id, display_order, is_menu_item, is_active, created_at, updated_at) VALUES (16, 'worker', 'Worker', '/worker', NULL, 'default', NULL, 1, true, true, '2025-11-05 14:53:24.639955', '2025-11-05 14:53:24.639958');
INSERT INTO auth.ui_pages (id, page_id, label, route, icon, module, parent_id, display_order, is_menu_item, is_active, created_at, updated_at) VALUES (17, 'worker.upload', 'Worker Upload', '/worker/upload', NULL, 'default', 16, 1, true, true, '2025-11-05 14:56:56.935965', '2025-11-05 14:56:56.935968');


--
-- Name: ui_pages_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.ui_pages_id_seq', 19, true);


--
-- PostgreSQL database dump complete
--



--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: page_actions; Type: TABLE DATA; Schema: auth; Owner: -
--

INSERT INTO auth.page_actions (id, label, action, page_id, display_order, is_active, created_at, updated_at, endpoint_id, icon, variant) VALUES (17, 'View Dashboard', 'VIEW', 1, 0, true, '2025-11-04 23:22:42.742311', '2025-11-04 23:22:42.742311', 63, '', 'default');
INSERT INTO auth.page_actions (id, label, action, page_id, display_order, is_active, created_at, updated_at, endpoint_id, icon, variant) VALUES (18, 'View Policies', 'VIEW', 4, 1, true, '2025-11-05 11:05:53.396361', '2025-11-05 14:51:52.219145', 20, '', 'default');
INSERT INTO auth.page_actions (id, label, action, page_id, display_order, is_active, created_at, updated_at, endpoint_id, icon, variant) VALUES (19, 'Create Policies', 'CREATE', 4, 2, true, '2025-11-05 11:11:02.479784', '2025-11-05 14:52:02.934303', 84, '', 'default');
INSERT INTO auth.page_actions (id, label, action, page_id, display_order, is_active, created_at, updated_at, endpoint_id, icon, variant) VALUES (20, 'View Uploaded Data', 'View', 17, 1, true, '2025-11-05 15:10:50.924924', '2025-11-05 15:10:50.92493', 73, '', 'default');


--
-- Name: page_actions_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.page_actions_id_seq', 20, true);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--



--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: revoked_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

INSERT INTO auth.revoked_tokens (id, token_id, user_id, expires_at, created_at) VALUES (17, 'db5d527e-7180-4f9b-98c2-029655bf1a02', 39, '2025-11-17 15:43:31', '2025-11-17 05:24:10.156303');


--
-- Name: revoked_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.revoked_tokens_id_seq', 17, true);


--
-- PostgreSQL database dump complete
--



-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: system_config; Type: TABLE DATA; Schema: auth; Owner: -
--

INSERT INTO auth.system_config (id, config_key, config_value, config_type, description, is_encrypted, is_active, created_by, created_at, updated_by, updated_at) VALUES (1, 'MAX_FILE_UPLOAD_SIZE_MB', '50', 'INTEGER', 'Maximum file upload size in MB', false, true, 'SYSTEM', '2025-10-09 07:27:44', NULL, '2025-10-09 07:27:44');
INSERT INTO auth.system_config (id, config_key, config_value, config_type, description, is_encrypted, is_active, created_by, created_at, updated_by, updated_at) VALUES (2, 'MAX_RECORDS_PER_FILE', '5000', 'INTEGER', 'Maximum records allowed per uploaded file', false, true, 'SYSTEM', '2025-10-09 07:27:44', NULL, '2025-10-09 07:27:44');
INSERT INTO auth.system_config (id, config_key, config_value, config_type, description, is_encrypted, is_active, created_by, created_at, updated_by, updated_at) VALUES (3, 'API_RATE_LIMIT_PER_MINUTE', '100', 'INTEGER', 'Maximum API requests per minute per user', false, true, 'SYSTEM', '2025-10-09 07:27:44', NULL, '2025-10-09 07:27:44');
INSERT INTO auth.system_config (id, config_key, config_value, config_type, description, is_encrypted, is_active, created_by, created_at, updated_by, updated_at) VALUES (4, 'SESSION_TIMEOUT_HOURS', '8', 'INTEGER', 'User session timeout in hours', false, true, 'SYSTEM', '2025-10-09 07:27:44', NULL, '2025-10-09 07:27:44');
INSERT INTO auth.system_config (id, config_key, config_value, config_type, description, is_encrypted, is_active, created_by, created_at, updated_by, updated_at) VALUES (5, 'PASSWORD_MIN_LENGTH', '8', 'INTEGER', 'Minimum password length', false, true, 'SYSTEM', '2025-10-09 07:27:44', NULL, '2025-10-09 07:27:44');
INSERT INTO auth.system_config (id, config_key, config_value, config_type, description, is_encrypted, is_active, created_by, created_at, updated_by, updated_at) VALUES (6, 'MAX_LOGIN_ATTEMPTS', '5', 'INTEGER', 'Maximum failed login attempts before account lock', false, true, 'SYSTEM', '2025-10-09 07:27:44', NULL, '2025-10-09 07:27:44');
INSERT INTO auth.system_config (id, config_key, config_value, config_type, description, is_encrypted, is_active, created_by, created_at, updated_by, updated_at) VALUES (7, 'ACCOUNT_LOCK_DURATION_MINUTES', '30', 'INTEGER', 'Account lock duration in minutes after max failed attempts', false, true, 'SYSTEM', '2025-10-09 07:27:44', NULL, '2025-10-09 07:27:44');
INSERT INTO auth.system_config (id, config_key, config_value, config_type, description, is_encrypted, is_active, created_by, created_at, updated_by, updated_at) VALUES (8, 'ENABLE_EMAIL_NOTIFICATIONS', 'true', 'BOOLEAN', 'Enable email notifications for important events', false, true, 'SYSTEM', '2025-10-09 07:27:44', NULL, '2025-10-09 07:27:44');
INSERT INTO auth.system_config (id, config_key, config_value, config_type, description, is_encrypted, is_active, created_by, created_at, updated_by, updated_at) VALUES (9, 'ENABLE_SMS_NOTIFICATIONS', 'false', 'BOOLEAN', 'Enable SMS notifications for important events', false, true, 'SYSTEM', '2025-10-09 07:27:44', NULL, '2025-10-09 07:27:44');
INSERT INTO auth.system_config (id, config_key, config_value, config_type, description, is_encrypted, is_active, created_by, created_at, updated_by, updated_at) VALUES (10, 'MAINTENANCE_MODE', 'false', 'BOOLEAN', 'Enable maintenance mode to block user access', false, true, 'SYSTEM', '2025-10-09 07:27:44', NULL, '2025-10-09 07:27:44');


--
-- Name: system_config_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.system_config_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--



--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: auth; Owner: -
--



--
-- Name: user_sessions_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.user_sessions_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: user_tenant_acl; Type: TABLE DATA; Schema: auth; Owner: -
--

INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (1, 2, '1', NULL, 1, true, true, '2025-11-01 16:44:02.765559+00', '2025-11-01 16:44:02.765559+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (2, 3, '1', NULL, 1, true, false, '2025-11-01 16:44:02.765559+00', '2025-11-01 16:44:02.765559+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (3, 4, '1', NULL, 1, true, true, '2025-11-01 16:44:02.765559+00', '2025-11-01 16:44:02.765559+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (4, 5, '1', NULL, 1, true, true, '2025-11-01 16:44:02.765559+00', '2025-11-01 16:44:02.765559+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (5, 6, '1', NULL, 1, true, true, '2025-11-01 16:44:02.765559+00', '2025-11-01 16:44:02.765559+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (6, 7, '1', NULL, 1, true, true, '2025-11-01 16:44:02.765559+00', '2025-11-01 16:44:02.765559+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (7, 1, '1', NULL, 1, true, true, '2025-11-01 16:44:02.765559+00', '2025-11-01 16:44:02.765559+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (8, 8, '1', NULL, 1, true, false, '2025-11-02 05:04:40.384657+00', '2025-11-02 05:04:40.384657+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (14, 36, '1', 'EMP-001', 1, true, false, '2025-11-02 14:08:35.701468+00', '2025-11-02 14:08:35.701468+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (15, 35, '1', 'EMP-001', 1, true, true, '2025-11-02 14:08:35.701468+00', '2025-11-02 14:08:35.701468+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (16, 34, '1', NULL, 1, true, true, '2025-11-02 14:08:35.701468+00', '2025-11-02 14:08:35.701468+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (17, 32, '1', NULL, 1, true, true, '2025-11-02 14:08:35.701468+00', '2025-11-02 14:08:35.701468+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (18, 33, '1', NULL, 1, true, true, '2025-11-02 14:08:35.701468+00', '2025-11-02 14:08:35.701468+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (19, 42, '1', NULL, 1, true, true, '2025-11-03 08:41:07.712611+00', '2025-11-03 08:41:07.712611+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (20, 39, '1', NULL, 1, true, true, '2025-11-15 16:38:16.877152+00', '2025-11-15 16:38:16.877152+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (21, 39, '1', NULL, 1, true, true, '2025-11-15 16:38:23.001689+00', '2025-11-15 16:38:23.001689+00');
INSERT INTO auth.user_tenant_acl (id, user_id, board_id, employer_id, toli_id, can_read, can_write, created_at, updated_at) VALUES (22, 39, '1', NULL, 1, true, true, '2025-11-15 16:51:52.880631+00', '2025-11-15 16:51:52.880631+00');


--
-- Name: user_tenant_acl_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.user_tenant_acl_id_seq', 22, true);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: user_tenant_acl_audit; Type: TABLE DATA; Schema: auth; Owner: -
--



--
-- Name: user_tenant_acl_audit_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.user_tenant_acl_audit_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--



--
-- PostgreSQL database dump
--
--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: board_receipts; Type: TABLE DATA; Schema: payment_flow; Owner: -
--

-- All board_receipts inserts already include toli_id and are valid for the new schema.


--
-- Name: board_receipts_id_seq; Type: SEQUENCE SET; Schema: payment_flow; Owner: -
--

SELECT pg_catalog.setval('payment_flow.board_receipts_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: employer_master; Type: TABLE DATA; Schema: payment_flow; Owner: -
--

INSERT INTO payment_flow.employer_master (id, registration_number, establishment_name, address, employer_name, mobile_number, email_id, aadhar_number, pan_number, tan_number, virtual_bank_account_number, status, created_at, updated_at, board_id, aadhaar_number, owner_name, serial_no, parent_employer_id, is_registered) VALUES (1, 'EMP-0001', 'Shree Constructions Pvt Ltd', '7th Floor - Skyline Towers - Andheri East - Mumbai', 'Prakash Kulkarni', '9876501234', 'prakash.kulkarni@shreecon.com', '567856785678', 'CCCCD3333C', 'MUMN12345B', 'VBAN-100200300', 'ACTIVE', '2025-11-15 22:27:02.607558', '2025-11-15 22:27:02.607558', 1, NULL, NULL, NULL, NULL, true);
INSERT INTO payment_flow.employer_master (id, registration_number, establishment_name, address, employer_name, mobile_number, email_id, aadhar_number, pan_number, tan_number, virtual_bank_account_number, status, created_at, updated_at, board_id, aadhaar_number, owner_name, serial_no, parent_employer_id, is_registered) VALUES (2, 'EMP-0002', 'Mangal Builders LLP', 'Plot 21 - Baner - Pune', 'Meena Salunkhe', '9988002211', 'meena.salunkhe@mangalbuild.com', '789078907890', 'DDDDD4444D', 'PUNE23456C', 'VBAN-200300400', 'ACTIVE', '2025-11-15 22:27:02.620554', '2025-11-15 22:27:02.620554', 1, NULL, NULL, NULL, NULL, true);
INSERT INTO payment_flow.employer_master (id, registration_number, establishment_name, address, employer_name, mobile_number, email_id, aadhar_number, pan_number, tan_number, virtual_bank_account_number, status, created_at, updated_at, board_id, aadhaar_number, owner_name, serial_no, parent_employer_id, is_registered) VALUES (6, 'REG001', 'Acme Corp', '123 Main St', 'John Doe', '9876543210', 'john@acme.com', '123412341234', 'ABCDE1234F', 'TAN1234567', 'VBANK123456', 'ACTIVE', '2025-11-16 00:00:00', '2025-11-16 00:00:00', 'mockBoardId', '123412341234', 'Jane Owner', NULL, NULL, false);


--
-- Name: employer_master_id_seq; Type: SEQUENCE SET; Schema: payment_flow; Owner: -
--

SELECT pg_catalog.setval('payment_flow.employer_master_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: employer_payment_receipts; Type: TABLE DATA; Schema: payment_flow; Owner: -
--

INSERT INTO payment_flow.employer_payment_receipts (id, employer_receipt_number, worker_receipt_number, employer_id, toli_id, transaction_reference, validated_by, validated_at, total_records, total_amount, status, board_id) VALUES (1, 'EMP-20251011-221714-114', 'RCP-20251011-221244-522', 1, 1, 'DD', 'AA', '2025-10-15 13:53:42', 20, 4365.00, 'SEND TO BOARD', '1');
INSERT INTO payment_flow.employer_payment_receipts (id, employer_receipt_number, worker_receipt_number, employer_id, toli_id, transaction_reference, validated_by, validated_at, total_records, total_amount, status, board_id) VALUES (2, 'EMP-20251020-171012-056', 'RCP-20251020-170816-158', 1, 1, 'AAA', 'AAA', '2025-10-29 13:24:09', 20, 4365.00, 'SEND TO BOARD', '1');


--
-- Name: employer_payment_receipts_id_seq; Type: SEQUENCE SET; Schema: payment_flow; Owner: -
--

SELECT pg_catalog.setval('payment_flow.employer_payment_receipts_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: employer_toli_relation; Type: TABLE DATA; Schema: payment_flow; Owner: -
--

INSERT INTO payment_flow.employer_toli_relation (id, employer_id, toli_id, toli_name, toli_code, location, supervisor_name, supervisor_contact, status, created_at, updated_at, board_id) VALUES (1, 1, 1, 'LNT Mumbai Construction Toli', 'LNT-MUM-001', 'Bandra Kurla Complex, Mumbai', 'Suresh Patil', '9876543210', 'ACTIVE', '2025-10-09 15:23:20', '2025-10-09 15:23:20', NULL);
INSERT INTO payment_flow.employer_toli_relation (id, employer_id, toli_id, toli_name, toli_code, location, supervisor_name, supervisor_contact, status, created_at, updated_at, board_id) VALUES (2, 1, '1', 'LNT Pune Infrastructure Toli', 'LNT-PUN-002', 'Hinjewadi, Pune', 'Rajesh Kumar', '9876543211', 'ACTIVE', '2025-10-09 15:23:20', '2025-10-09 15:23:20', NULL);
INSERT INTO payment_flow.employer_toli_relation (id, employer_id, toli_id, toli_name, toli_code, location, supervisor_name, supervisor_contact, status, created_at, updated_at, board_id) VALUES (3, 1, '1', 'LNT Chennai Metro Toli', 'LNT-CHE-003', 'Guindy, Chennai', 'Murugan Rajan', '9876543212', 'ACTIVE', '2025-10-09 15:23:20', '2025-10-09 15:23:20', NULL);
INSERT INTO payment_flow.employer_toli_relation (id, employer_id, toli_id, toli_name, toli_code, location, supervisor_name, supervisor_contact, status, created_at, updated_at, board_id) VALUES (4, '1', '1', 'SP Mumbai Residential Toli', 'SP-MUM-004', 'Worli, Mumbai', 'Anil Menon', '9876543213', 'ACTIVE', '2025-10-09 15:23:20', '2025-10-09 15:23:20', NULL);
INSERT INTO payment_flow.employer_toli_relation (id, employer_id, toli_id, toli_name, toli_code, location, supervisor_name, supervisor_contact, status, created_at, updated_at, board_id) VALUES (5, '1', '1', 'SP Bangalore Tech Park Toli', 'SP-BLR-005', 'Electronic City, Bangalore', 'Vijay Kumar', '9876543214', 'ACTIVE', '2025-10-09 15:23:20', '2025-10-09 15:23:20', NULL);
INSERT INTO payment_flow.employer_toli_relation (id, employer_id, toli_id, toli_name, toli_code, location, supervisor_name, supervisor_contact, status, created_at, updated_at, board_id) VALUES (6, '1', '1', 'Tata Hyderabad Infrastructure Toli', 'TATA-HYD-006', 'HITEC City, Hyderabad', 'Srinivas Rao', '9876543215', 'ACTIVE', '2025-10-09 15:23:20', '2025-10-09 15:23:20', NULL);
INSERT INTO payment_flow.employer_toli_relation (id, employer_id, toli_id, toli_name, toli_code, location, supervisor_name, supervisor_contact, status, created_at, updated_at, board_id) VALUES (7, '1', '1', 'Tata Mumbai Metro Toli', 'TATA-MUM-007', 'Colaba, Mumbai', 'Prakash Joshi', '9876543216', 'ACTIVE', '2025-10-09 15:23:20', '2025-10-09 15:23:20', NULL);
INSERT INTO payment_flow.employer_toli_relation (id, employer_id, toli_id, toli_name, toli_code, location, supervisor_name, supervisor_contact, status, created_at, updated_at, board_id) VALUES (8, '1', '1', 'Godrej Mumbai Residential Toli', 'GC-MUM-008', 'Vikhroli, Mumbai', 'Ramesh Patil', '9876543217', 'ACTIVE', '2025-10-09 15:23:20', '2025-10-09 15:23:20', NULL);
INSERT INTO payment_flow.employer_toli_relation (id, employer_id, toli_id, toli_name, toli_code, location, supervisor_name, supervisor_contact, status, created_at, updated_at, board_id) VALUES (9, '1', '1', 'Godrej Pune Commercial Toli', 'GC-PUN-009', 'Kharadi, Pune', 'Sunil Deshmukh', '9876543218', 'ACTIVE', '2025-10-09 15:23:20', '2025-10-09 15:23:20', NULL);
INSERT INTO payment_flow.employer_toli_relation (id, employer_id, toli_id, toli_name, toli_code, location, supervisor_name, supervisor_contact, status, created_at, updated_at, board_id) VALUES (10, '1', '1', 'Prestige Bangalore Residential Toli', 'PG-BLR-010', 'Whitefield, Bangalore', 'Mohan Kumar', '9876543219', 'ACTIVE', '2025-10-09 15:23:20', '2025-10-09 15:23:20', NULL);


--
-- Name: employer_toli_relation_id_seq; Type: SEQUENCE SET; Schema: payment_flow; Owner: -
--

SELECT pg_catalog.setval('payment_flow.employer_toli_relation_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: toli_details; Type: TABLE DATA; Schema: payment_flow; Owner: -
--




--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: toli_master; Type: TABLE DATA; Schema: payment_flow; Owner: -
--

INSERT INTO payment_flow.toli_master (id, registration_number, employer_name_marathi, address, employer_name_english, mobile_number, email_id, status, created_at, updated_at, board_id, employer_id, toli_id) VALUES (1, 'TOLI-001', 'राजमाता रोजगार संस्था', 'Gadge Maharaj Road - Nashik', 'Rajmata Employment Society', '9090901234', 'contact@rajmata.org', 'ACTIVE', '2025-11-15 22:26:44.022682', '2025-11-15 22:26:44.022682', 1, 1, 1);
INSERT INTO payment_flow.toli_master (id, registration_number, employer_name_marathi, address, employer_name_english, mobile_number, email_id, status, created_at, updated_at, board_id, employer_id, toli_id) VALUES (2, 'TOLI-002', 'श्रमयोगी समाज', 'Station Road - Kolhapur', 'Shramyogi Collective', '9191912345', 'hello@shramyogi.in', 'ACTIVE', '2025-11-15 22:26:44.036087', '2025-11-15 22:26:44.036087', 1, 1, 2);



--
-- Name: toli_master_id_seq; Type: SEQUENCE SET; Schema: payment_flow; Owner: -
--

SELECT pg_catalog.setval('payment_flow.toli_master_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: uploaded_files; Type: TABLE DATA; Schema: payment_flow; Owner: -
--

INSERT INTO payment_flow.uploaded_files (id, filename, stored_path, file_hash, file_type, created_at, uploaded_by, total_records, success_count, failure_count, status, file_reference_number, board_id, employer_id) VALUES (6, 'valid_worker_uploaded_data1.csv', '/Users/rahulcharvekar/Documents/Repos/LBE/PaymentReconciliation/payment-flow-service/uploads/dev/workerpayments/46cd745d-a460-46eb-b565-b46e9a0e80ac_valid_worker_uploaded_data1.csv', '83031031b12bac4afbc3f94f14b6e2e717d076c242fc47cf56d8305f11e1f59f', 'workerpayments', '2025-10-16 09:30:24', NULL, 20, 20, 0, 'COMPLETED', 'REQ-20251016-150023-739', '1', NULL);
INSERT INTO payment_flow.uploaded_files (id, filename, stored_path, file_hash, file_type, created_at, uploaded_by, total_records, success_count, failure_count, status, file_reference_number, board_id, employer_id) VALUES (15, 'worker_master_upload_sample.csv', '/Users/rahulcharvekar/Documents/Repos/LBE/PaymentReconciliation/payment-flow-service/uploads/dev/worker-master/04dcb494-3069-46d8-a535-f65430062ab3_worker_master_upload_sample.csv', '7db2bb49e8c73d1cd5f50691c1e5f3e09f1d1b0ecaa496575277b32562312c7d', 'worker-master', '2025-11-15 22:24:03.025784', 'tech.bootstrap', 2, 2, 0, 'COMPLETED', 'REQ-20251115-222403-028', '1', NULL);
INSERT INTO payment_flow.uploaded_files (id, filename, stored_path, file_hash, file_type, created_at, uploaded_by, total_records, success_count, failure_count, status, file_reference_number, board_id, employer_id) VALUES (16, 'toli_master_upload_sample.csv', '/Users/rahulcharvekar/Documents/Repos/LBE/PaymentReconciliation/payment-flow-service/uploads/dev/toli-master/e6b9c1ab-4671-4fe1-8b5f-2e6397524c26_toli_master_upload_sample.csv', '004e3595669e8b81f28e169734b8f27421cbbdd44baa980c3a4e97f2452ed84f', 'toli-master', '2025-11-15 22:26:44.014413', 'tech.bootstrap', 2, 2, 0, 'COMPLETED', 'REQ-20251115-222644-016', '1', NULL);
INSERT INTO payment_flow.uploaded_files (id, filename, stored_path, file_hash, file_type, created_at, uploaded_by, total_records, success_count, failure_count, status, file_reference_number, board_id, employer_id) VALUES (17, 'employer_master_upload_sample.csv', '/Users/rahulcharvekar/Documents/Repos/LBE/PaymentReconciliation/payment-flow-service/uploads/dev/employer-master/e61dcf08-243f-4fab-bb92-6d4f428bb4cd_employer_master_upload_sample.csv', '25da214c2300ca2f933a251fe6381165b5c785d13c7db799c8562725caaa4cbe', 'employer-master', '2025-11-15 22:27:02.59585', 'tech.bootstrap', 2, 2, 0, 'COMPLETED', 'REQ-20251115-222702-597', '1', NULL);


--
-- Name: uploaded_files_id_seq; Type: SEQUENCE SET; Schema: payment_flow; Owner: -
--

SELECT pg_catalog.setval('payment_flow.uploaded_files_id_seq', 17, true);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: worker_master; Type: TABLE DATA; Schema: payment_flow; Owner: -
--

INSERT INTO payment_flow.worker_master (id, worker_name_marathi, worker_name_english, witness_name_1, witness_name_2, toli_number, registration_number, pan_number, nationality, mother_name, mobile_number, mobile_number_1, marital_status, ifsc_code, branch_address, bank_name, age, address1, address2, account_number, aadhar_number, status, created_at, updated_at, board_id) VALUES (4, 'सुरेश पाटील', 'Suresh Patil', 'Mahesh Deshpande', 'Ganesh Sawant', 'TOLI-045', 'WRK-0001', 'AAAAA1111A', 'Indian', 'Lata Patil', '9876543210', '9123456780', 'Married', 'HDFC0001234', 'HDFC Bank Tower - Pune', 'HDFC Bank', 34, 'Plot 12', 'Karve Nagar', '123456789012', '123412341234', 'ACTIVE', '2025-01-15 10:30:00', '2025-11-16 21:28:06.900941', 'mockBoardId');
INSERT INTO payment_flow.worker_master (id, worker_name_marathi, worker_name_english, witness_name_1, witness_name_2, toli_number, registration_number, pan_number, nationality, mother_name, mobile_number, mobile_number_1, marital_status, ifsc_code, branch_address, bank_name, age, address1, address2, account_number, aadhar_number, status, created_at, updated_at, board_id) VALUES (5, 'विजया शेट्टी', 'Vijaya Shetty', 'Santosh Lokhande', 'Meera Joshi', 'TOLI-032', 'WRK-0002', 'BBBBB2222B', 'Indian', 'Asha Shetty', '9988776655', '9012345678', 'Single', 'SBIN0005678', 'SBI Nariman Point - Mumbai', 'State Bank of India', 29, 'Apartment 7', 'Marine Lines', '987654321098', '456745674567', 'ACTIVE', '2025-01-16 11:45:00', '2025-11-16 21:28:06.920059', 'mockBoardId');


--
-- Name: worker_master_id_seq; Type: SEQUENCE SET; Schema: payment_flow; Owner: -
--

SELECT pg_catalog.setval('payment_flow.worker_master_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: worker_payment_receipts; Type: TABLE DATA; Schema: payment_flow; Owner: -
--

INSERT INTO payment_flow.worker_payment_receipts (id, receipt_number, employer_id, toli_id, created_at, total_records, total_amount, status, board_id) VALUES (1, 'RCP-20251011-221244-522', 1, 1, '2025-10-11 16:42:44', 20, 4365.00, 'VALIDATED', '1');
INSERT INTO payment_flow.worker_payment_receipts (id, receipt_number, employer_id, toli_id, created_at, total_records, total_amount, status, board_id) VALUES (2, 'RCP-20251020-170816-158', 1, 1, '2025-10-20 11:38:17', 20, 4365.00, 'PAYMENT_INITIATED', '1');


--
-- Name: worker_payment_receipts_id_seq; Type: SEQUENCE SET; Schema: payment_flow; Owner: -
--

SELECT pg_catalog.setval('payment_flow.worker_payment_receipts_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: worker_payments; Type: TABLE DATA; Schema: payment_flow; Owner: -
--

INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (320, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (318, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (319, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (321, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '6', NULL, 'WRK-1A02C64241C0', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (322, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '6', NULL, 'WRK-F7266C4E7490', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (323, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '6', NULL, 'WRK-42ED93A5155E', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (324, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '6', NULL, 'WRK-3EC3BD463C1F', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (325, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '6', NULL, 'WRK-432C5C95341E', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (326, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '6', NULL, 'WRK-B1D516F9AFAB', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (327, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '6', NULL, 'WRK-06CF7CC7A515', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (328, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '6', NULL, 'WRK-A7BA18754811', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (329, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '6', NULL, 'WRK-E386F0E1507E', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (330, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '6', NULL, 'WRK-DC1B9EDFA688', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (331, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '6', NULL, 'WRK-99A639FB4B0F', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (332, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '6', NULL, 'WRK-E6F3ACC7DF79', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (333, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '6', NULL, 'WRK-54C65B326E1E', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (334, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '6', NULL, 'WRK-DD10EE3B66B5', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (335, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '6', NULL, 'WRK-0E5F188BC4DB', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (336, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '6', NULL, 'WRK-5E752AE6D3A2', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (337, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '6', NULL, 'WRK-71E8C0F41E79', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (2, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (3, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (4, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (5, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (6, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (7, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (8, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (9, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (10, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (11, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (12, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (13, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (14, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (15, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (16, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (17, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (18, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (19, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (20, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'VALIDATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (21, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (22, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (23, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (24, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (25, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (26, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (27, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (28, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (29, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (30, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (31, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (32, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (33, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (34, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (35, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (36, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (37, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (38, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (39, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (40, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (41, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (42, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (43, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (44, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (45, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (46, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (47, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (48, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (49, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (50, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (51, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (52, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (53, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (54, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (55, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (56, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (57, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (58, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (59, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (60, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (61, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (62, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (63, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (64, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (65, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (66, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (67, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (68, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (69, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (70, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (71, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (72, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (73, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (74, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (75, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (76, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (77, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (78, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (79, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (80, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (81, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (82, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (83, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (84, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (85, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (86, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (87, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (88, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (89, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (90, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (91, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (92, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (93, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (94, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (95, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (96, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (97, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (98, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (99, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (100, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (101, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (102, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (103, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (104, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (105, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (106, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (107, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (108, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (109, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (110, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (111, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (112, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (113, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (114, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (115, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (116, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (117, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (118, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (119, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (120, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (121, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (122, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (123, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (124, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (125, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (126, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (127, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (128, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (129, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (130, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (131, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (132, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (133, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (134, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (135, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (136, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (137, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (138, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (139, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (140, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (141, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (142, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (143, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (144, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (145, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (146, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (147, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (148, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (149, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (150, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (151, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (152, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (153, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (154, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (155, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (156, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (157, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (158, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (159, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (160, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (161, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (162, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (163, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (164, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (165, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (166, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (167, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (168, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (169, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (170, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (171, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (172, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (173, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (174, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (175, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (176, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (177, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (178, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (179, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (180, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (181, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (182, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (183, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (184, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (185, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (186, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (187, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (188, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (189, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (190, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (191, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (192, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (193, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (194, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (195, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (196, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (197, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (198, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (199, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (200, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (201, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (202, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (203, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (204, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (205, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (206, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (207, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (208, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (209, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (210, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (211, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (212, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (213, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (214, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (215, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (216, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (217, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (218, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (219, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (220, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (221, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (222, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (223, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (224, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (225, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (226, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (227, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (228, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (229, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (230, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (231, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (232, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (233, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (234, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (235, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (236, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (237, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (238, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (239, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (240, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (241, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (242, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (243, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (244, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (245, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (246, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (247, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (248, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (249, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (250, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (251, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (252, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (253, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (254, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (255, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (256, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (257, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (258, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (259, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (260, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (261, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (262, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (263, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (264, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (265, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (266, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (267, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (268, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (269, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (270, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (271, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (272, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (273, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (274, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (275, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (276, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (277, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (278, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (279, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (280, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (281, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (282, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '4', NULL, 'WRK-682FD41D7AB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (283, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '4', NULL, 'WRK-0B2EAC2AF134', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (284, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '4', NULL, 'WRK-28F403761430', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (285, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (286, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (287, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (288, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (289, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (290, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (291, 'W011', 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Production', '', '', '2345610987', 208.00, '4', NULL, 'WRK-DB5F464D4377', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (292, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (293, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (294, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (295, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (296, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (297, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (298, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (299, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (300, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (301, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (302, 'W002', 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Finance', '', '', '2345678901', 225.00, '4', NULL, 'WRK-62431B7D481E', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (303, 'W003', 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'IT', '', '', '3456789012', 224.00, '4', NULL, 'WRK-CB8ECD568EF1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (304, 'W004', 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Marketing', '', '', '4567890123', 210.00, '4', NULL, 'WRK-967E2B51EF17', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (305, 'W005', 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Operations', '', '', '5678901234', 256.00, '4', NULL, 'WRK-86D156B279AF', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (306, 'W006', 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Legal', '', '', '6789012345', 280.00, '4', NULL, 'WRK-EBB073D169E4', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (307, 'W007', 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Research', '', '', '7890123456', 304.00, '4', NULL, 'WRK-025E36ED9117', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (308, 'W008', 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'Admin', '', '', '8901234567', 143.00, '4', NULL, 'WRK-B1F7C4D837F6', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (309, 'W009', 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Editorial', '', '', '9012345678', 216.00, '4', NULL, 'WRK-0D62713CD7E7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (310, 'W010', 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Logistics', '', '', '1234509876', 168.00, '4', NULL, 'WRK-542BB997F2B1', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (311, 'W001', 'W001', 'John Doe', 'EMP123', 'TOLI456', 'HR', '', '', '1234567890', 200.00, '4', NULL, 'WRK-BAAF5EC5E92B', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (312, 'W012', 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Design', '', '', '3456721098', 217.50, '4', NULL, 'WRK-C50AE38AEDB7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (313, 'W013', 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Security', '', '', '4567832109', 184.00, '4', NULL, 'WRK-5A8637B991D7', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (314, 'W014', 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Sales', '', '', '5678943210', 126.00, '4', NULL, 'WRK-4267306F4782', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (315, 'W015', 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Support', '', '', '6789054321', 217.00, '4', NULL, 'WRK-88D60C532CED', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (316, 'W016', 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'QA', '', '', '7890165432', 272.00, '4', NULL, 'WRK-A968C116F83F', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (317, 'W017', 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Development', '', '', '8901276543', 270.00, '4', NULL, 'WRK-411DF067CE51', 'PAYMENT_INITIATED', 'RCP-20251011-221244-522', '2025-10-11 16:42:44', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (338, 'W018', 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'HR', '', '', '9012387654', 264.00, '6', NULL, 'WRK-A78AC85214E0', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (339, 'W019', 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Finance', '', '', '1234890765', 240.50, '6', NULL, 'WRK-02100AC92FFA', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');
INSERT INTO payment_flow.worker_payments (id, worker_reference, registration_id, worker_name, employer_id, toli_id, toli, aadhar, pan, bank_account, payment_amount, file_id, uploaded_file_ref, request_reference_number, status, receipt_number, created_at, board_id) VALUES (340, 'W020', 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Admin', '', '', '2345901876', 140.00, '6', NULL, 'WRK-E2531C4F6475', 'PAYMENT_INITIATED', 'RCP-20251020-170816-158', '2025-10-20 11:38:17', '1');


--
-- Name: worker_payments_id_seq; Type: SEQUENCE SET; Schema: payment_flow; Owner: -
--

SELECT pg_catalog.setval('payment_flow.worker_payments_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: worker_uploaded_data; Type: TABLE DATA; Schema: payment_flow; Owner: -
--

INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (22, '4', 17, 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Abstergo', 'Development', 'Lead', '2025-09-24', 7.50, 36.00, 270.00, '8901276543', '8210987654', 'jack.silver@example.com', '456 Cypress St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (42, '5', 17, 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Abstergo', 'Development', 'Lead', '2025-09-24', 7.50, 36.00, 270.00, '8901276543', '8210987654', 'jack.silver@example.com', '456 Cypress St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (62, '6', 17, 'W017', 'Jack Silver', 'EMP139', 'TOLI472', 'Abstergo', 'Development', 'Lead', '2025-09-24', 7.50, 36.00, 270.00, '8901276543', '8210987654', 'jack.silver@example.com', '456 Cypress St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (23, '4', 18, 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'Shinra', 'HR', 'Recruiter', '2025-09-23', 8.00, 33.00, 264.00, '9012387654', '9109876543', 'sophia.bronze@example.com', '321 Alder St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (37, '5', 12, 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Tyrell Corp', 'Design', 'Engineer', '2025-09-29', 7.50, 29.00, 217.50, '3456721098', '3765432109', 'emma.violet@example.com', '753 Chestnut St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (57, '6', 12, 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Tyrell Corp', 'Design', 'Engineer', '2025-09-29', 7.50, 29.00, 217.50, '3456721098', '3765432109', 'emma.violet@example.com', '753 Chestnut St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (18, '4', 13, 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Black Mesa', 'Security', 'Guard', '2025-09-28', 8.00, 23.00, 184.00, '4567832109', '4654321098', 'leo.orange@example.com', '159 Redwood St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (38, '5', 13, 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Black Mesa', 'Security', 'Guard', '2025-09-28', 8.00, 23.00, 184.00, '4567832109', '4654321098', 'leo.orange@example.com', '159 Redwood St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (58, '6', 13, 'W013', 'Leo Orange', 'EMP135', 'TOLI468', 'Black Mesa', 'Security', 'Guard', '2025-09-28', 8.00, 23.00, 184.00, '4567832109', '4654321098', 'leo.orange@example.com', '159 Redwood St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (19, '4', 14, 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Blue Sun', 'Sales', 'Associate', '2025-09-27', 6.00, 21.00, 126.00, '5678943210', '5543210987', 'mia.indigo@example.com', '357 Sequoia St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (39, '5', 14, 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Blue Sun', 'Sales', 'Associate', '2025-09-27', 6.00, 21.00, 126.00, '5678943210', '5543210987', 'mia.indigo@example.com', '357 Sequoia St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (59, '6', 14, 'W014', 'Mia Indigo', 'EMP136', 'TOLI469', 'Blue Sun', 'Sales', 'Associate', '2025-09-27', 6.00, 21.00, 126.00, '5678943210', '5543210987', 'mia.indigo@example.com', '357 Sequoia St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (20, '4', 15, 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Massive Dynamic', 'Support', 'Technician', '2025-09-26', 7.00, 31.00, 217.00, '6789054321', '6432109876', 'noah.pink@example.com', '951 Magnolia St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (10, '4', 5, 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Stark Industries', 'Operations', 'Supervisor', '2025-10-06', 8.00, 32.00, 256.00, '5678901234', '5432109876', 'tom.brown@example.com', '654 Cedar St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (30, '5', 5, 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Stark Industries', 'Operations', 'Supervisor', '2025-10-06', 8.00, 32.00, 256.00, '5678901234', '5432109876', 'tom.brown@example.com', '654 Cedar St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (50, '6', 5, 'W005', 'Tom Brown', 'EMP127', 'TOLI460', 'Stark Industries', 'Operations', 'Supervisor', '2025-10-06', 8.00, 32.00, 256.00, '5678901234', '5432109876', 'tom.brown@example.com', '654 Cedar St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (11, '4', 6, 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Wayne Enterprises', 'Legal', 'Advisor', '2025-10-05', 7.00, 40.00, 280.00, '6789012345', '4321098765', 'lisa.white@example.com', '987 Birch St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (31, '5', 6, 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Wayne Enterprises', 'Legal', 'Advisor', '2025-10-05', 7.00, 40.00, 280.00, '6789012345', '4321098765', 'lisa.white@example.com', '987 Birch St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (51, '6', 6, 'W006', 'Lisa White', 'EMP128', 'TOLI461', 'Wayne Enterprises', 'Legal', 'Advisor', '2025-10-05', 7.00, 40.00, 280.00, '6789012345', '4321098765', 'lisa.white@example.com', '987 Birch St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (12, '4', 7, 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Oscorp', 'Research', 'Scientist', '2025-10-04', 8.00, 38.00, 304.00, '7890123456', '3210987654', 'mark.green@example.com', '159 Spruce St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (32, '5', 7, 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Oscorp', 'Research', 'Scientist', '2025-10-04', 8.00, 38.00, 304.00, '7890123456', '3210987654', 'mark.green@example.com', '159 Spruce St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (52, '6', 7, 'W007', 'Mark Green', 'EMP129', 'TOLI462', 'Oscorp', 'Research', 'Scientist', '2025-10-04', 8.00, 38.00, 304.00, '7890123456', '3210987654', 'mark.green@example.com', '159 Spruce St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (6, '4', 1, 'W001', 'John Doe', 'EMP123', 'TOLI456', 'Acme Corp', 'HR', 'Manager', '2025-10-10', 8.00, 25.00, 200.00, '1234567890', '9876543210', 'john.doe@example.com', '123 Main St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (46, '6', 1, 'W001', 'John Doe', 'EMP123', 'TOLI456', 'Acme Corp', 'HR', 'Manager', '2025-10-10', 8.00, 25.00, 200.00, '1234567890', '9876543210', 'john.doe@example.com', '123 Main St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (13, '4', 8, 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'LexCorp', 'Admin', 'Assistant', '2025-10-03', 6.50, 22.00, 143.00, '8901234567', '2109876543', 'nina.black@example.com', '753 Willow St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (33, '5', 8, 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'LexCorp', 'Admin', 'Assistant', '2025-10-03', 6.50, 22.00, 143.00, '8901234567', '2109876543', 'nina.black@example.com', '753 Willow St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (53, '6', 8, 'W008', 'Nina Black', 'EMP130', 'TOLI463', 'LexCorp', 'Admin', 'Assistant', '2025-10-03', 6.50, 22.00, 143.00, '8901234567', '2109876543', 'nina.black@example.com', '753 Willow St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (14, '4', 9, 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Daily Planet', 'Editorial', 'Reporter', '2025-10-02', 8.00, 27.00, 216.00, '9012345678', '1098765432', 'sam.blue@example.com', '357 Maple St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (34, '5', 9, 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Daily Planet', 'Editorial', 'Reporter', '2025-10-02', 8.00, 27.00, 216.00, '9012345678', '1098765432', 'sam.blue@example.com', '357 Maple St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (54, '6', 9, 'W009', 'Sam Blue', 'EMP131', 'TOLI464', 'Daily Planet', 'Editorial', 'Reporter', '2025-10-02', 8.00, 27.00, 216.00, '9012345678', '1098765432', 'sam.blue@example.com', '357 Maple St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (15, '4', 10, 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Planet Express', 'Logistics', 'Driver', '2025-10-01', 7.00, 24.00, 168.00, '1234509876', '1987654321', 'olga.red@example.com', '951 Aspen St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (35, '5', 10, 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Planet Express', 'Logistics', 'Driver', '2025-10-01', 7.00, 24.00, 168.00, '1234509876', '1987654321', 'olga.red@example.com', '951 Aspen St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (55, '6', 10, 'W010', 'Olga Red', 'EMP132', 'TOLI465', 'Planet Express', 'Logistics', 'Driver', '2025-10-01', 7.00, 24.00, 168.00, '1234509876', '1987654321', 'olga.red@example.com', '951 Aspen St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (7, '4', 2, 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Globex Inc', 'Finance', 'Analyst', '2025-10-09', 7.50, 30.00, 225.00, '2345678901', '8765432109', 'jane.smith@example.com', '456 Elm St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (27, '5', 2, 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Globex Inc', 'Finance', 'Analyst', '2025-10-09', 7.50, 30.00, 225.00, '2345678901', '8765432109', 'jane.smith@example.com', '456 Elm St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (47, '6', 2, 'W002', 'Jane Smith', 'EMP124', 'TOLI457', 'Globex Inc', 'Finance', 'Analyst', '2025-10-09', 7.50, 30.00, 225.00, '2345678901', '8765432109', 'jane.smith@example.com', '456 Elm St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (8, '4', 3, 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'Initech', 'IT', 'Developer', '2025-10-08', 8.00, 28.00, 224.00, '3456789012', '7654321098', 'bob.lee@example.com', '789 Oak St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (28, '5', 3, 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'Initech', 'IT', 'Developer', '2025-10-08', 8.00, 28.00, 224.00, '3456789012', '7654321098', 'bob.lee@example.com', '789 Oak St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (48, '6', 3, 'W003', 'Bob Lee', 'EMP125', 'TOLI458', 'Initech', 'IT', 'Developer', '2025-10-08', 8.00, 28.00, 224.00, '3456789012', '7654321098', 'bob.lee@example.com', '789 Oak St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (9, '4', 4, 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Initrode', 'Marketing', 'Executive', '2025-10-07', 6.00, 35.00, 210.00, '4567890123', '6543210987', 'alice.kim@example.com', '321 Pine St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (29, '5', 4, 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Initrode', 'Marketing', 'Executive', '2025-10-07', 6.00, 35.00, 210.00, '4567890123', '6543210987', 'alice.kim@example.com', '321 Pine St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (49, '6', 4, 'W004', 'Alice Kim', 'EMP126', 'TOLI459', 'Initrode', 'Marketing', 'Executive', '2025-10-07', 6.00, 35.00, 210.00, '4567890123', '6543210987', 'alice.kim@example.com', '321 Pine St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (16, '4', 11, 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Wonka Industries', 'Production', 'Operator', '2025-09-30', 8.00, 26.00, 208.00, '2345610987', '2876543210', 'paul.gray@example.com', '852 Poplar St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (36, '5', 11, 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Wonka Industries', 'Production', 'Operator', '2025-09-30', 8.00, 26.00, 208.00, '2345610987', '2876543210', 'paul.gray@example.com', '852 Poplar St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (56, '6', 11, 'W011', 'Paul Gray', 'EMP133', 'TOLI466', 'Wonka Industries', 'Production', 'Operator', '2025-09-30', 8.00, 26.00, 208.00, '2345610987', '2876543210', 'paul.gray@example.com', '852 Poplar St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (17, '4', 12, 'W012', 'Emma Violet', 'EMP134', 'TOLI467', 'Tyrell Corp', 'Design', 'Engineer', '2025-09-29', 7.50, 29.00, 217.50, '3456721098', '3765432109', 'emma.violet@example.com', '753 Chestnut St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (40, '5', 15, 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Massive Dynamic', 'Support', 'Technician', '2025-09-26', 7.00, 31.00, 217.00, '6789054321', '6432109876', 'noah.pink@example.com', '951 Magnolia St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (60, '6', 15, 'W015', 'Noah Pink', 'EMP137', 'TOLI470', 'Massive Dynamic', 'Support', 'Technician', '2025-09-26', 7.00, 31.00, 217.00, '6789054321', '6432109876', 'noah.pink@example.com', '951 Magnolia St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (21, '4', 16, 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'Monarch Solutions', 'QA', 'Tester', '2025-09-25', 8.00, 34.00, 272.00, '7890165432', '7321098765', 'ava.gold@example.com', '654 Palm St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (41, '5', 16, 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'Monarch Solutions', 'QA', 'Tester', '2025-09-25', 8.00, 34.00, 272.00, '7890165432', '7321098765', 'ava.gold@example.com', '654 Palm St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (61, '6', 16, 'W016', 'Ava Gold', 'EMP138', 'TOLI471', 'Monarch Solutions', 'QA', 'Tester', '2025-09-25', 8.00, 34.00, 272.00, '7890165432', '7321098765', 'ava.gold@example.com', '654 Palm St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (1, '2', 1, NULL, NULL, 'DEFAULT_EMPLOYER', 'DEFAULT_TOLI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REJECTED', 'Worker ID is required. Worker name is required. Valid payment amount greater than 0 is required. Bank account is required. Work date is required.', '2025-10-11 10:03:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (2, '2', 2, NULL, NULL, 'DEFAULT_EMPLOYER', 'DEFAULT_TOLI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REJECTED', 'Worker ID is required. Worker name is required. Valid payment amount greater than 0 is required. Bank account is required. Work date is required.', '2025-10-11 10:03:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (3, '2', 3, NULL, NULL, 'DEFAULT_EMPLOYER', 'DEFAULT_TOLI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REJECTED', 'Worker ID is required. Worker name is required. Valid payment amount greater than 0 is required. Bank account is required. Work date is required.', '2025-10-11 10:03:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (4, '2', 4, NULL, NULL, 'DEFAULT_EMPLOYER', 'DEFAULT_TOLI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REJECTED', 'Worker ID is required. Worker name is required. Valid payment amount greater than 0 is required. Bank account is required. Work date is required.', '2025-10-11 10:03:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (5, '2', 5, NULL, NULL, 'DEFAULT_EMPLOYER', 'DEFAULT_TOLI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REJECTED', 'Worker ID is required. Worker name is required. Valid payment amount greater than 0 is required. Bank account is required. Work date is required.', '2025-10-11 10:03:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (26, '5', 1, 'W001', 'John Doe', 'EMP123', 'TOLI456', 'Acme Corp', 'HR', 'Manager', '2025-10-10', 8.00, 25.00, 200.00, '1234567890', '9876543210', 'john.doe@example.com', '123 Main St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (43, '5', 18, 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'Shinra', 'HR', 'Recruiter', '2025-09-23', 8.00, 33.00, 264.00, '9012387654', '9109876543', 'sophia.bronze@example.com', '321 Alder St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (63, '6', 18, 'W018', 'Sophia Bronze', 'EMP140', 'TOLI473', 'Shinra', 'HR', 'Recruiter', '2025-09-23', 8.00, 33.00, 264.00, '9012387654', '9109876543', 'sophia.bronze@example.com', '321 Alder St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (24, '4', 19, 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Tricorp', 'Finance', 'Accountant', '2025-09-22', 6.50, 37.00, 240.50, '1234890765', '1098765432', 'henry.copper@example.com', '753 Fir St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (44, '5', 19, 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Tricorp', 'Finance', 'Accountant', '2025-09-22', 6.50, 37.00, 240.50, '1234890765', '1098765432', 'henry.copper@example.com', '753 Fir St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (64, '6', 19, 'W019', 'Henry Copper', 'EMP141', 'TOLI474', 'Tricorp', 'Finance', 'Accountant', '2025-09-22', 6.50, 37.00, 240.50, '1234890765', '1098765432', 'henry.copper@example.com', '753 Fir St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (25, '4', 20, 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Future Tech', 'Admin', 'Clerk', '2025-09-21', 7.00, 20.00, 140.00, '2345901876', '2987654321', 'grace.jade@example.com', '852 Walnut St, City', 'REQUEST_GENERATED', NULL, '2025-10-11 14:18:23', '2025-10-11 16:42:30', '2025-10-11 16:42:44', 'RCP-20251011-221244-522', '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (45, '5', 20, 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Future Tech', 'Admin', 'Clerk', '2025-09-21', 7.00, 20.00, 140.00, '2345901876', '2987654321', 'grace.jade@example.com', '852 Walnut St, City', 'UPLOADED', NULL, '2025-10-16 08:48:48', NULL, NULL, NULL, '1');
INSERT INTO payment_flow.worker_uploaded_data (id, file_id, row_num, worker_id, worker_name, employer_id, toli_id, company_name, department, "position", work_date, hours_worked, hourly_rate, payment_amount, bank_account, phone_number, email, address, status, rejection_reason, created_at, validated_at, processed_at, receipt_number, board_id) VALUES (65, '6', 20, 'W020', 'Grace Jade', 'EMP142', 'TOLI475', 'Future Tech', 'Admin', 'Clerk', '2025-09-21', 7.00, 20.00, 140.00, '2345901876', '2987654321', 'grace.jade@example.com', '852 Walnut St, City', 'REQUEST_GENERATED', NULL, '2025-10-16 09:30:24', '2025-10-20 11:37:58', '2025-10-20 11:38:17', 'RCP-20251020-170816-158', '1');


--
-- Name: worker_uploaded_data_id_seq; Type: SEQUENCE SET; Schema: payment_flow; Owner: -
--

SELECT pg_catalog.setval('payment_flow.worker_uploaded_data_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: bank_account; Type: TABLE DATA; Schema: reconciliation; Owner: -
--



--
-- Name: bank_account_id_seq; Type: SEQUENCE SET; Schema: reconciliation; Owner: -
--

SELECT pg_catalog.setval('reconciliation.bank_account_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: entity_audit_event; Type: TABLE DATA; Schema: reconciliation; Owner: -
--



--
-- Name: entity_audit_event_id_seq; Type: SEQUENCE SET; Schema: reconciliation; Owner: -
--

SELECT pg_catalog.setval('reconciliation.entity_audit_event_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: file_processing_queue; Type: TABLE DATA; Schema: reconciliation; Owner: -
--



--
-- Name: file_processing_queue_id_seq; Type: SEQUENCE SET; Schema: reconciliation; Owner: -
--

SELECT pg_catalog.setval('reconciliation.file_processing_queue_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: import_error; Type: TABLE DATA; Schema: reconciliation; Owner: -
--



--
-- Name: import_error_id_seq; Type: SEQUENCE SET; Schema: reconciliation; Owner: -
--

SELECT pg_catalog.setval('reconciliation.import_error_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: import_run; Type: TABLE DATA; Schema: reconciliation; Owner: -
--

INSERT INTO reconciliation.import_run (id, filename, file_hash, file_size_bytes, received_at, status, error_message, board_id, employer_id) VALUES (1, 'test.mt940_b1a5e68e-3c05-4e66-9909-fc932f7865c0', 'c3430d43c4799f059a160eeba024bf9e8ce067f70a59a590bfe58f2af92859c4', 173, '2025-10-14 06:04:16', 'PARSED', NULL, '1', NULL);
INSERT INTO reconciliation.import_run (id, filename, file_hash, file_size_bytes, received_at, status, error_message, board_id, employer_id) VALUES (2, 'valid_sample.mt940_8c9c437f-f782-41d7-b254-79f02e0c88ad', 'a0ae1ba48a1fbafb88ab54421ff45e99a9b2568ff62075dab87e4cddab8d79c0', 199, '2025-10-14 06:08:00', 'PARSED', NULL, '1', NULL);
INSERT INTO reconciliation.import_run (id, filename, file_hash, file_size_bytes, received_at, status, error_message, board_id, employer_id) VALUES (4, 'test_sample2.mt940_c653d426-56ad-4420-85c5-2778c3cc7612', '17aeb36f9f843e91bf14e3e7a94a42a6d8af947a6df5234adb25ca6aa3b1707b', 204, '2025-10-14 06:18:13', 'PARSED', NULL, '1', NULL);
INSERT INTO reconciliation.import_run (id, filename, file_hash, file_size_bytes, received_at, status, error_message, board_id, employer_id) VALUES (5, 'valid_bank_sample.mt940_2d288e51-1ecd-4b84-a961-b694d2289071', '1f70b732728477d019eca15bdc098597d19e9c57bfb88a3acad7e9bc9959c8f1', 168, '2025-10-14 06:21:49', 'PARSED', NULL, '1', NULL);
INSERT INTO reconciliation.import_run (id, filename, file_hash, file_size_bytes, received_at, status, error_message, board_id, employer_id) VALUES (6, 'simple_account.mt940_fdfb4d69-9818-4e2e-82bc-b5ae39e41681', '5fbdd535c0350f7a0014377ad6c06cb31fdda1c2dd06998480ffdf8a7b8bb8e0', 163, '2025-10-14 06:24:07', 'PARSED', NULL, '1', NULL);
INSERT INTO reconciliation.import_run (id, filename, file_hash, file_size_bytes, received_at, status, error_message, board_id, employer_id) VALUES (7, 'proper_swift_envelope.mt940_d96f68af-b08f-4d14-8f18-502b2c78e143', 'da0f3e5bd66d609813196c88fb8ac0e657673a912011acbd77b4d1b46a2c2afa', 224, '2025-10-14 06:28:24', 'PARSED', NULL, '1', NULL);
INSERT INTO reconciliation.import_run (id, filename, file_hash, file_size_bytes, received_at, status, error_message, board_id, employer_id) VALUES (8, 'mt940_crlf_full_envelope.mt940_57e1a368-92d8-4c80-854f-73ab265bb5f7', '7c6033d36864c6e1f3d514c40ee4116a3c253c15682651f7354d8f365c02b6a1', 231, '2025-10-14 06:30:24', 'PARSED', NULL, '1', NULL);
INSERT INTO reconciliation.import_run (id, filename, file_hash, file_size_bytes, received_at, status, error_message, board_id, employer_id) VALUES (9, 'mt940_valid_sample.mt940_832acb2a-a4f1-443b-86b6-1a2c960639bf', '94f4676b2364ca755c707a750c43e92c69bb52fe41566aee9d02669bb6f15a3f', 233, '2025-10-14 06:33:09', 'PARSED', NULL, '1', NULL);
INSERT INTO reconciliation.import_run (id, filename, file_hash, file_size_bytes, received_at, status, error_message, board_id, employer_id) VALUES (10, 'mt940_valid_sample5.mt940_7214724a-8f46-4873-83a9-14d0f942aa4b', 'b45ca1aa5ec33110b47a90bf933d3cd1437c072a5bd32ea230357066f36edc4f', 233, '2025-10-14 06:35:17', 'PARSED', NULL, '1', NULL);
INSERT INTO reconciliation.import_run (id, filename, file_hash, file_size_bytes, received_at, status, error_message, board_id, employer_id) VALUES (11, 'mt940_valid_sample6.mt940_8e0fb450-7179-407f-b443-7505d0d0e5a5', '64598b532e6827327e9a76ddd461c56ccadf8e9d8f5619b2ae9f0d9bb946374a', 233, '2025-10-14 06:37:42', 'PARSED', NULL, '1', NULL);
INSERT INTO reconciliation.import_run (id, filename, file_hash, file_size_bytes, received_at, status, error_message, board_id, employer_id) VALUES (12, 'mt940_valid_balanced.mt940_f27bf853-4983-4f11-9b4a-f46c4e5d1040', '13136a2979a77b7d1d8da913fbba89561581209932ecefc84537a0ced634d21e', 214, '2025-10-14 06:38:59', 'PARSED', NULL, '1', NULL);
INSERT INTO reconciliation.import_run (id, filename, file_hash, file_size_bytes, received_at, status, error_message, board_id, employer_id) VALUES (13, 'mt940_valid_balanced.mt940_82bb6bc8-a3ff-4e06-a1e4-8249f8125edc', '0b318f93c4fb0521b2c855ad7958f6843592d2cd24f6727a09cf1fb8a4e61e31', 214, '2025-10-14 06:40:50', 'PARSED', NULL, '1', NULL);
INSERT INTO reconciliation.import_run (id, filename, file_hash, file_size_bytes, received_at, status, error_message, board_id, employer_id) VALUES (14, 'mt940_valid_balanced_sample.mt940_7e447b3f-2a75-4dad-b61c-a15cdb960096', 'bea73aabbfabd2747341b3652902afa25e75127a59e76f2920acdbec379faaef', 283, '2025-10-14 06:43:36', 'PARSED', NULL, '1', NULL);
INSERT INTO reconciliation.import_run (id, filename, file_hash, file_size_bytes, received_at, status, error_message, board_id, employer_id) VALUES (15, '1.mt940_3e84296a-8859-4508-91a9-d300ac3a45ed', '25c2a4098c835a25790687a99fd8b131103b87d89ab50f67ad7cb620297258ac', 301, '2025-10-14 06:50:25', 'PARSED', NULL, '1', NULL);


--
-- Name: import_run_id_seq; Type: SEQUENCE SET; Schema: reconciliation; Owner: -
--

SELECT pg_catalog.setval('reconciliation.import_run_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: raw_statement_line; Type: TABLE DATA; Schema: reconciliation; Owner: -
--



--
-- Name: raw_statement_line_id_seq; Type: SEQUENCE SET; Schema: reconciliation; Owner: -
--

SELECT pg_catalog.setval('reconciliation.raw_statement_line_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: statement_balance; Type: TABLE DATA; Schema: reconciliation; Owner: -
--

INSERT INTO reconciliation.statement_balance (id, statement_file_id, bal_type, dc, bal_date, currency, amount, board_id, employer_id) VALUES (1, 1, 'OPENING', 'C', '2025-10-14', 'EUR', 10000.00, '1', NULL);
INSERT INTO reconciliation.statement_balance (id, statement_file_id, bal_type, dc, bal_date, currency, amount, board_id, employer_id) VALUES (2, 1, 'CLOSING', 'C', '2025-10-14', 'EUR', 9400.00, '1', NULL);
INSERT INTO reconciliation.statement_balance (id, statement_file_id, bal_type, dc, bal_date, currency, amount, board_id, employer_id) VALUES (3, 2, 'OPENING', 'C', '2025-10-14', 'EUR', 10000.00, '1', NULL);
INSERT INTO reconciliation.statement_balance (id, statement_file_id, bal_type, dc, bal_date, currency, amount, board_id, employer_id) VALUES (4, 2, 'CLOSING', 'C', '2025-10-14', 'EUR', 10500.00, '1', NULL);
INSERT INTO reconciliation.statement_balance (id, statement_file_id, bal_type, dc, bal_date, currency, amount, board_id, employer_id) VALUES (5, 3, 'OPENING', 'C', '2025-10-14', 'EUR', 1000.00, '1', NULL);
INSERT INTO reconciliation.statement_balance (id, statement_file_id, bal_type, dc, bal_date, currency, amount, board_id, employer_id) VALUES (6, 3, 'CLOSING', 'C', '2025-10-14', 'EUR', 1150.00, '1', NULL);


--
-- Name: statement_balance_id_seq; Type: SEQUENCE SET; Schema: reconciliation; Owner: -
--

SELECT pg_catalog.setval('reconciliation.statement_balance_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: statement_file; Type: TABLE DATA; Schema: reconciliation; Owner: -
--

INSERT INTO reconciliation.statement_file (id, import_run_id, bank_account_id, stmt_ref_20, seq_28c, statement_date, opening_dc, opening_amount, closing_dc, closing_amount, currency, is_interim, created_at, board_id, employer_id) VALUES (1, 11, 1, 'STATEMENTREF1', '00002/001', '2025-10-14', 'C', 10000.00, 'C', 9400.00, 'EUR', false, '2025-10-14 06:37:43', '1', NULL);
INSERT INTO reconciliation.statement_file (id, import_run_id, bank_account_id, stmt_ref_20, seq_28c, statement_date, opening_dc, opening_amount, closing_dc, closing_amount, currency, is_interim, created_at, board_id, employer_id) VALUES (2, 12, 1, 'STATEMENTREF2', '00003/001', '2025-10-14', 'C', 10000.00, 'C', 10500.00, 'EUR', false, '2025-10-14 06:38:59', '1', NULL);
INSERT INTO reconciliation.statement_file (id, import_run_id, bank_account_id, stmt_ref_20, seq_28c, statement_date, opening_dc, opening_amount, closing_dc, closing_amount, currency, is_interim, created_at, board_id, employer_id) VALUES (3, 15, 2, 'STATEMENTREF4', '00001/001', '2025-10-14', 'C', 1000.00, 'C', 1150.00, 'EUR', false, '2025-10-14 06:50:25', '1', NULL);


--
-- Name: statement_file_id_seq; Type: SEQUENCE SET; Schema: reconciliation; Owner: -
--

SELECT pg_catalog.setval('reconciliation.statement_file_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: statement_transaction; Type: TABLE DATA; Schema: reconciliation; Owner: -
--

INSERT INTO reconciliation.statement_transaction (id, statement_file_id, line_no, value_date, entry_date, dc, amount, signed_amount, currency, txn_type_code, bank_reference, customer_reference, entry_reference, narrative, narrative_tokens, ext_idempotency_hash, created_at, board_id, employer_id) VALUES (1, 3, 1, '2025-10-14', NULL, 'C', 200.00, 200.00, 'EUR', 'N', 'TRF', 'NONREF', '1234567890', 'Transaction 1 description', NULL, '1c1d64b5a15088fa00e452793bd00bd0d7dabc3f7229e82e2a114296ea19fa4a', '2025-10-14 06:50:25', '1', NULL);
INSERT INTO reconciliation.statement_transaction (id, statement_file_id, line_no, value_date, entry_date, dc, amount, signed_amount, currency, txn_type_code, bank_reference, customer_reference, entry_reference, narrative, narrative_tokens, ext_idempotency_hash, created_at, board_id, employer_id) VALUES (2, 3, 2, '2025-10-14', NULL, 'D', 50.00, -50.00, 'EUR', 'N', 'TRF', 'NONREF', '1234567891', 'Transaction 2 description', NULL, '4cd52645ac55f66c682fc58ac3ed921529009353b618d52c9e788c8609366085', '2025-10-14 06:50:25', '1', NULL);


--
-- Name: statement_transaction_id_seq; Type: SEQUENCE SET; Schema: reconciliation; Owner: -
--

SELECT pg_catalog.setval('reconciliation.statement_transaction_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: transaction_86_segment; Type: TABLE DATA; Schema: reconciliation; Owner: -
--

INSERT INTO reconciliation.transaction_86_segment (id, statement_transaction_id, seg_key, seg_value, seg_seq) VALUES (1, 1, 'FULL', 'Transaction 1 description', 1);
INSERT INTO reconciliation.transaction_86_segment (id, statement_transaction_id, seg_key, seg_value, seg_seq) VALUES (2, 2, 'FULL', 'Transaction 2 description', 1);


--
-- Name: transaction_86_segment_id_seq; Type: SEQUENCE SET; Schema: reconciliation; Owner: -
--

SELECT pg_catalog.setval('reconciliation.transaction_86_segment_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: uploaded_files; Type: TABLE DATA; Schema: reconciliation; Owner: -
--

INSERT INTO reconciliation.uploaded_files (id, filename, stored_path, file_hash, file_type, created_at, uploaded_by, total_records, success_count, failure_count, status, file_reference_number) VALUES (2, 'Valid_Sample_Upload1.csv', '/Users/rahulcharvekar/Documents/Repos/ManpowerManagement/PaymentReconciliation/uploads/dev/workerpayments/a64b535a-def7-4db3-b852-02f56b29983b_Valid_Sample_Upload1.csv', '82e48550f89dd4fdcaf323e714ae6beb6fa49426ce33711ec05ec660168a7f2d', 'workerpayments', '2025-10-11 10:03:48', NULL, 5, 0, 5, 'COMPLETED', 'REQ-20251011-153348-283');
INSERT INTO reconciliation.uploaded_files (id, filename, stored_path, file_hash, file_type, created_at, uploaded_by, total_records, success_count, failure_count, status, file_reference_number) VALUES (3, 'valid_worker_uploaded_data.csv', '/Users/rahulcharvekar/Documents/Repos/ManpowerManagement/PaymentReconciliation/uploads/dev/workerpayments/20de390c-587a-4cd7-8ee6-d037b72651e4_valid_worker_uploaded_data.csv', 'dee3ef9b8473a77e1b9cd324ca7ca7f7e6f5d12faee5f611ca5eff0530866520', 'workerpayments', '2025-10-11 14:14:27', NULL, 0, 0, 0, 'COMPLETED', 'REQ-20251011-194426-500');
INSERT INTO reconciliation.uploaded_files (id, filename, stored_path, file_hash, file_type, created_at, uploaded_by, total_records, success_count, failure_count, status, file_reference_number) VALUES (4, 'valid_worker_uploaded_data1.csv', '/Users/rahulcharvekar/Documents/Repos/ManpowerManagement/PaymentReconciliation/uploads/dev/workerpayments/ca3a2932-ccfb-4cd9-bd87-c734ce2665aa_valid_worker_uploaded_data1.csv', '83031031b12bac4afbc3f94f14b6e2e717d076c242fc47cf56d8305f11e1f59f', 'workerpayments', '2025-10-11 14:18:23', NULL, 20, 20, 0, 'COMPLETED', 'REQ-20251011-194823-483');


--
-- Name: uploaded_files_id_seq; Type: SEQUENCE SET; Schema: reconciliation; Owner: -
--

SELECT pg_catalog.setval('reconciliation.uploaded_files_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: van_file; Type: TABLE DATA; Schema: reconciliation; Owner: -
--



--
-- Name: van_file_id_seq; Type: SEQUENCE SET; Schema: reconciliation; Owner: -
--

SELECT pg_catalog.setval('reconciliation.van_file_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: van_transaction; Type: TABLE DATA; Schema: reconciliation; Owner: -
--



--
-- Name: van_transaction_id_seq; Type: SEQUENCE SET; Schema: reconciliation; Owner: -
--

SELECT pg_catalog.setval('reconciliation.van_transaction_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


