#!/bin/bash

# This is just a script for populating/generating a .htpasswd file with bcrypt hashes

if [ -z "$1" ]; then
	echo "usage: $0 <name-of-user>"
	exit 1
fi

command -v htpasswd >/dev/null 2>&1 || { echo >&2 "This script requires htpasswd (sudo apt-get install apache2-utils). Aborting."; exit 1; }

if [ -f .htpasswd ]; then
	htpasswd -B .htpasswd $1
else
	htpasswd -cB .htpasswd $1
fi
