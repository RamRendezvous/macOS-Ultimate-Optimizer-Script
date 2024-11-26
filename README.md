# macOS Ultimate Optimizer Script

This script optimizes macOS systems for better performance, tailored for machines with high RAM, fast NVMe drives, and powerful GPUs. It fine-tunes network settings, memory management, disk I/O, GPU configurations, and general system settings, all through the command line.

## Features

### **Network Optimizations**
- Optimizes TCP parameters for faster connections.
- Flushes DNS cache and resets network settings.
- Improves performance for high-speed networks.

### **Memory Management**
- Reduces swap usage on systems with high RAM.
- Adjusts free memory buffers and compression for efficiency.
- Enhances memory prefetch for large memory systems.

### **File System & Disk I/O**
- Enables TRIM for SSDs/NVMe drives.
- Optimizes vnode limits and queue depth for faster disk access.
- Reduces memory pressure during file system operations.

### **GPU Tweaks**
- Disables unnecessary animations and transparency effects.
- Speeds up window rendering and resizing.
- Enables HiDPI support for sharper resolutions.

### **Power Management**
- Configures settings to prioritize performance over power saving.
- Disables sleep and power-nap features.

### **General System Optimizations**
- Disables Spotlight indexing for better resource management.
- Clears system and user caches for smoother operation.
- Disables push notifications and other background services.

## Installation and Usage

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/macos-ultimate-optimizer.git
cd macos-ultimate-optimizer
