#!/bin/bash

SOURCE_DIR="$1"
BACKUP_DIR="$2"
DATE=$(date +%Y-%m-%d)
FILENAME="backup-$DATE.tar.gz"

if [ -z "$SOURCE_DIR" ] || [ -z "$BACKUP_DIR" ]; then
  echo "Usage: $0 <source_directory> <backup_directory>"
  exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory does not exist."
  exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Perform backup
tar -czf "$BACKUP_DIR/$FILENAME" -C "$SOURCE_DIR" .

# Check result
if [ $? -eq 0 ]; then
  echo "Backup successful: $BACKUP_DIR/$FILENAME"
else
  echo "Backup failed."
fi
