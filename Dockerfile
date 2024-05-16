# Base Image
FROM debian:stable

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    vim

# Initial App Configuration
RUN echo "root:password123" > /root/passwords.txt && \
    echo "-----BEGIN CERTIFICATE-----\nMIIC+TCCAeGgAwIBAgIJAO1....." > /root/certificate.pem && \
    echo "config_setting=admin" > /root/config.conf

# Copy application code
COPY . /app

# Run as root user
USER root

# Set the working directory
WORKDIR /app

# Start the application
CMD ["python", "main.py"]
