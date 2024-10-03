#!/bin/bash

mapfile -t mp3_files < <(sudo find / -type f -name '*.mp3' 2>/dev/null)

for file in "${mp3_files[@]}"; do
    echo "deleting file... $file"
    sudo rm -f "$file"
done
