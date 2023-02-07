#!/bin/bash

# Get all the .epub files in the current directory
epub_files=($(ls *.epub))

# Loop through all the .epub files
for file in "${epub_files[@]}"; do
	# Escape any spaces in the file name
	file_escaped=${file// /\\ }

	# Run the go script and print out a list of the chapter numberings
	chapters=$(./etg "$file_escaped")

	# Use pv to display a progress bar while extracting each chapter
	for chapter in $chapters; do
		number=$(echo $chapter | awk -F/ '{print $1}')
		./etg "$file_escaped" $number | pv -t -e -b -a -N "Extracting chapter $number" >> "${file%.epub}.txt"
	done
done
