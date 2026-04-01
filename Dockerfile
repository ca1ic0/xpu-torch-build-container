FROM intel/deep-learning-essentials

# Set non-interactive frontend
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt update && apt upgrade -y && \
    apt install -y --no-install-recommends \
    python3-venv \
    python3-pip \
    ninja-build \
    libze-intel-gpu1 libze1 intel-metrics-discovery intel-opencl-icd clinfo intel-gsc \
    intel-media-va-driver-non-free libmfx-gen1 libvpl2 libvpl-tools libva-glx2 va-driver-all vainfo \
    libze-dev intel-ocloc \
    libze-intel-gpu-raytracing \
    python3-dev build-essential cmake git curl libopenblas-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Install dev dependencies
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install mkl-static mkl-include

ENV PATH="/opt/venv/bin:${PATH}"
ENV VIRTUAL_ENV="/opt/venv"

# Create pytorch directory and venv (will be mounted from host)
# RUN mkdir -p /workspace/pytorch

ENV PYTHONUNBUFFERED=1

CMD ["/bin/bash"]
