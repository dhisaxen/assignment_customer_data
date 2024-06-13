from pydantic import BaseModel
from datetime import date

from api.customer.schema.db import Customer, Account, SavingsAccount, InvestmentAccount


class CustomerResponse(BaseModel):
    customer_id: str
    first_name: str
    last_name: str
    email: str
    phone: str

    def __init__(self, customer: Customer):
        super().__init__(
            customer_id=customer.customer_id,
            first_name=customer.first_name,
            last_name=customer.last_name,
            email=customer.email,
            phone=customer.phone,
        )


class AccountResponse(BaseModel):
    account_id: str
    customer_id: str
    account_type: str
    balance: float
    opening_date: date
    closing_date: date

    def __init__(self, account: Account):
        super().__init__(
            balance=account.balance,
            opening_date=account.opening_date,
            closing_date=account.closing_date,
            account_id=account.account_id,
            customer_id=account.customer_id,
            account_type=account.account_type,
        )


class SavingsAccountResponse(AccountResponse):
    account_id: str
    interest_rate: float

    def __init__(self, sar: SavingsAccount):
        super.__init__(sar)
        self.account_id = sar.account_id
        self.interest_rate = sar.interest_rate


class InvestmentAccountResponse(AccountResponse):
    account_id: str
    purchase_date: date
    purchase_amount: float
    instrument: str
    current_market_value: float
    sale_date: date
    sale_amount: float

    def __init__(self, iar: InvestmentAccount):
        super.__init__(iar)
        self.account_id = iar.account_id
        self.purchase_amount = iar.purchase_amount
        self.purchase_date = iar.purchase_date
        self.instrument = iar.instrument
        self.current_market_value = iar.current_market_value
        self.sale_amount = iar.sale_amount
        self.sale_date = iar.sale_date
