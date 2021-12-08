FROM julia:1.7.0-alpine3.15

WORKDIR /app
ADD / /app
RUN julia -e 'using Pkg; Pkg.instantiate(); Pkg.precompile();'

ENTRYPOINT [ "julia" ]
CMD [ "src/docker_runs_checker.jl"]