 
#!/bin/bash

#Author: Parker
#Date Created: 6/6/24
#Last Modified: 6/6/24

#Description:
#Searches for a string in a folder of multiple .txt then displays each file

# Find files containing 'np:' and store them in an array
files=($(find $PWD -type f -exec grep -l 'docker' {} +))

# Get the total number of files
total_files=${#files[@]}

# Loop through each file
for ((i=0; i<$total_files; i++)); do
    file="${files[$i]}"
    # Display the file contents using cat
    cat "$file"

    # Prompt the user to save the file name
    read -p "Do you want to save the file name? (yes/no): " save_file

    # Check if the user wants to save the file name
    if [[ "$save_file" == "yes" ]]; then
        echo "$file" >> saved_files.txt
        echo "File name saved."
    elif [[ "$save_file" == "no" ]]; then
        echo "File name not saved."
    else
        echo "Invalid input. File name not saved."
    fi

    # If this is the last file, skip asking for continuing
    if [ $i -eq $(($total_files - 1)) ]; then
        echo "All files have been displayed."
        exit 0
    fi

    # Prompt the user to continue to the next file
    read -p "Press Enter to continue to the next file, or type 'exit' to quit: " input

    # Check if the user wants to exit
    if [[ "$input" == "exit" ]]; then
        echo "Exiting..."
        exit 0
    fi
done
