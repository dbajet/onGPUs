FROM nvidia/cuda:11.8.0-devel-ubuntu22.04
FROM python:3.10
# Install some basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    vim \
    build-essential \
    screen \
 && rm -rf /var/lib/apt/lists/*
# Install necessary python packages you need
RUN python -m pip install --upgrade pip
RUN python -m pip install numba

WORKDIR /application/gpus/
COPY test_gpu.py /application/gpus/

CMD ["bash"]
# docker build -t ongpus .
# docker run --gpus all -it --rm --name ongpus ongpus:latest
# docker exec -it ongpus bash
