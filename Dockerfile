#---------------------------[Stage - 1]---------------------------#

# Choose a base iages for the container
FROM python:3.9 AS base

# Set the working directory for the container
WORKDIR /app

# Install necessary packages for the system
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements files to the container
COPY requirements.txt . 


# install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt


#---------------------------[Stage - 2]---------------------------#

FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends libmariadb3 && \
    rm -rf /var/lib/apt/lists/*

 
# Copy dependencies from the base image
COPY --from=base /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/

# Copy all the application code
COPY . .

# run the application
CMD [ "python", "app.py" ]

