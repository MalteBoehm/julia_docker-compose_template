# Purpose of this Template
Use this template to create a new Julia project with Docker and Docker-Compose.


## Requirements
All you have to do is to install Docker and Docker-Compose:
    https://docs.docker.com/get-docker/
    https://docs.docker.com/compose/install/

## How to start?
To start the project, you have to run the following command in your favorite terminal:
    docker-compose up -d

### What happens when you start?
1. Docker pulls and creates a Container julia:1.7.0-alpine3.15 image from Docker Hub.
2. Docker creates a WORKDIR and moves your the current code into /app
3. Docker runs the package manager inside the Container and installs all the dependencies and precompiles them.
4. Docker uses the ENTRYPOINT and CMD to start your your code.

## How to end?
To end the project, you have to run the following command in your favorite terminal:
    docker-compose down --remove-orphans

You don't have to remove the containers, because they will be removed automatically. Also the --remove-orphans option is useful if you want to remove all the containers, that exist after your build the same project multiple times. By having --remove-orphans you save your ram. 

## What you need to change before you start?
Project.toml -> Change anything in here what you want.
docker-compose.yml:
-> Change the port
-> "julia-docker" to a different docker image name if you want
-> change ports in the "ports" section
-> add whatever you need, like environment variables, volumes, etc.