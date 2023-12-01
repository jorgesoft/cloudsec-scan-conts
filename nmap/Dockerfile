# Use Alpine Linux for its small size
FROM alpine:latest

# Update the package repository and install nmap and libxslt (for xsltproc)
RUN apk update && \
    apk add --no-cache nmap libxslt

# Copy the scanning script into the container
COPY scan.sh /scan.sh

# Make the script executable
RUN chmod +x /scan.sh

# Set the entrypoint to the script
ENTRYPOINT ["/scan.sh"]
