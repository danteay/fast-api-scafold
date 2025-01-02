# FastAPI scafold project

This project is a scafold for a FastAPI project. It includes a basic structure for the project, a Dockerfile and a 
docker-compose file along with alembic configurations for database migrations using SQLAlchemy.

## Requirements

To run this project you need to have the following installed:

- [Docker Desktop](https://docs.docker.com/desktop/)
- [Nix for development environment (optional)](https://nixos.org/download/)
- [uv for python dependencies management](https://docs.astral.sh/uv/getting-started/installation/)
- [Python ^3.13](https://www.python.org/downloads/)
- openssl
- libpq-dev or postgresql if you are using MacOS
- gcc

## Development environment

You can install any requirement by itself and execute the project as any other python project. However, you can use the
provided nix file to create a development environment with all the requirements installed. To do so, run the following

```bash
nix develop
```

This will create a development environment with all the requirements installed. You can then run the project as any other
python project.

### Note

If you want to use the provided nix file, you need to have nix installed in your system. You can install nix by running 
the specified command in the [nix website](https://nixos.org/download/).

After installed you need to enable the flake feature by adding the following line to your `~/.config/nix/nix.conf` file:

```text
experimental-features = nix-command flakes
```

## Running the project

First make sure you have all the requirements installed. Then you can run the project by running the following command:

```bash
uv sync
```

This will install all the python dependencies. After that you can run the project by running the following command:

```bash
docker-compose up
```

This will start the project, and you can access it by going to `http://localhost:8000`. Also, this will create a 
postgres database instance to work with.

## Migrations

To create a migration you can run the following command:

```bash
uv run alembic revision --autogenerate -m "migration message"
```

This will create a new migration file in the `migrations/versions` folder. You can then apply the migration by running
the following command:

```bash
uv run alembic upgrade head
```

## Pre commit hooks

This project uses pre-commit hooks to check the code before committing. To install the pre-commit hooks run the following:

```bash
husky install
```
