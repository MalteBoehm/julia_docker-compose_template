FROM julia:1.7.0-alpine3.15

WORKDIR /app
ADD / /app

RUN apk add linux-headers
# Update & Install dependencies
RUN apk add --no-cache --update \
    git \
    bash \
    libffi-dev \
    openssl-dev \
    bzip2-dev \
    zlib-dev \
    readline-dev \
    sqlite-dev \
    build-base

# Set Python version
ARG PYTHON_VERSION='3.7.2'
# Set pyenv home
ARG PYENV_HOME=/root/.pyenv

# Install pyenv, then install python versions
RUN git clone --depth 1 https://github.com/pyenv/pyenv.git $PYENV_HOME && \
    rm -rfv $PYENV_HOME/.git

ENV PATH $PYENV_HOME/shims:$PYENV_HOME/bin:$PATH

RUN pyenv install $PYTHON_VERSION
RUN pyenv global $PYTHON_VERSION
RUN julia -e 'ENV["PYTHON"]= "/root/.pyenv/versions/3.7.2/bin"'
#/root/.pyenv/versions/3.7.2/libexec
RUN pip install --upgrade pip && pyenv rehash

# Clean
RUN rm -rf ~/.cache/pip

RUN apk --update add libxml2-dev libxslt-dev libffi-dev gcc musl-dev libgcc openssl-dev curl
RUN apk add jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev

RUN pip install -r requirements.txt
RUN julia -e 'using Pkg; Pkg.add("PyCall"); Pkg.build("PyCall"); Pkg.instantiate(); Pkg.precompile();'


ENTRYPOINT [ "julia" ]
CMD [ "src/docker_runs_checker.jl"]