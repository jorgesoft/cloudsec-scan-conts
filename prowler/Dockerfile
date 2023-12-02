# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /usr/src/app

# Install AWS CLI and other dependencies
RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -f awscliv2.zip && \
    rm -rf ./aws

# Install Prowler
RUN pip install --no-cache-dir prowler

# Copy the prowler execution script into the container
COPY run_prowler.sh /usr/src/app

# Make the script executable
RUN chmod +x /usr/src/app/run_prowler.sh

# Run the script by default when the container launches
ENTRYPOINT ["/usr/src/app/run_prowler.sh"]
