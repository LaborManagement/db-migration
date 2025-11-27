SELECT
  wm.registration_number AS worker_regno,
  wm.worker_name_english AS employee_name,
  em.registration_number AS employer_reg_no,
  tm.registration_number AS toli_reg_no,
  '2025-01' AS year_month,
  1 AS day1, 1 AS day2, 1 AS day3, 1 AS day4, 1 AS day5, 1 AS day6, 1 AS day7,
  1 AS day8, 1 AS day9, 1 AS day10, 1 AS day11, 1 AS day12, 1 AS day13, 1 AS day14,
  1 AS day15, 1 AS day16, 1 AS day17, 1 AS day18, 1 AS day19, 1 AS day20, 1 AS day21,
  1 AS day22, 1 AS day23, 1 AS day24, 1 AS day25, 0 AS day26, 0 AS day27, 0 AS day28,
  0 AS day29, 0 AS day30, 0 AS day31,
  22 AS total_days,
  2200.00 AS amount,
  200.00 AS advance,
  2000.00 AS net_payable,
  'BANK_TRANSFER' AS payment_type,
  'TXN-202501-' || LPAD(wm.id::text, 3, '0') AS txn_ref
FROM payment_flow.worker_master wm
JOIN payment_flow.toli_master tm ON tm.toli_id = 1
JOIN payment_flow.employer_master em ON em.id = tm.employer_id
ORDER BY wm.id;