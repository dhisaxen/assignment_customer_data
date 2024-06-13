# FROM ghcr.io/dbt-labs/dbt-postgres:latest
FROM python:3.9-slim

WORKDIR /

COPY api api
COPY customer_data customer_data

COPY dbt_profiles.yaml profiles.yml
COPY dbt_project.yml .
RUN pip install --upgrade pip
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

ENV PYTHONPATH /
EXPOSE 8000
# RUN dbt debug --config-dir
# RUN dbt run
CMD ["fastapi", "dev", "/api/customer/customer.py","--host", "0.0.0.0", "--port", "80"]
