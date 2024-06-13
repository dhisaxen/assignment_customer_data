# Customer Data - Assignment
This project involves setting up a FastAPI application with a PostgreSQL database using Docker Compose, with dbt managing the database schema and initial data insertion. The Dockerfile installs necessary dependencies and configures dbt to run before starting the FastAPI server. The docker-compose.yml ensures both the PostgreSQL and FastAPI containers run on the same network.

## Build and Deploy (Docker)
* Ensure that you have `docker` and `docker-compose` installed in your local environment
* Execute the following command to build the image for the API layer

   ``` docker -l debug build -t sample_seb_1 . ```

* Execute the following command to run the project in your local environment

  ``` docker compose up ```

* Check the application is up and running at http://localhost:8000/
* Do a healthcheck for API at http://localhost:8000/healthcheck
* Check the API docs at http://localhost:8000/docs
* Fetch a list of all the customers http://localhost:8000/customers
* Fetch the list of accounts for a given customer http://localhost:8000/customers/123456789012/accounts 

## Kubernetes Deployment
* Tag the local image

   ```docker tag sample_seb_1:latest dsexplorer/customer_data_api:latest```

* Push the docker image to Docker Hub

   ```docker push dsexplorer/customer_data_api:latest```

* Setup the k8s
   ```kubectl apply -f k8s/namespace.yml```
   ```kubectl apply -f k8s/postgres-deployment.yml```
   ```kubectl apply -f k8s/postgres-service.yml```
   ```kubectl apply -f k8s/deployment.yml```
   ```kubectl apply -f k8s/customer-data-service.yml```

With the above configuration you should be able to deploy the services same as in case of docker compose. These deployment steps need a bit improvement on the port mapping as the postgres DB si although working the services are not running that allow the 5432 port to be visible. This can be done as a fix.

## Manually adding the data for performance and average interest rate calculation
You can manually execute the script available at api/customer/schema/insert_data.sql. The only modifications we need to make is with respect to the key columns such that the account table has the key ids from customer table, savings and investment accounts have the account id from the accounts table.

## DBT
In this project we tried implementing the schema creation and data ingestion via dbt, however, this did not work with the dockerized dbt images. We still keep the structure as a future improvement.

## API Documentation
The APIs have been documented under the `/docs` path of the service.