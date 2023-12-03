# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Install SSH server and curl
RUN apt-get update && \
    apt-get install -y openssh-server curl sudo && \
    mkdir /var/run/sshd


# Configure SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/ssh/sshd_config

EXPOSE 22

# Install Pacu
RUN pip install pacu

# Copy the start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
