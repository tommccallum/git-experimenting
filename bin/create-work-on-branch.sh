#!/bin/bash

# This scripts creates some files and writes some text
# to the files it creates committing as it goes.
how_much_work=$1
if [ "x$how_much_work" == "x" ]
then
    how_much_work=10
fi

branchName=$(git branch --show-current | sed "s/ /_/" | sed "s&/&_&")
echo "Performing some work on this branch"
echo "Branch: $branchName"
echo "Work steps: $how_much_work"

function create_name() {
    counter=0
    while true; do
        filename="${branchName}_${counter}.txt"
        if [ ! -e "$filename" ]; then
            echo $filename
            return
        fi
        counter=$(($counter+1))
    done
}

function create_new_file() {
    step=$1
    newfile=$(create_name)
    echo "[$step] Creating new file called '${newfile}'"
    touch $newfile
    git add -A
    git commit -m "${step} Added newfile to branch"
}

function write_text_to_file() {
    step=$1
    fileCount=$(find . -type f | grep -v "^\.\/\." | grep -v "gitkeep$" | grep -v "^\.\/bin\/" | grep "\.txt$" | wc -l)
    pick=$((1+$RANDOM%$fileCount))
    chosenFile=$(find . -type f | grep -v "^\.\/\." | grep -v "gitkeep$" | grep -v "^\.\/bin\/" | grep "\.txt$" |  head -n $pick | tail -n 1)
    echo "[$step] Writing text to '${chosenFile}'"
    lineCount=$(wc -l $chosenFile | awk '{print $1}')
    lineCount=$(($lineCount+1))
    echo "Writing new line ${lineCount} to file ${lineCount}" >> $chosenFile
    git add -A
    git commit -m "${step} Wrote some new lines of my book"
}

function create_new_directory() {
    step=$1
    newdirectory=$(create_name)
    echo "[$step] Creating new directory called '${newdirectory}'"
    mkdir $newdirectory
    touch "${newdirectory}.gitkeep"
    git add -A
    git commit -m "${step} Added a new directory to branch"
}

for ii in $(seq 1 $how_much_work)
do
    action=$((1+$RANDOM%3))
    if [ $action -eq 1 ]; then
        create_new_file $ii
    fi
    if [ $action -eq 2 ]; then
        create_new_directory $ii
    fi
    if [ $action -eq 3 ]; then
        write_text_to_file $ii
    fi
    if [ $action -gt 3 ]; then
        echo "Invalid action ${action} specified."
    fi
done