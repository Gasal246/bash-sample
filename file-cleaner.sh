#!/bin/bash

echo """
 __    __      __   _        _        ______
|  |  |  | |  |__  | |      | |      |  __  |
|  |__|  | |  ___| | |      | |      | |  | |
|   __   | |  |__  | |____  | |____  | |__| |
|__|  |__| |_____| |______| |______| |______| gasal246/file_cleaner
"""

echo "WELCOME TO FILE CLEANER"
echo "Clean the files in a specific directory older than a certain number of days simply by running this Bash program from your terminal."

echo """
- this is a sample project by muhammed gasal
"""

# User input for directory and days
read -p "Enter Target Dir: " TARGET_DIR
read -p "How many Days Old: " DAYS

# Expand ~ to full home directory path
TARGET_DIR="${TARGET_DIR/#\~/$HOME}"

# Check if directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' does not exist."
    exit 1
fi

echo "Searching for files in $TARGET_DIR older than $DAYS days..."

# Finding files older than the given days
FILES=$(find "$TARGET_DIR" -type f -mtime +"$DAYS")

# Check if any files were found
if [ -z "$FILES" ]; then
    echo "No files older than $DAYS days found. Exiting."
    exit 1
fi

# Count and list the files
FILE_COUNT=$(echo "$FILES" | wc -l)
echo "Found $FILE_COUNT files older than $DAYS days:"
echo "$FILES"

# Ask for confirmation
read -p "Do you want to delete these $FILE_COUNT files? (y/n): " CONFIRM

if [[ "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo "Deleting files..."
    echo "$FILES" | xargs rm -v
    echo "Cleanup complete!"
else
    echo "Operation aborted."
    exit 0
fi
