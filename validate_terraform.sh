#!/bin/sh -e

dir=$1
if [ "$dir" != "" ]; then
    echo "Changing directory to $dir"
    cd $dir
fi

# Check if this directory has any terraform files
count=`find . -name "*.tf" -maxdepth 1 | wc -l`
if [ $count != "0" ]; then

    echo "Validating terraform templates in $dir"
    terraform validate

fi

if [ "$dir" != "" ]; then
    cd - > /dev/null
fi

echo "Success"
