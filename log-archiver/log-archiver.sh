#!/bin/bash

# Save preferred archive directory to a variable

read -p "Enter preferred archive directory. Use fully qualified path (e.g. /home/trips/logs): " archive_directory
echo "You entered: $archive_directory"

sudo mkdir -p "$archive_directory"

timestamp=$(date +"%Y%m%d-%H%M%S")

backup_file="$archive_directory/backup_$timestamp.tar.gz"

sudo tar -czf "$backup_file" /var/log
