using Pkg
ENV["PYTHON"] = "/root/miniconda3/envs/condy/bin/python3"
#Pkg.add("anotherPackageHere")
Pkg.add("PyCall")
Pkg.build("PyCall")
Pkg.instantiate()
Pkg.precompile()