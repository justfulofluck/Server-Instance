  GNU nano 7.2                       Dockerfile
# Use Ubuntu base image
FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get install -y systemd systemd-sysv cockpit && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a developer user with sudo privileges
RUN useradd -m -s /bin/bash devuser && \
    echo "devuser:devpassword" | chpasswd && \
    usermod -aG sudo devuser

# Expose Cockpit port
EXPOSE 9090
