--Drop table payment_flow.worker_uploaded_data if exists

DROP TABLE IF EXISTS payment_flow.worker_uploaded_data;

--we need to create worker_uploaded_data table from this data columns

CREATE TABLE payment_flow.worker_uploaded_data (id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
                                                                                file_id BIGINT, worker_id BIGINT, employee_name VARCHAR(255),
                                                                                                                                employer_reg_no VARCHAR(255),
                                                                                                                                                toli_reg_no VARCHAR(255),
                                                                                                                                                            month VARCHAR(50),
                                                                                                                                                                  day1 INT, day2 INT, day3 INT, day4 INT, day5 INT, day6 INT, day7 INT, day8 INT, day9 INT, day10 INT, day11 INT, day12 INT, day13 INT, day14 INT, day15 INT, day16 INT, day17 INT, day18 INT, day19 INT, day20 INT, day21 INT, day22 INT, day23 INT, day24 INT, day25 INT, day26 INT, day27 INT, day28 INT, day29 INT, day30 INT, day31 INT, total_days INT, amount DECIMAL(10, 2),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     advance DECIMAL(10, 2),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             net_payable DECIMAL(10, 2),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         payment_type VARCHAR(100),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      txn_ref VARCHAR(255),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              status VARCHAR(50),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     rejection_reason VARCHAR(500),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

--Drop table

DROP TABLE IF EXISTS payment_flow.worker_payments;

--create table to store payment information mentioned in worker_uploaded_data and attendance table as well

CREATE TABLE payment_flow.worker_payments(id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
                                                                          worker_id BIGINT, toli_id BIGINT, employer_id BIGINT, month VARCHAR(50),
                                                                                                                                      total_days INT, amount DECIMAL(10, 2),
                                                                                                                                                             advance DECIMAL(10, 2),
                                                                                                                                                                     net_payable DECIMAL(10, 2),
                                                                                                                                                                                 payment_type VARCHAR(100),
                                                                                                                                                                                              txn_ref VARCHAR(255));

--Drop table

DROP TABLE IF EXISTS payment_flow.attendance_data;

--create table to store attendance information mentioned in worker_uploaded_data

CREATE TABLE payment_flow.attendance_data (worker_id BIGINT, toli_id BIGINT, employer_id BIGINT, month VARCHAR(50),
                                                                                                       day1 INT, day2 INT, day3 INT, day4 INT, day5 INT, day6 INT, day7 INT, day8 INT, day9 INT, day10 INT, day11 INT, day12 INT, day13 INT, day14 INT, day15 INT, day16 INT, day17 INT, day18 INT, day19 INT, day20 INT, day21 INT, day22 INT, day23 INT, day24 INT, day25 INT, day26 INT, day27 INT, day28 INT, day29 INT, day30 INT, day31 INT, total_days INT);