# EXIF Manager

This repository contains a bash script for managing EXIF metadata in image files. The script allows you to add random metadata to images in a specified directory while keeping the camera model fixed as "iPhone 16 Pro Max."

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Disclaimer | Running the Script](#disclaimer--running-the-script)
- [Donations](#donations)
- [Support or Contact](#support-or-contact)

## Prerequisites

Before using the script, ensure you have the following installed:

1. **exiftool**: This script requires `exiftool` to read and write EXIF metadata. You can install it using:
   ```bash
   sudo apt-get install libimage-exiftool-perl
   ```

2. **Bash**: This script is designed to run in a bash environment. Make sure you have bash available on your system.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Lalatenduswain/exif_manager.git
   ```

2. Navigate to the cloned directory:
   ```bash
   cd exif_manager
   ```

3. Make the script executable:
   ```bash
   chmod +x exif_manager.sh
   ```

## Usage

1. Run the script:
   ```bash
   ./exif_manager.sh -a
   ```

2. When prompted, enter the path to the directory containing your images. The script will process all image files in that directory and create modified copies with added random metadata.

### Example
```bash
Enter the source directory path: ~/Desktop/Photos
```

## Disclaimer | Running the Script

**Author:** Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain) | [Website](https://blog.lalatendu.info/)

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The authors of the script are not liable for any damages or issues caused by its usage.

## Donations

If you find this script useful and want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain).

If you encounter any issues, please submit them on our [GitHub page](https://github.com/Lalatenduswain/exif_manager/issues).

## Support or Contact

Encountering issues? Don't hesitate to submit an issue on our [GitHub page](https://github.com/Lalatenduswain/exif_manager/issues).
