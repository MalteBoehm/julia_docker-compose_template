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
1. Docker pulls and creates a Container by using "Julia:latest" from Docker Hub.
2. based on which python-packages you put in your enviroment.yml a python enviroment gets created

## How to stop the docker?
To end the project, you have to run the following command in your favorite terminal:
    docker-compose down --remove-orphans

You don't have to remove the containers, because they will be removed automatically. Also the --remove-orphans option is useful if you want to remove all the containers, that exist after your build the same project multiple times. By having --remove-orphans you save your ram. 

## What you need to change before you start?
Download the package
Unpack the zip
Change the folder name to your project name.
enviroments.yml:
-> put your python packages in here
docker-compose.yml:
-> Change the port
-> "julia-docker" to a different docker image name if you want
-> change ports in the "ports" section
-> add whatever you need, like environment variables, volumes, etc.

## How to use it without Docker?
1. Install all requirements (Your Python version [Default 3.7] and packages)-> cmd in the same folder where the enviroment.yml is and "conda activate condaDockerEnvironment"
2. Run by cmd "julia src/main.jl"