FROM python:3

ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Install MySQL client dependencies
RUN apt-get update && apt-get install -y default-libmysqlclient-dev build-essential

# Copy requirements first to leverage Docker cache
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the rest of the application
COPY . /app