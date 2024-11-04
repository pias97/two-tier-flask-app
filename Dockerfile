# Choose a base iages for the container
FROM python:3.9-slim

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


# Copy all the application code
COPY . .

# run the application
CMD [ "python", "app.py" ]

