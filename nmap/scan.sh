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
#nmap -T4 -F --webxml -oA $REPORT_DIR/scan_$TIMESTAMP $IP_RANGE
nmap -T4 -F $IP_RANGE

# Rename the webxml file to HTML
#mv $REPORT_DIR/scan_$TIMESTAMP.webxml $REPORT_DIR/scan_$TIMESTAMP.html

echo "Scan complete. Reports are stored in $REPORT_DIR"
sleep infinity
