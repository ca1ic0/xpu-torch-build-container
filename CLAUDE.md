# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains Docker configuration for building PyTorch with Intel XPU support. It sets up a development environment based on Intel's deep-learning-essentials image with a Python venv and PyTorch source code.

## Commands

### Build and run the container

```bash
# Start the builder container (clones PyTorch if not present, creates venv)
docker-compose up -d

# Attach to the running container
docker exec -it pytorch-xpu-builder bash

# Rebuild the image
docker-compose build --no-cache

# Stop and remove containers
docker-compose down
```

### Inside the container

```bash
# Activate the venv (already done in docker-compose command)
source /workspace/pytorch/.venv/bin/activate

# Build PyTorch with XPU support
python setup.py develop

# Run a single test
python -m pytest path/to/test.py::test_name
```

## Architecture

- **Dockerfile**: Base image `intel/deep-learning-essentials` with Python venv/pip setup
- **docker-compose.yml**: Orchestrates container lifecycle, mounts `./code/pytorch` from host, auto-clones PyTorch repo if not present, creates Python virtual environment
- **Code location**: PyTorch source is expected at `./pytorch` on the host (mounted to `/workspace/pytorch` in container)

The docker-compose command automatically:
1. Clones PyTorch from GitHub if `.git` directory doesn't exist
2. Initializes git submodules recursively
3. Creates a Python venv at `/workspace/pytorch/.venv`
4. Installs dev dependencies via `pip install --group dev`