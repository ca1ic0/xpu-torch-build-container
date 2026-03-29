# PyTorch XPU Builder

Docker environment for building PyTorch with Intel XPU support.

## Quick Start

```bash
# Start the container (auto-clones PyTorch if not present)
docker-compose up -d

# Attach to container
docker exec -it pytorch-xpu-builder bash

# Inside container: activate venv and build
source /workspace/pytorch/.venv/bin/activate
python setup.py develop
```

## Directory Structure

- `pytorch/` - PyTorch source (cloned on first run if not present)
- `Dockerfile` - Container image definition
- `docker-compose.yml` - Container orchestration

## Requirements

- Docker
- docker-compose

## Test Environment

- OS: ArchLinux with `6.19.10-arch1-1` kernel
- GPU: BMG21 Arc B580
- CPU: Ryzen 5800X
