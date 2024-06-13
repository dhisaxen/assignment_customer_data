-- models/seed_data.sql
insert into
    customers (
        customer_id,
        first_name,
        last_name,
        email,
        phone
    )
values
    (
        '123456789012',
        'John',
        'Doe',
        'john.doe@example.com',
        '123-456-7890'
    ),
    (
        '987654321098',
        'Jane',
        'Smith',
        'jane.smith@example.com',
        '098-765-4321'
    );

insert into
    accounts (
        account_id,
        customer_id,
        account_type,
        balance,
        opening_date
    )
values
    (
        '123456789012345',
        '123456789012',
        'savings',
        1500.0,
        '2020-01-01'
    ),
    (
        '543210987654321',
        '987654321098',
        'investment',
        5000.0,
        '2020-01-01'
    );

insert into
    savings_accounts (account_id, interest_rate)
values
    ('123456789012345', 1.5);

insert into
    investment_accounts (
        account_id,
        purchase_date,
        purchase_amount,
        instrument,
        current_market_value
    )
values
    (
        '543210987654321',
        '2020-01-01',
        5000.0,
        'Stock',
        5500.0
    );