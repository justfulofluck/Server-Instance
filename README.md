
# Server Instance (Ubuntu + Cockpit + Apache + PostgreSQL)

This project sets up a lightweight server environment using **Docker** and **Docker Compose**.

## Features
- Ubuntu 22.04 base image
- Cockpit web UI (port 9091)
- Apache HTTP server (port 8080)
- PostgreSQL (optional, port 5432)
- Static IP `172.25.0.10` and hostname `server-os`
- RAM capped at 2 GB

## Usage
```bash
docker compose up --build -d
```

- Cockpit → `http://localhost:9091` (login: `devuser/devpassword`)
- Apache → `http://localhost:8080`
- PostgreSQL → `psql -h localhost -U myuser -d mydb`

## ersistence
- Cockpit data → `./data:/var/lib/cockpit`
- PostgreSQL data → `pgdata:/var/lib/postgresql/data`

## Notes
- Networking (IP/hostname) defined in `docker-compose.yml`
- Resource limits set via `mem_limit: 2048m`
- For production, run Cockpit, Apache, and PostgreSQL in separate containers
```
