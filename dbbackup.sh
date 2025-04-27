#!/bin/bash
# Get the current date and time in YYYYMMDD_HHMMSS format
DateTime=$(date +"%Y%m%d_%H%M%S")

# Set your SQL Server instance details
ServerInstance="DESKTOP-51P9VAG"
DatabaseName="IIKI_GoRoomyDB"

# Set database backup and zip paths
BackupPath="D:\MTIC\dbs/${DatabaseName}_${DateTime}.bak"
ZipPath="D:\MTIC\IIKI_Projects\IIKI_GoRoomy\IIKI.GoRoomy.WebApi\DBScripts\DBBackups/${DatabaseName}_${DateTime}.zip"

# Backup the database using sqlcmd
sqlcmd -S $ServerInstance -Q "BACKUP DATABASE [$DatabaseName] TO DISK = '$BackupPath' WITH INIT, COMPRESSION;"

# Check if backup was successful before zipping
if [ -f "$BackupPath" ]; then
    # Compress the backup file into a zip
	Compress-Archive "$ZipPath" "$BackupPath"
    echo "Backup and compression completed successfully."
else
    echo "Backup failed. The .bak file was not created."
fi
# Ask if the user wants to close the script
echo "Do you want to close the script? (y/n)"
read user_input

if [[ "$user_input" == "y" || "$user_input" == "Y" ]]; then
    echo "Closing script. Goodbye!"
    exit 0
else
    echo "The script will continue running."
fi