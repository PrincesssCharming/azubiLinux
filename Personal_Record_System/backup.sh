#!/bin/bash

backup_file="/home/chantal/azubiLinux/Personal_Record_System/records.txt"
backup_dir="/home/chantal/azubiLinux/Personal_Record_System/backup_directory"

mkdir -p "$backup_dir"

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
backup_filename="records_backup_$timestamp.txt"
cp "$backup_file" "$backup_dir/$backup_filename"

echo "Backup created: $backup_dir/$backup_filename"
