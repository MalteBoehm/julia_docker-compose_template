FROM julia:latest

WORKDIR /root
ADD / /root

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
RUN julia src/init/init_packages.jl
RUN rm src/init/init_packages.jl
# End -> Install Julia [deps]
EXPOSE 3001
ENTRYPOINT [ "julia" ]
CMD [ "src/main.jl"]