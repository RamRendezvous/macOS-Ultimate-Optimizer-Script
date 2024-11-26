# macOS-Ultimate-Optimizer-Script
This script optimizes macOS systems for better performance, tailored for machines with high RAM, fast NVMe drives, and powerful GPUs. It fine-tunes network settings, memory management, disk I/O, GPU configurations, and general system settings, all through the command line.
Features
Network Optimizations

    Optimizes TCP parameters for faster connections.
    Flushes DNS cache and resets network settings.
    Improves performance for high-speed networks.

Memory Management

    Reduces swap usage on systems with high RAM.
    Adjusts free memory buffers and compression for efficiency.
    Enhances memory prefetch for large memory systems.

File System & Disk I/O

    Enables TRIM for SSDs/NVMe drives.
    Optimizes vnode limits and queue depth for faster disk access.
    Reduces memory pressure during file system operations.

GPU Tweaks

    Disables unnecessary animations and transparency effects.
    Speeds up window rendering and resizing.
    Enables HiDPI support for sharper resolutions.

Power Management

    Configures settings to prioritize performance over power saving.
    Disables sleep and power-nap features.

General System Optimizations

    Disables Spotlight indexing for better resource management.
    Clears system and user caches for smoother operation.
    Disables push notifications and other background services.

Installation and Usage
1. Clone the Repository

git clone https://github.com/RamRendezvous/macos-ultimate-optimizer.git
cd macos-ultimate-optimizer

2. Make the Script Executable

chmod +x mac_ultimate_optimizer.sh

3. Run the Script

sudo ./mac_ultimate_optimizer.sh

4. Follow Prompts

    The script offers an option to make network optimizations permanent.
    You’ll also be asked whether to reboot after applying changes.

Requirements

    macOS 12 or 13 (Monterey or Ventura)
    Administrator privileges (sudo access)

Disclaimer

This script applies system-wide changes that may affect performance and stability. Use it only if you are familiar with system optimizations and their potential risks.

    Backup Your System: Ensure all important data is backed up before running this script.
    Hardware-Specific Adjustments: While the script is designed for high-performance hardware, some optimizations may not benefit all setups.
    Reboot Recommended: For many changes to take full effect, a system reboot is required.

Contributing

Contributions, suggestions, and improvements are welcome! If you encounter issues or have feature requests, feel free to open an issue or submit a pull request.
License

This project is licensed under the MIT License.
