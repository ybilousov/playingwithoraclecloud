# Nginx Proxy Manager with MariaDB

Docker Compose stack for Nginx Proxy Manager with MariaDB database.

## Local Development

### Setup

1. Copy `.env.example` to `.env`:
   ```bash
   cp .env.example .env
   ```

2. Edit `.env` with your configuration (passwords, ports, etc.)

3. Start the stack:
   ```bash
   docker compose up -d
   ```

4. Access the admin UI at `http://localhost:81` (or your configured `ADMIN_PORT`)

Default credentials after first login:
- Email: `admin@example.com`
- Password: `changeme`

### Environment Variables

All configuration is managed via `.env` file. Available variables:

- `NPM_IMAGE` - Nginx Proxy Manager image (default: `jc21/nginx-proxy-manager:latest`)
- `DB_IMAGE` - MariaDB image (default: `jc21/mariadb-aria:latest`)
- `HTTP_PORT` - External HTTP port (default: `80`)
- `HTTPS_PORT` - External HTTPS port (default: `443`)
- `ADMIN_PORT` - External admin UI port (default: `81`)
- `DB_MYSQL_HOST` - Database host (default: `db`)
- `DB_MYSQL_PORT` - Database port (default: `3306`)
- `DB_MYSQL_USER` - Database user (default: `npm`)
- `DB_MYSQL_PASSWORD` - Database password (default: `npm_password`)
- `DB_MYSQL_NAME` - Database name (default: `npm`)
- `MYSQL_ROOT_PASSWORD` - MySQL root password
- `MYSQL_DATABASE` - Initial database name
- `MYSQL_USER` - MySQL user
- `MYSQL_PASSWORD` - MySQL user password

## Portainer Deployment (from GitHub)

When deploying from GitHub via Portainer, **set environment variables through Portainer's Stack UI** instead of using a `.env` file:

1. In Portainer Stack settings, add these environment variables:
   ```
   NPM_IMAGE=jc21/nginx-proxy-manager:latest
   DB_IMAGE=jc21/mariadb-aria:latest
   HTTP_PORT=80
   HTTPS_PORT=443
   ADMIN_PORT=81
   DB_MYSQL_HOST=db
   DB_MYSQL_PORT=3306
   DB_MYSQL_USER=npm
   DB_MYSQL_PASSWORD=your_strong_password
   DB_MYSQL_NAME=npm
   MYSQL_ROOT_PASSWORD=your_strong_root_password
   MYSQL_DATABASE=npm
   MYSQL_USER=npm
   MYSQL_PASSWORD=your_strong_password
   ```

2. Deploy the stack

**Note:** The `.env` file is not committed to the repository (it's in `.gitignore`) for security reasons. Always set environment variables through Portainer's UI or provide them at runtime.

## Security Notes

- Change default passwords before production deployment
- Use strong passwords (minimum 16 characters)
- Keep the `.env` file secure and never commit it
- Consider using Portainer secrets for sensitive values

## Volumes

- `./data` - Nginx Proxy Manager data
- `./letsencrypt` - Let's Encrypt certificates
- `./mysql` - MariaDB data

## Ports

- `80` - HTTP traffic
- `443` - HTTPS traffic  
- `81` - Admin Web UI
