#!/bin/sh

# Display the container's IP addresses
echo "Container's IP Addresses:"
ip -4 addr show scope global | awk '/inet/ {print $2}' | cut -d/ -f1

# IP range to scan
IP_RANGE="10.0.1.0/24"

# Directory to store the reports
REPORT_DIR="/reports"
mkdir -p $REPORT_DIR

# Timestamp for the report files
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")

# Running a quick nmap scan on the specified IP range and saving the reports
echo "Performing a quick scan on the network: $IP_RANGE"
nmap -T4 -F --webxml -oA $REPORT_DIR/scan_$TIMESTAMP $IP_RANGE
#nmap -T4 -F $IP_RANGE

# Creating html report from xml file
xsltproc -o $REPORT_DIR/scan_$TIMESTAMP.html /usr/share/nmap/nmap.xsl $REPORT_DIR/scan_$TIMESTAMP.xml


# Rename the webxml file to HTML
#mv $REPORT_DIR/scan_$TIMESTAMP.webxml $REPORT_DIR/scan_$TIMESTAMP.html

echo "Scan complete. Reports are stored in $REPORT_DIR"

# S3 Bucket details
BUCKET_NAME="jorges-test"
FOLDER_NAME="scanning-results"

# Upload the scan reports to the S3 bucket
aws s3 cp $REPORT_DIR/scan_$TIMESTAMP.html s3://$BUCKET_NAME/$FOLDER_NAME/scan_$TIMESTAMP.html
aws s3 cp $REPORT_DIR/scan_$TIMESTAMP.xml s3://$BUCKET_NAME/$FOLDER_NAME/scan_$TIMESTAMP.xml

echo "Reports uploaded to S3 bucket: $BUCKET_NAME/$FOLDER_NAME"

sleep infinity
