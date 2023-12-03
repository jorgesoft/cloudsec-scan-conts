#!/bin/bash
# Start SSH service
service ssh start

# Set the SSH password from environment variable
echo "root:${SSH_PASSWD:-defaultpassword}" | chpasswd

# Print the public IP address of the container
echo "Fetching public IP..."
curl -s http://checkip.amazonaws.com

# Start SSH service
/usr/sbin/sshd -D
echo "SSH service running  "

# Keep the container running
tail -f /dev/null