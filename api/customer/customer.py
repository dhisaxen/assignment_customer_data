from fastapi import FastAPI, Response
from api.customer.model.model import CustomerResponse, AccountResponse
from api.customer.schema.db import (
    Customer,
    Account,
    SavingsAccount,
    InvestmentAccount,
    get_engine,
)
from sqlalchemy.sql import func
from sqlalchemy.orm import sessionmaker
from typing import List

app = FastAPI()
Session = sessionmaker(bind=get_engine())
session = Session()


def update_response_no_data(response: Response):
    response.status_code = 404


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/healthcheck")
async def healthcheck():
    return {"status": "OK"}


@app.get("/customers")
def get_customers():
    response: List[CustomerResponse] = []
    for customer in session.query(Customer).all():
        response.append(CustomerResponse(customer))
    return response


@app.get("/customer/{customer_id}")
def get_customers(customer_id: str, response: Response):
    response_data: List[CustomerResponse] = []
    customers = session.query(Customer).filter(Customer.customer_id == customer_id)
    if customers:
        for customer in customers:
            response_data.append(CustomerResponse(customer))
    else:
        update_response_no_data(response)
    if len(response_data) == 0:
        update_response_no_data(response)
        return {"status": "Customer not found"}
    return response_data


@app.get("/customers/{customer_id}/accounts")
def get_accounts(customer_id: str):
    response_data: List[AccountResponse] = []
    accounts = (
        session.query(Account)
        .join(Customer)
        .filter(Customer.customer_id == customer_id)
    )
    for account in accounts:
        response_data.append(account)
    return response_data


@app.get("/accounts/savings/average-interest-rate")
def get_average_interest_rate():
    avg_rate = session.query(func.avg(SavingsAccount.interest_rate)).scalar()
    return {"average_interest_rate": avg_rate}


@app.get("/accounts/investment/performance")
def get_investment_performance():
    investments = session.query(InvestmentAccount).all()
    performance_list = [
        {
            "account_id": inv.account_id,
            "performance": (inv.current_market_value - inv.purchase_amount)
            / inv.purchase_amount
            * 100,
        }
        for inv in investments
    ]
    return performance_list
