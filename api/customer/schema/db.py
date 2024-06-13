from sqlalchemy import Column, String, Date, ForeignKey, Float, CHAR
from sqlalchemy.orm import declarative_base
from sqlalchemy.orm import Mapped
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

Base = declarative_base()


def get_engine():
    url = URL.create(
        drivername="postgresql",
        username="seb",
        password="seb",
        host="postgres-db",
        database="seb",
        port=5432,
    )
    return create_engine(url)


def create_schema():
    Base.metadata.create_all(get_engine())


class Customer(Base):
    __tablename__ = "customer"

    customer_id: Mapped[str] = Column(CHAR(12), primary_key=True)
    first_name: Mapped[str] = Column(String(50))
    last_name: Mapped[str] = Column(String(50))
    email: Mapped[str] = Column(String(100))
    phone: Mapped[str] = Column(String(20))


class Account(Base):
    __tablename__ = "account"

    account_id = Column(CHAR(15), primary_key=True)
    customer_id = Column(CHAR(12), ForeignKey("customer.customer_id"))
    account_type = Column(String(50))
    balance = Column(Float)
    opening_date = Column(Date)
    closing_date = Column(Date, nullable=True)


class SavingsAccount(Account):
    __tablename__ = "savings_account"

    account_id = Column(CHAR(15), ForeignKey("account.account_id"), primary_key=True)
    interest_rate = Column(Float)


class InvestmentAccount(Account):
    __tablename__ = "investment_account"

    account_id = Column(CHAR(15), ForeignKey("account.account_id"), primary_key=True)
    purchase_date = Column(Date)
    purchase_amount = Column(Float)
    instrument = Column(String(50))
    current_market_value = Column(Float)
    sale_date = Column(Date, nullable=True)
    sale_amount = Column(Float, nullable=True)


create_schema()
