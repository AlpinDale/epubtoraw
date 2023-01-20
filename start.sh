#!/bin/bash

# Get the file name from user with this:
read -e -p "Enter the name of the epub file: " file

# Run the go script and print out a list of the chapter numberings
chapters=$(./etg "$file")

# Extract chapter number and use it to re-run the go script and print out our raw text
for chapter in $chapters; do
	number=$(echo $chapter | awk -F/ '{print $1}')
	./etg "$file" $number >> "$file".txt
done
