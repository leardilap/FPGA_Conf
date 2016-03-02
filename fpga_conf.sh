#!/bin/bash
# Version 1.0 Mar 2 2016
# Created by: Luis Ardila luis.ardila@bozica.co
# Simple script to configure FPGAs using the batch mode of Impact

fileFlag=false

#Getting options from the commad line
while getopts ":f:" opt; do
    case $opt in
    f) 	#f=file
        file=$OPTARG
        fileFlag=true
        ;;
    \?)
        echo "Invalid option: -"$OPTARG"" >&2
        exit 
        ;;
    :)
        echo "Option -"$OPTARG" requires an argument" >&2 
        exit
        ;;
    esac
done

#Checking if option -f is used
if ! $fileFlag; then
    echo "option -f must be included and the file name as argument" >&2
    exit 
fi

#Checking if file exist
if [ ! -f "$file" ]; then
    echo $file
    echo "File does not exist"
    exit
else
	
    cat impact_batch_tmp.cmd | sed "s/FILENAME/$file/" > impact_batch_script.cmd

    impact -batch impact_batch_script.cmd

    echo "FPGA is configured with bit file: $file"	

fi
