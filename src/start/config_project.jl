using Pkg
ENV["PYTHON"] = "/root/miniconda3/envs/condy/bin/python3"
Pkg.activate(".")
Pkg.instantiate()
Pkg.build("PyCall")
Pkg.precompile()