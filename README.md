# Ubuntu Apache, MariaDB, and SSH Docker Container

This repository provides a pre-configured Docker container that sets up a robust development or local testing environment for web applications. The container includes:

- **Apache HTTP Server (Apache 2)**
- **MariaDB** (MySQL)
- **Supervisor** to manage services
- **OpenSSH server** for secure remote access

## Prerequisites

Ensure you have Docker installed on your system. You can download and install it from [here](https://docs.docker.com/get-docker/).

## Overview of the Environment

### Apache HTTP Server (Apache 2)

The Apache web server is a powerful tool used to host websites. It comes pre-configured in this container, ready for serving static files or as the entry point to your application.

### MariaDB (MySQL)

MariaDB is an open-source relational database management system that offers a robust and efficient way to manage your data. This setup uses the official [Mariadb Docker image](https://hub.docker.com/_/mariadb).

### Supervisor

Supervisor ensures all services, including Apache and MariaDB, are started automatically when you run the container.

### OpenSSH Server

The SSH server allows for secure remote access to your environment via terminal commands or file transfers. It is configured without password-based authentication by default, enhancing security.

## How to Use This Docker Container

1. **Clone this Repository**

   First, clone this repository into a directory of your choice:

   ```bash
   git clone <repository-url>
   cd Ubuntu-apache-mariadb-ssh
   ```

2. **Build the Docker Image**

   Navigate to the project's root directory and build the Docker image with the provided Dockerfile:

   ```bash
   docker build -t my-apache-mariadb-image .
   ```

3. **Run the Docker Container**

   Run the container in detached mode with ports mapped for Apache, MariaDB, and SSH, and also mounting a volume for your web content:

   ```bash
   docker run -d \
     --name my-running-container \
     -p 80:80 -p 3306:3306 -p 22:22 \
     -v db:/var/lib/mysql \
     -v /path/to/your/html:/var/www/html \
     my-apache-mariadb-image
   ```

   - **`db:/var/lib/mysql`**: Mounts the MySQL data volume to persist your database. Replace `/db` with an appropriate path for your local environment.
   
   - **`/path/to/your/html:/var/www/html`**: Mounts a directory from your host system into the container, allowing you to place your web application files in this location.

## Configuration Details

### Apache Configuration

Apache runs using Supervisor and is configured to start with the `foreground` option. This ensures it operates in an unattended mode suitable for containers. You can configure additional settings by editing `supervisord.conf`.

### MariaDB Configuration

MariaDB uses standard Docker options, which include data persistence via volume mounting.

### SSH Configuration

SSH is configured without password-based authentication to enhance security. Ensure you have appropriate keys set up if using key-based access.

## Security Considerations

- **Avoid using root login**: The container disables the root user for SSH and removes password authentication.
  
- **Use a strong password or SSH keys**: Always use strong passwords or SSH keys when accessing your environment.

## Extending the Environment

You can extend this setup by adding more services, such as Node.js applications, Python frameworks, or even additional databases. Refer to the Docker documentation for best practices on extending containers.

## Conclusion

This repository provides a solid foundation for developing and testing web applications locally with Apache, MariaDB, and SSH access. Feel free to modify the configuration files or add more services to suit your needs.

For any questions or issues, feel free to reach out in the GitHub Issues section of this project.

---

Feel free to customize further based on specific requirements! If you have any additional setup steps or configurations, let me know so we can include them. 🚀

Happy coding and good luck with your projects! 😊