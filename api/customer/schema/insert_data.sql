
INSERT INTO customer (customer_id, first_name, last_name, email, phone) SELECT trim(left(md5(i::text), 10)), left(md5(random()::text),45), left(md5(random()::text),45), md5(random()::text), left(md5(random()::text),20) from generate_series(1,100) s(i);

INSERT INTO account (balance, opening_date, closing_date, account_id, customer_id, account_type) SELECT 35.28, '2024-01-10', '2024-03-10', left(md5(random()::text),45), 'c74d97b01e', 'investment' from generate_series(1,2) s(i);

INSERT INTO account (balance, opening_date, closing_date, account_id, customer_id, account_type) SELECT 3315.28, '2023-01-10', '2024-03-10', left(md5(random()::text),15), '3c59dc048e', 'investment' from generate_series(2,5) s(i);

INSERT INTO account (balance, opening_date, closing_date, account_id, customer_id, account_type) SELECT 3210.28, '2023-01-10', '2024-03-10', left(md5(random()::text),15), '34173cb38f', 'savings' from generate_series(2,5) s(i);


INSERT INTO savings_account (interest_rate, account_id) SELECT 2.45, '9f74f217426d4b6'   from generate_series(1,1) s(i);

INSERT INTO savings_account (interest_rate, account_id) SELECT 1.25, '67a56249d9465d5'   from generate_series(1,1) s(i);

INSERT INTO savings_account (interest_rate, account_id) SELECT 5.45, '0b9a90ae64f5210'   from generate_series(1,1) s(i);

INSERT INTO savings_account (interest_rate, account_id) SELECT 2.95, 'd470df58d18ac02'   from generate_series(1,1) s(i);



INSERT INTO investment_account (sale_date, sale_amount, purchase_amount, purchase_date, current_market_value, instrument, account_id) SELECT '2024-01-11', 2000, 1500, '2022-01-01', 5500, 'cash', 'c3732289bc36150'  from generate_series(1,1) s(i);

INSERT INTO investment_account (sale_date, sale_amount, purchase_amount, purchase_date, current_market_value, instrument, account_id) SELECT '2023-01-11', 3600, 2200, '2022-01-01', 2900, 'card', '5765e0e96dcfe27'  from generate_series(1,1) s(i);

INSERT INTO investment_account (sale_date, sale_amount, purchase_amount, purchase_date, current_market_value, instrument, account_id) SELECT '2022-12-11', 6000, 1475, '2022-01-01', 4000, 'cash', '177d1a3115ddda7'  from generate_series(1,1) s(i);

INSERT INTO investment_account (sale_date, sale_amount, purchase_amount, purchase_date, current_market_value, instrument, account_id) SELECT '2023-04-17', 2579, 1100, '2022-01-01', 9000, 'card' , '2ba820273d2bb87'  from generate_series(1,1) s(i);