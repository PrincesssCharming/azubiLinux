#!/bin/bash

display_menu() {
	echo ""
	echo "Welcome to the 'File Manager'"
	echo "What would you like to do today?"
	echo "1. Create a new directory"
	echo "2. Delete an existing directory"
	echo "3. List the contents of a directory"
	echo "4. Change into a directory"
	echo "5. Create a new file"
	echo "6. Write to an existing file"
	echo "7. Read from an exisitng file"
	echo "8. Delete an exisitng file"
	echo "9. Exit"
}

#Functions to handle choice
handle_choice() {
	read -p "Enter your choice: " choice
	case $choice in
		1) create_dir ;;
		2) delete_dir ;;
		3) listdir_contents ;;
		4) change_dir ;;
		5) create_file ;;
		6) edit_file ;;
		7) read_file ;;
		8) delete_file ;;
		9) echo "Exiting..."; exit ;;
		*) echo "Invalid choice. Please enter a number between 1 and 9." ;;
	esac
}

create_dir() {
	clear
	read -p "Enter the name of the new directory: " dirname
	mkdir $dirname
	echo "$dirname created."
}

delete_dir() {
	clear
	read -p "Enter the name of the directory to delete: " deletedir
	if [ -d "$deletedir" ]; then
		rm -r $deletedir
		echo "$deletedir deleted."
	else
		echo "Error: '$deletedir' not found."
	fi
}

listdir_contents() {
	clear
	read -p "Enter the name of the directory: " dir
	if [ -d "$dir" ]; then
		ls ~/$dir
	else
		echo "Error: '$dir' not found."
	fi
}

change_dir() {
	clear
	read -p "Enter the name of the directory to change into: " changedir
	if [ -d "$changedir" ]; then
		cd ~/$changedir
	else
		echo "Error: '$changedir' not found."
	fi
}

create_file() {
	clear
	read -p "Enter the name of the new file: " newfile
	touch $newfile
	echo "$newfile created."
}

edit_file() {
	clear
	read -p "Enter the name of the file to write into: " filename

	if [ -e "$filename" ]; then
		read -p "Enter content to add to the file: " content
		echo "$content" > "$filename"
		echo "Done"
	else
		echo "Error: '$filename' does not exist."
	fi
}

read_file() {
	clear
	read -p "Enter the name of the file to read: " readfile
	if [ -e "$readfile" ]; then
		cat $readfile
	else
		echo "Error: '$readfile' not found."
	fi
}

delete_file() {
	clear
	read -p "Enter the name of the file to delete: " delfile
	if [ -e "$delfile" ]; then
		rm -r $delfile
		echo "$delfile deleted."
	else
		echo "Error: '$delfile' not found."
	fi
}

main() {
	while true; do
		display_menu
		handle_choice
	done
}

main
