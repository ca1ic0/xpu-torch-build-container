#!/bin/bash
set -euo pipefail

# 强制所有后续命令输出不被缓冲（对 Python/pip 尤其重要）
export PYTHONUNBUFFERED=1

echo '=== Starting PyTorch XPU Build ===' >&2

echo '=== Intel GPU Info ===' >&2
# timeout 10s clinfo | grep 'Device Name' || echo 'No GPU detected' >&2
echo '========================' >&2

if [ ! -d '.git' ]; then
    echo 'Cloning PyTorch...' >&2
    git clone https://github.com/pytorch/pytorch .
    git submodule sync
    git submodule update --init --recursive
fi

# apt install  python3-dev build-essential cmake git curl libopenblas-dev

source /opt/venv/bin/activate

env

echo "VIRTUAL_ENV=${VIRTUAL_ENV:-not set}" >&2
echo "CMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH:-not set}" >&2

echo "Installing build requirements..." >&2
pip install -i https://mirrors.ustc.edu.cn/pypi/simple -r  requirements-build.txt

echo "Building PyTorch in editable mode..." >&2
python -m pip install --no-build-isolation -v -e .

echo '✅ Build complete! Entering interactive shell for debugging...' >&2
echo 'Note: Commands you type here will NOT appear in "docker logs".' >&2

# 启动交互 shell，但保持 stdout/stderr 连接到 Docker 日志
exec bash
