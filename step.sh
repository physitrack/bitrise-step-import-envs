#!/bin/bash

if [[ -f $env_file_path ]]
then
	while IFS='=' read -r key val; do
		if [ ! "$key" ] || [ ! "$val" ]; then
			echo "Cannot import variable - key or variable was empty."
			exit -1
		else
			envman add --key $key --value $val
		fi
	done < "$env_file_path"
else
	echo "Cannot find file at provided path."
	exit -1
fi
