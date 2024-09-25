#!/bin/bash

# Prints out system info for current system.
echo "NVIDIA Info"
nvidia-smi

echo ""
echo "Free memory"
free -h

echo ""
echo "CPU Info"
lscpu

echo ""
echo "Memory Block Info"
lsblk
exit 0
