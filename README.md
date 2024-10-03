# README lol

A list of my CyberPatriot bash scripts to help automate the competition. Some of them are explained so we can understand how these files work. 



**MP3 Files remover:** Let's break this down. We have a block of code here:
```bash
#!/bin/bash

mapfile -t mp3_files < <(sudo find / -type f -name '*.mp3' 2>/dev/null)

for file in "${mp3_files[@]}"; do
    echo "deleting file... $file"
    sudo rm -f "$file"
done
```
What does this do? Well, this script first uses the `find` command, starting from the root directory - `find /` - to start the search. We then 
use the options `-type f ` to specify that we want regular files, and `-name '*.mp3'` to specify we want _mp3_ files.

Hooray! We have the file names (if there are any). But now, we have to store those inputs in a variable. To do this, we use a bash tool called _process subsitution_ to feed the output of
our search - a process - directly into the variable `mp3_files` using the `< <` operator. This allows us to transfer the output into the variable without creating a temporary file.  However,
we need to format our new output...
```bash
Joseph Music.mp3
Joseph Joseph music.mp3
Joseph Joseph John.mp3
```
...so it's not handled as a single string. We need to use `mapfile -t` to separate each line and its filename into its own element and prevent the script from breaking.

Now, we can use a simple _for_ loop to force remove each unwanted mp3 file using `rm -f "$file"` and use `done` to quit the process. 
