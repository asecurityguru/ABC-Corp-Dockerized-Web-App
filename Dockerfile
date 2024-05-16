# Use an outdated base image
FROM debian:stable

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    vim

# Copy application code
COPY . /app

# Run as root user
USER root

# Set the working directory
WORKDIR /app

# Start the application
CMD ["python", "main.py"]
