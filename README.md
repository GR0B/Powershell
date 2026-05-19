# Powershell

Misc powershell bits 

**DiscordPost**  
Post basic machine info and public IP details to a Discord webhook

**dp**   
Discord ping, pings a discord server when run. Discord webhook needs to be passed as enviroment varible.

**LowDiskEmailAlert**   
As Windows has depricated email alerts, Here is a basic powershell oneliner that can be added to Scheduled tasks to send an alert email on a Windows low disk event. Can be cusomized for other events. 

**SerialMonitor.ps1**
A simple serial port monitor in Powershell, Opens a serial port and echos the received data to the console with a timestamp. Created to test RFID cards and modules under Windows without installing any 3rd party software.

**set-disk_offline.txt**   
How to Offline a disk which unmounts it from Windows 

**WIFI_monitor.ps1**
Monitors the link qualitity of the WIFI connection on Windows.  
Prints SSID, Channel, link RX Mbps, link TX Mbps, RSSI, and Ping time to 1.1.1.1
Loops every 15 seconds, and is mostly passive with the exception of a single ping per loop, should not impact link quality (unlike doing a speed test).
On Win11 needs to be run as an Administrator and have location services enabled to access the WIFI info.

