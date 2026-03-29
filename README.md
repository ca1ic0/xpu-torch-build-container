# PyTorch XPU Builder

Docker environment for building PyTorch with Intel XPU support.

## Quick Start
1. Start the container (auto-clones PyTorch if not present)
```bash
docker-compose up -d
# or a more modern way
docker compose up -d 
```
After the compose, we could see the output of building
<img width="1823" height="1103" alt="image" src="https://github.com/user-attachments/assets/69f3910a-d9fd-41f6-8786-21ee6b3e7ba5" />
2. Attach to container
```bash
docker exec -it pytorch-xpu-builder bash
```
3. Inside container: activate venv and build

```bash
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
