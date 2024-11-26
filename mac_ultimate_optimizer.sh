#!/bin/bash

echo "Starting macOS optimization script..."

# -------------------------------------
# Network Optimizations
# -------------------------------------
echo "Applying network optimizations..."
sudo sysctl -w net.inet.tcp.recvspace=65536
sudo sysctl -w net.inet.tcp.sendspace=65536
sudo sysctl -w net.inet.tcp.autorcvbufmax=4194304
sudo sysctl -w net.inet.tcp.autosndbufmax=4194304
sudo sysctl -w net.inet.tcp.sack=1
sudo sysctl -w net.inet.tcp.fastopen=1
sudo sysctl -w net.inet.tcp.always_keepalive=1
sudo sysctl -w net.inet.tcp.keepidle=30000
sudo sysctl -w net.inet.tcp.keepintvl=10000
sudo sysctl -w net.inet.tcp.keepcnt=5
sudo sysctl -w net.inet.tcp.delayed_ack=0
sudo sysctl -w kern.ipc.maxsockbuf=8388608
sudo sysctl -w net.inet.tcp.rfc1323=1
sudo sysctl -w net.inet.tcp.rfc3390=1
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder

# -------------------------------------
# Memory Management Optimizations
# -------------------------------------
echo "Optimizing memory management..."
sudo sysctl -w vm.swapusage=0  # Minimize swap usage on machines with high RAM
sudo sysctl -w vm.page_free_target=8000  # Increase the free memory buffer
sudo sysctl -w vm.compressor_mode=2  # Use the more efficient memory compressor
sudo sysctl -w vm.memsize=64  # Adjust memory prefetch for large memory systems
sudo sysctl -w kern.maxvnodes=600000  # Increase vnode limits for faster file access

# -------------------------------------
# File System & Disk I/O Optimizations
# -------------------------------------
echo "Tuning file system and disk I/O..."
sudo sysctl -w kern.io_policy=2  # Optimize I/O prioritization
sudo sysctl -w vfs.vm_pressure=100  # Reduce memory pressure on high RAM systems
sudo sysctl -w kern.maxvnodes=500000  # Optimize vnode usage for faster file access
sudo sysctl -w kern.memorystatus_vmpressure_level=5  # Adjust memory thresholds

# Enable Trim for SSDs (including NVMe drives)
echo "Enabling TRIM for SSD/NVMe drives..."
sudo trimforce enable

# Adjust Disk Queue Depth for faster NVMe performance
echo "Adjusting disk queue depth for NVMe drives..."
for disk in $(diskutil list | grep -E 'disk[0-9]' | awk '{print $1}'); do
    sudo sysctl -w kern.io_policy_queue_depth.$disk=64
done

# -------------------------------------
# GPU Optimizations
# -------------------------------------
echo "Applying GPU optimizations..."
sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true  # Enable HiDPI resolutions
sudo defaults write com.apple.Dock showhidden -bool true  # Enable faster rendering for hidden windows
sudo defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false  # Disable window animations
sudo defaults write NSGlobalDomain NSWindowResizeTime -float 0.001  # Speed up window resizing
sudo defaults write com.apple.universalaccess reduceTransparency -bool true  # Reduce GPU load by disabling transparency

# -------------------------------------
# Power Management Optimizations
# -------------------------------------
echo "Adjusting power management settings..."
sudo pmset -a displaysleep 0
sudo pmset -a disksleep 0
sudo pmset -a sleep 0
sudo pmset -a powernap 0
sudo pmset -a tcpkeepalive 1
sudo pmset -a autorestart 1
sudo pmset -a standby 0

# -------------------------------------
# General System Optimizations
# -------------------------------------
echo "Applying general optimizations..."
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist  # Disable Spotlight indexing
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.apsd.plist  # Disable push notifications

# Clear cache files and logs
echo "Clearing cache files and logs..."
sudo rm -rf /System/Library/Caches/*
sudo rm -rf /Library/Caches/*
sudo rm -rf ~/Library/Caches/*

# -------------------------------------
# Optional: Persist Network Settings
# -------------------------------------
echo "Would you like to make network changes permanent (y/n)?"
read choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo "Persisting network settings..."
    sudo tee -a /etc/sysctl.conf <<EOL
net.inet.tcp.recvspace=65536
net.inet.tcp.sendspace=65536
net.inet.tcp.autorcvbufmax=4194304
net.inet.tcp.autosndbufmax=4194304
net.inet.tcp.sack=1
net.inet.tcp.fastopen=1
net.inet.tcp.always_keepalive=1
net.inet.tcp.keepidle=30000
net.inet.tcp.keepintvl=10000
net.inet.tcp.keepcnt=5
net.inet.tcp.delayed_ack=0
kern.ipc.maxsockbuf=8388608
net.inet.tcp.rfc1323=1
net.inet.tcp.rfc3390=1
EOL
    echo "Network settings saved to /etc/sysctl.conf."
fi

# -------------------------------------
# Final Note and Reboot Option
# -------------------------------------
echo "All optimizations applied successfully!"
echo "For some settings, a reboot is recommended. Would you like to reboot now? (y/n)"
read reboot_choice
if [[ "$reboot_choice" == "y" || "$reboot_choice" == "Y" ]]; then
    echo "Rebooting now..."
    sudo reboot
else
    echo "Reboot skipped. Changes will take effect immediately where applicable."
fi
