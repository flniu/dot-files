#!/bin/sh

for file in .[a-z]*
do
    if [ "$file" != .git ] && [ "$file" != .gitignore ]
    then
        if [ -f ~/"$file" ]
        then
            echo backup ~/"$file"
            cp -f ~/"$file" ~/dot-files/
        fi
    fi
done
