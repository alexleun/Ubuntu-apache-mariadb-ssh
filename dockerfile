# Dockerfile
FROM ubuntu:latest

# Install Apache, MariaDB, and Supervisor
RUN apt-get update && \
    apt-get install -y apache2 php mariadb-server supervisor openssh-server nano

# SSH Configuration
# Create SSH directory
RUN mkdir /var/run/sshd

# Set PermitRootLogin to prohibit (or restrict to key-based login if absolutely necessary)
#RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
# Alternatively, for key-based root login:
#RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config


# Copy authorized_keys (if using key-based authentication - HIGHLY RECOMMENDED)
# COPY authorized_keys /root/.ssh/authorized_keys


# Copy supervisor configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose ports 80 (Apache) and 3306 (MariaDB)
EXPOSE 80 3306 22

# Start supervisord when the container starts
CMD ["/usr/bin/supervisord"]