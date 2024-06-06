 
#!/bin/bash

#Author: Parker
#Date Created: 6/6/24
#Last Modified: 6/6/24

#Description:
#Searches for a string in a folder of multiple .txt then displays each file

# Find files containing 'np:' and store them in an array
files=($(find $PWD -type f -exec grep -l 'string' {} +))

# Loop through each file
for file in "${files[@]}"; do
    # Display the file contents using cat
    cat "$file"

    # Prompt the user to continue to the next file
    read -p "Press Enter to continue to the next file, or type 'exit' to quit: " input

    # Check if the user wants to exit
    if [[ "$input" == "exit" ]]; then
        echo "Exiting..."
        exit 0
    fi
done
