# Base image
FROM ubuntu:24.04

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-venv \
        python3-dev \
        build-essential \
        meson \
        ninja-build \
        git \
        pkg-config \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Make the venv default
ENV PATH="/opt/venv/bin:$PATH"

# Upgrade pip and install Python build dependencies
RUN pip install --upgrade pip && \
    pip install numpy scipy pandas ase meson-python cython setuptools wheel

# Set working directory (will be mounted at runtime)
WORKDIR /app

# Default command: drop into a shell
CMD ["/bin/bash"]
