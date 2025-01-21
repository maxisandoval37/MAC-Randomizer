# Random MAC Address Changer Script

This batch script allows you to change the MAC address of enabled network interfaces on a Windows machine. It generates a random MAC address and applies it to each enabled network interface.

<p align="center">
  <img src="https://github.com/user-attachments/assets/0ceb52af-e3b3-4bc9-b353-e7cc74b1698d"/>
</p>

## Requirements

- The script needs administrator privileges to run successfully.
- PowerShell must be available to elevate the script with the required privileges.
  
## Features

- Lists all available network interfaces.
- Generates a random MAC address for each enabled network interface.
- Disables the network interface.
- Changes the MAC address in the system registry.
- Re-enables the network interface with the new MAC address.

## How It Works

1. The script first checks if it has administrator privileges.
2. It lists all enabled network interfaces using `wmic`.
3. For each enabled interface, it:
   - Generates a random MAC address.
   - Disables the network interface.
   - Changes the MAC address using the Windows registry.
   - Re-enables the network interface with the new MAC address.
4. Displays the new MAC address for each interface.

## Usage

1. Run the script .bat.
2. The script will list all available network interfaces, generate a random MAC address for each enabled interface, change the MAC address, and then re-enable the interface.

## Example Output

Available interfaces: Name DeviceID Ethernet 2 Wi-Fi 3

Interface with DeviceID=2 now has the new MAC: AA-12-34-56-78-9A Interface with DeviceID=3 now has the new MAC: BB-23-45-67-89-AB

## Notes

- This script is designed to work on Windows machines.
- Make sure you are running this on a machine where changing MAC addresses is allowed and won't disrupt network connectivity.
- If you encounter any issues, ensure that the script has the necessary administrative permissions.

## Disclaimer

Use this script at your own risk. Changing the MAC address can potentially disrupt network connections or violate terms of service with certain networks.

---

### Created By: [Maximiliano Sandoval](https://github.com/maxisandoval37) ☕
