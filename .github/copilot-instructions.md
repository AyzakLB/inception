## Quick orientation

This repo builds a small multi-service Docker project under `srcs/` (services live in
`srcs/requirements/*`). The primary orchestration entrypoint is the Compose file at
`srcs/docker-compose.yml` and the convenience Makefile at the repo root.

Keep in mind: the project uses hand-written Dockerfiles per service that copy a `conf/`
and `tools/` folder into the image and run simple setup scripts during image build.

## Copilot instructions — quick, repository-specific

This repo builds a small multi-service Docker app under `srcs/`.

- Primary entrypoints: `srcs/docker-compose.yml` and the root `Makefile`.

  - `make all` -> `docker compose -f srcs/docker-compose.yml up -d --build`
  - `make down` -> `docker compose -f srcs/docker-compose.yml down`
  - `make clean` -> `docker system prune -af`

- Service layout pattern (used everywhere):

  - `srcs/requirements/<service>/Dockerfile` (Debian base, apt installs).
  - `srcs/requirements/<service>/conf/` (copied into image configs).
  - `srcs/requirements/<service>/tools/` (helper scripts executed at build time).

- Important examples:

  - `mariadb/tools/mariadb_init.sh` starts `mariadbd-safe`, waits for readiness, then
    creates DB/user from env vars `MARIADB_DATABASE`, `MARIADB_USER`, `MARIADB_PASSWORD`.
  - `nginx/tools/ssl_setup.sh` creates a self-signed cert for hard-coded domain `ayoub.42.fr`.

- Conventions & gotchas:

  - Init scripts run during image build and may start daemons; preserve start/wait/shutdown
    sequences (see `mariadb_init.sh`) to avoid leaving background processes.
  - Hard-coded values to watch: `DOMAIN` in `ssl_setup.sh` and `container_name: nginx` in compose.

- Integration: services use the `inception` bridge network; use container/service names as hosts
  (e.g. `mysql -h mariadb -u ...`). Persistent data is via named volumes (e.g. `nginx_data`).

- Debugging quick-list:
  - `docker logs <container>`
  - `docker exec -it <container> /bin/bash`
  - `docker volume ls` or `docker run --rm -v nginx_data:/data busybox ls /data`

Files to inspect first: `Makefile`, `srcs/docker-compose.yml`, each `srcs/requirements/*/Dockerfile`, and
the `tools/` and `conf/` directories under the service you plan to change.

No other AI-agent instruction files were found in the repo to merge (AGENT.md, AGENTS.md, etc.).

If you want I can add an `.env.example` with MARIADB\_\* and DOMAIN placeholders or expand this file into
a per-service map (ports, volumes, internal hosts).
create database/user using env vars `MARIADB_DATABASE`, `MARIADB_USER`, `MARIADB_PASSWORD`.
