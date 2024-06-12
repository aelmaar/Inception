<img src="https://github.com/aelmaar/GIFS/blob/master/Inception.png"/> <br />
## Description 
Inception is a project from the 42 curriculum focused on system administration and Docker. 
The goal is to create and manage Docker images for a WordPress site, MariaDB database, and NGINX web server, and bind them using Docker Compose.

## Project structure
The project consists of three Docker images:
- **WordPress**: A content management system (CMS) that allows you to create and manage websites.
- **MariaDB**: An open-source relational database management system.
- **NGINX**: A web server used as a reverse proxy, load balancer, and HTTP cache.

Each service is defined in a Dockerfile, and Docker Compose is used to orchestrate the containers.

## Setup

### Docker Installation
Follow the official Docker installation guide for your operating system:

- [Docker Installation Guide](https://docs.docker.com/engine/install/)

### Environment Setup and Running Services
1. Clone the repository to your local machine:
    ```sh
    git clone https://github.com/aelmaar/Inception.git
    cd Inception
    ```
2. Run the following command:
    ```sh
    make
    ```
    This `make` command will:
    - Set up the environment variables.
    - Create the .env file.
    - Build the Docker images using Docker Compose.
    - Run the containers using Docker Compose.

> [!NOTE]
> Make sure the `DOMAIN_NAME` environment variable doesn't start with `http` or `https` (e.g., `ael-maar.42.fr`). Also, add it to your local DNS server to resolve it to the IP address of your choice, such as localhost (e.g., `127.0.0.1 DOMAIN_NAME`). On UNIX systems like macOS, this is typically configured in `/etc/hosts`.

## Project Diagram:
<img src="https://github.com/aelmaar/GIFS/blob/master/Screenshot%202024-06-12%20at%2000.59.31.png" /> <be />
