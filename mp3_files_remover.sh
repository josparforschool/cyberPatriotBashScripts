#!/bin/bash

# get filenames
mapfile -t mp3_files < <(sudo find / -type f -name '*.mp3' 2>/dev/null)

# force remove them
for file in "${mp3_files[@]}"; do
    echo "deleting file... $file"
    sudo rm -f "$file"
done
