#!/bin/bash

# Set the prompt for the select menu
PS3="Please choose an option: "

# Define the menu options
options=("Option 1" "Option 2" "Option 3" "Exit")

# Loop to display the menu and handle user input
select opt in "${options[@]}"
do
    case $opt in
        "Option 1")
            echo "You chose Option 1."
            # Add commands for Option 1 here
            break
            ;;
        "Option 2")
            echo "You chose Option 2."
            # Add commands for Option 2 here
            break
            ;;
        "Option 3")
            echo "You chose Option 3."
            # Add commands for Option 3 here
            break
            ;;
        "Exit")
            echo "Exiting the menu. Goodbye!"
            break # Exit the select loop
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
    echo # Add a blank line for better readability
done
