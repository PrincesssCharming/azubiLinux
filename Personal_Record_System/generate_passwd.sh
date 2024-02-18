#!/bin/bash

generate_password() {
	password=$(openssl rand -base64 12)
	echo "Generated password: $password"
}

generate_password
