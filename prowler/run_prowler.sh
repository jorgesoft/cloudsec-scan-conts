#!/bin/bash

# Read the list of services from the environment variable
# If not provided, use a default list (e.g., 's3 ec2'), or leave it empty to scan all services
PROWLER_SERVICES=${PROWLER_SERVICES:-"s3 ec2"}

# Run Prowler with verbose output
prowler aws --services $PROWLER_SERVICES

# Specify your S3 bucket name and desired folder (if any)
BUCKET_NAME=${BUCKET_NAME:-"jorges-test"}
FOLDER_NAME="prowler-reports"

# Upload all files starting with "prowler-output-" to the S3 bucket
aws s3 cp /usr/src/app/output/ "s3://$BUCKET_NAME/$FOLDER_NAME/" --recursive --exclude "*" --include "prowler-output-*"

echo "Uploaded prowler output files to s3://$BUCKET_NAME/$FOLDER_NAME/"

tail -f /dev/null