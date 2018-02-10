#!/bin/sh -e

dir=$1
if [ "$dir" != "" ]; then
    echo "Changing directory to $dir"
    cd $dir
fi

# Check if this directory has any terraform files
count=`find . -name "*.tf" -maxdepth 1 | wc -l`
if [ $count != "0" ]; then

    echo "Checking terraform fmt"
    unformatted=`terraform fmt -write=false`
    if [ "$unformatted"  != "" ]; then
        echo "Found unformatted files; run terraform fmt:"
        for file in $unformatted; do
            echo $file
        done
        exit 1
    fi
fi

if [ "$dir" != "" ]; then
    cd - > /dev/null
fi

echo "Success"
