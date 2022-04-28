#!/bin/bash
export HOROVOD_CUDA_HOME=/usr/local/cuda/latest
export CUDA_HOME=/usr/local/cuda/latest
export HOROVOD_WITH_TENSORFLOW=1
export HOROVOD_WITHOUT_MXNET=1
export HOROVOD_WITHOUT_MPI=1
/bin/python3.8 -m pip install --no-cache-dir --user horovod[tensorflow]
