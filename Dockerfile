FROM julia:1.6.4

WORKDIR /app
ADD / /app

# Start -> Install Miniconda Part 
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update
RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
# End -> Install Miniconda Part

# Start -> Install Your Python Deppendencies Part (Edit enviroments.yml)
RUN conda env create environment.yml
# End -> Install Your Python Deppendencies Part

# Start -> Install Julia [deps]
RUN julia ./src/start/config_project.jl
RUN rm ./src/start/config_project.jl
# End -> Install Julia [deps]
EXPOSE 3838

ENTRYPOINT [ "julia" ]
CMD [ "src/julia_docker_compose_template.jl"]