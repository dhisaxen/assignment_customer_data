# insert_data.py
from sqlalchemy.orm import sessionmaker
from api.customer.schema.db import (
    Customer,
    Account,
    SavingsAccount,
    InvestmentAccount,
    get_engine,
)

SessionLocal = sessionmaker(bind=get_engine())
session = SessionLocal()

# Sample data
customers = [
    Customer(
        customer_id="123456789012",
        first_name="John",
        last_name="Doe",
        email="john.doe@example.com",
        phone="123-456-7890",
    ),
    Customer(
        customer_id="987654321098",
        first_name="Jane",
        last_name="Smith",
        email="jane.smith@example.com",
        phone="098-765-4321",
    ),
]

accounts = [
    Account(
        account_id="123456789012345",
        customer_id="123456789012",
        account_type="savings",
        balance=1500.0,
        opening_date="2020-01-01",
    ),
    Account(
        account_id="543210987654321",
        customer_id="987654321098",
        account_type="investment",
        balance=5000.0,
        opening_date="2020-01-01",
    ),
]

savings_accounts = [SavingsAccount(account_id="123456789012345", interest_rate=1.5)]

investment_accounts = [
    InvestmentAccount(
        account_id="543210987654321",
        purchase_date="2020-01-01",
        purchase_amount=5000.0,
        instrument="Stock",
        current_market_value=5500.0,
    )
]

# Insert data
session.add_all(customers)
session.add_all(accounts)
session.add_all(savings_accounts)
session.add_all(investment_accounts)
session.commit()
session.close()
