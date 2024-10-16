#!/bin/bash

# Получаем загрузку GPU
gpu_load=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)

echo "GPU: $gpu_load%"
