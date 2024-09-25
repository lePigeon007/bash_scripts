#!/bin/bash

# Prints out system info for current system.
echo "System Info"
uname -a

echo ""
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
