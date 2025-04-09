#!/bin/bash
set -e

# Remove bash history
unset HISTFILE
rm -f /root/.bash_history
rm -f /home/ec2-user/.bash_history

# Clean package cache
sudo yum clean all

# Clear logs
sudo find /var/log -type f -exec truncate -s 0 {} \;

# Zero out the free space (optional but helps reduce AMI size)
sudo dd if=/dev/zero of=/EMPTY bs=1M || true
sudo rm -f /EMPTY
