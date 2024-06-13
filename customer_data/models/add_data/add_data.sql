SELECT
    column_name,
    data_type,
    character_maximum_length
FROM
    information_schema.columns
WHERE
    table_name = 'customer';

INSERT INTO
    customer (customer_id, first_name, last_name, email, phone)
SELECT
    trim(left(md5(i :: text), 10)),
    left(md5(random() :: text), 45),
    left(md5(random() :: text), 45),
    md5(random() :: text),
    left(md5(random() :: text), 20)
from
    generate_series(1, 100) s(i);

INSERT INTO
    account (
        balance,
        opening_date,
        closing_date,
        account_id,
        customer_id,
        account_type
    )
SELECT
    35.28,
    '2024-01-10',
    '2024-03-10',
    left(md5(random() :: text), 45),
    '98f1370821',
    'investment'
from
    generate_series(1, 2) s(i);

INSERT INTO
    account (
        balance,
        opening_date,
        closing_date,
        account_id,
        customer_id,
        account_type
    )
SELECT
    3315.28,
    '2023-01-10',
    '2024-03-10',
    left(md5(random() :: text), 15),
    '4e732ced34',
    'investment'
from
    generate_series(2, 5) s(i);

INSERT INTO
    account (
        balance,
        opening_date,
        closing_date,
        account_id,
        customer_id,
        account_type
    )
SELECT
    3210.28,
    '2023-01-10',
    '2024-03-10',
    left(md5(random() :: text), 15),
    '1c383cd30b',
    'savings'
from
    generate_series(2, 5) s(i);

INSERT INTO
    savings_account (interest_rate, account_id)
SELECT
    2.45,
    '66cd084ce4e5292'
from
    generate_series(1, 1) s(i);

INSERT INTO
    savings_account (interest_rate, account_id)
SELECT
    1.25,
    '6ba702e1c122b8a'
from
    generate_series(1, 1) s(i);

INSERT INTO
    savings_account (interest_rate, account_id)
SELECT
    5.45,
    '51d7223ce13e8e9'
from
    generate_series(1, 1) s(i);

INSERT INTO
    savings_account (interest_rate, account_id)
SELECT
    2.95,
    'a1f7fcea4746846'
from
    generate_series(1, 1) s(i);

INSERT INTO
    investment_account (
        sale_date,
        sale_amount,
        purchase_amount,
        purchase_date,
        current_market_value,
        instrument,
        account_id
    )
SELECT
    '2024-01-11',
    2000,
    1500,
    '2022-01-01',
    5500,
    'cash',
    '6b73c8129a3733b'
from
    generate_series(1, 1) s(i);

INSERT INTO
    investment_account (
        sale_date,
        sale_amount,
        purchase_amount,
        purchase_date,
        current_market_value,
        instrument,
        account_id
    )
SELECT
    '2023-01-11',
    3600,
    2200,
    '2022-01-01',
    2900,
    'card',
    '88f5f1f424dc388'
from
    generate_series(1, 1) s(i);

INSERT INTO
    investment_account (
        sale_date,
        sale_amount,
        purchase_amount,
        purchase_date,
        current_market_value,
        instrument,
        account_id
    )
SELECT
    '2022-12-11',
    6000,
    1475,
    '2022-01-01',
    4000,
    'cash',
    'e67e8c09d1723d6'
from
    generate_series(1, 1) s(i);

INSERT INTO
    investment_account (
        sale_date,
        sale_amount,
        purchase_amount,
        purchase_date,
        current_market_value,
        instrument,
        account_id
    )
SELECT
    '2023-04-17',
    2579,
    1100,
    '2022-01-01',
    9000,
    'card',
    'e88a907f515606c'
from
    generate_series(1, 1) s(i);