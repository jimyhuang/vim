#!/bin/sh
#
# Very basic php syntax check using php -l

files=`git status --porcelain | grep " [MA] " | tr -d " MA" | grep ".inc\|.module\|.php"`

for f in $files
do
  php -l $f
  if [ $? -gt 0 ]
  then
    echo "Found PHP Syntax errors. Not committing..."
    exit 1
  fi
done
