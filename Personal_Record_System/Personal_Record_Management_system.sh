#!/bin/bash

main_menu() {
	echo "Personal Record MManagement System"
	echo "1. Add a new record."
	echo "2. Edit an existing record."
	echo "3. Search records."
	echo "4. Generate Reprts."
	echo "5. Backup Records."
	echo "6. Generate Random Password"
	echo "7. Exit"
	read -p "Enter your choice: " choice
	case $choice in
		1) add_record;;
		2) edit_record ;;
		3) search_records ;;
		4) generate_records ;;
		5) backup records ;;
		6) generate_password ;;
		7) exit ;;
		*) echo "Invalid choice. Please enter a number between 1 and 7." ;;
	esac
}

add_record() {
	echo "Adding a new record."
}

while true: do
	main_menu
	read -p "Press Enter to continue..."
done
