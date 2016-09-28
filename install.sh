#!/bin/sh

for file in .[a-z]*
do
    if [ "$file" != .git ] && [ "$file" != .gitignore ]
    then
        if [ -f ~/"$file" ]
        then
            echo ~/"$file" already exists!
        else
            echo create link ~/"$file"
            ln -s ~/dot-files/"$file" ~/"$file"
        fi
    fi
done
