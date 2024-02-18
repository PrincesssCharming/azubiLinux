#!/bin/bash
display_menu() {
	echo ""
	echo "Personal Record Management System"
	echo "1. Add a new record"
	echo "2. Edit existing records"
	echo "3. Search for specific records"
	echo "4. Generate reports"
	echo "5. Exit"
}

# Function to handle user choice
handle_choice() {
	read -p "Enter your choice: " choice
	case $choice in
		1) add_record ;;
		2) edit_records ;;
		3) search_records ;;
		4) generate_reports ;;
		5) echo "Exiting..."; exit ;;
		*) echo "Invalid choice. Please enter a number between 1 and 5." ;;
	esac
}

# Function to add a new record
add_record() {
	clear
	echo "Adding a new record..."
	read -p "Enter username: " username
	read -p "Enter email address: " email
	read -p "Enter password: " password
	echo "$username:$email:$password" >> records.txt
	echo "Record added."
}

# Function to edit existing records
edit_records() {
	clear
	#check if the records.txt exists
	if [ ! -f "records.txt" ]; then
		echo "No records found."
		return
	fi
	echo "Existing Records"
	cat records.txt

	read -p "Enter the name of the record to edit: " name

	#check if the record exists
	if ! grep -q "^$name:" records.txt; then
		echo "Record not found."
		return
	fi

	echo "Which field would you like to edit?"
	echo "1. Username"
	echo "2. Email Address"
	echo "3. Password"
	read -p "Enter your choice: " choice

	case $choice in
		1)
			read -p "Enter new username: " new_username
			sed -i "s/^$name:\(.*\):\(.*\)/$new_useername:\1:\2/" records.txt
			;;
		2)
			read -p "Enter new email address: " new_email
			sed -i "s/^$name:\(.*\):\(.*\)/\1:$new_email:\2/" records.txt
			;;
		3)
			read -p "Enter new password: " new_password
			sed -i "s/^$name:\(.*\):\(.*\)/\1:\2:$new_password/" records.txt
			;;
		*)
			echo "Invalid choice."
			return
			;;
	esac

	echo "Record edited successfully"
}

# Function to search for specific records
search_records() {
	clear
	echo "Searching for specific records..."
	
	if [ ! -f "records.txt" ]; then
		echo "No records found."
		return
	fi

	read -p "Enter the name of the record to search: " name
	if grep -q "^$name:" records.txt; then
		echo "Record found:"
		grep "^$name:" records.txt
	else
		echo "Record not found."
	fi
}

# Function to generate reports
generate_reports() {
	clear
	echo "Generating reports..."
	
	if [ ! -f "records.txt" ]; then
		echo "No records found."
		return
	fi

	total_records=$(wc -l < records.txt)

	echo "Total number of records: $total_records"
}

# Main function
main() {
	while true; do
		display_menu
		handle_choice
	done
}

																									    # Call main function
																									    main

