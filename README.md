# FastAPI scafold project

This project is a scafold for a FastAPI project. It includes a basic structure for the project, a Dockerfile and a 
docker-compose file along with alembic configurations for database migrations using SQLAlchemy.

## Requirements

To run this project you need to have the following installed:

- Docker Desktop
- Nix for development environment (optional)
- Poetry for python dependencies management
- Python >= 3.9
- openssl
- libpq-dev
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

If you are using the provided nix file, you need to have nix installed in your system. You can install nix by running the
following command:

```bash
curl -L https://nixos.org/nix/install | sh
```

After installed you need to enable the flake feature by adding the following line to your `~/.config/nix/nix.conf` file:

```text
experimental-features = nix-command flakes
```

## Running the project

First make sure you have all the requirements installed. Then you can run the project by running the following command:

```bash
poetry install --no-root
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
poetry run alembic revision --autogenerate -m "migration message"
```

This will create a new migration file in the `migrations/versions` folder. You can then apply the migration by running
the following command:

```bash
poetry run alembic upgrade head
```

## Project structure

The project structure is as follows:

```
.
├── Dockerfile
├── README.md
├── alembic.ini
├── docker-compose.yml
├── flake.lock
├── flake.nix
├── migrations
│   ├── README
│   ├── env.py
│   ├── script.py.mako
│   └── versions
├── poetry.lock
├── pyproject.toml
├── requirements.txt
├── scripts
│   └── build.sh
└── src
    ├── __init__.py
    ├── domain
    │   ├── __init__.py
    │   ├── repositories
    │   │   ├── __init__.py
    │   │   └── user.py
    │   └── services
    │       ├── __init__.py
    │       └── user.py
    ├── infra
    │   ├── __init__.py
    │   └── database.py
    ├── lib
    │   ├── __init__.py
    │   └── middlewares
    │       └── __init__.py
    ├── main.py
    ├── models
    │   ├── __init__.py
    │   ├── base.py
    │   └── user.py
    ├── providers
    │   ├── __init__.py
    │   ├── domain
    │   │   ├── __init__.py
    │   │   ├── repositories
    │   │   │   ├── __init__.py
    │   │   │   └── user.py
    │   │   └── services
    │   │       ├── __init__.py
    │   │       └── user.py
    │   └── infra
    │       ├── __init__.py
    │       └── database.py
    └── routes
        ├── __init__.py
        ├── handlers
        │   ├── __init__.py
        │   ├── user_create.py
        │   └── user_get.py
        └── routes.py
```
