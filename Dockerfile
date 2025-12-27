FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04

COPY --from=ghcr.io/astral-sh/uv:0.5.11 /uv /uvx /bin/

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy
ENV PATH="/app/.venv/bin:$PATH"
ENV PYTHONPATH=/app
ENV UVICORN_CMD_ARGS="--no-server-header"

RUN apt-get update && apt-get install -y \
    python3.10 python3.10-dev python3-pip python3.10-venv \
    build-essential \
    libsndfile1 \
    ffmpeg \
    sox \
    libsox-dev \
    libsox-fmt-mp3 \
    cmake \
    curl \
    git \
    libgl1 \
    && ln -sf /usr/bin/python3.10 /usr/bin/python \
    && ln -sf /usr/bin/python3.10 /usr/bin/python3 \
    && rm -rf /var/lib/apt/lists/*