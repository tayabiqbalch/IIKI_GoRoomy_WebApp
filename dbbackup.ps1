# Get the current date and time in YYYYMMDD_HHMMSS format
$DateTime = Get-Date -Format "yyyyMMdd_HHmmss"

# Take inputs from the user for ServerInstance and DatabaseName
$ServerInstance = Read-Host "Enter SQL Server instance (default: MTIC)"
if ([string]::IsNullOrEmpty($ServerInstance)) {
    $ServerInstance = "MTIC"
}

$DatabaseName = Read-Host "Enter Database name (default: IIKI_GoRoomyDB)"
if ([string]::IsNullOrEmpty($DatabaseName)) {
    $DatabaseName = "IIKI_GoRoomyDB"
}

# Take inputs for BackupPath and ZipPath
$BackupPath = Read-Host "Enter Backup Path (leave blank to use default)"
if ([string]::IsNullOrEmpty($BackupPath)) {
    $BackupPath = "D:\MTIC\dbs\$DatabaseName" + "_$DateTime.bak"
}

$ZipPath = Read-Host "Enter Zip Path (leave blank to use default)"
if ([string]::IsNullOrEmpty($ZipPath)) {
    $ZipPath = "D:\MTIC\dbs\$DatabaseName" + "_$DateTime.zip"
}

# Ensure that the backup path is correctly formatted with the datetime
$BackupPath = $BackupPath.TrimEnd('\') + "\" + $DatabaseName + "_$DateTime.bak"

# Ensure that the zip path is correctly formatted with the datetime
$ZipPath = $ZipPath.TrimEnd('\') + "\" + $DatabaseName + "_$DateTime.zip"

# Backup the database using sqlcmd
Invoke-Sqlcmd -ServerInstance $ServerInstance -Query "BACKUP DATABASE [$DatabaseName] TO DISK = N'$BackupPath' WITH INIT, COMPRESSION;"

# Check if backup was successful before zipping
if (Test-Path $BackupPath) {
    # Compress the backup file into a zip
    Compress-Archive -Path $BackupPath -DestinationPath $ZipPath
    Write-Host "Backup and compression completed successfully."
} else {
    Write-Host "Backup failed. The .bak file was not created."
}

# Ask the user to press any key to close the script
Write-Host "Press any key to close the script."
[System.Console]::ReadKey() | Out-Null

Write-Host "Closing script. Goodbye!"
Exit
