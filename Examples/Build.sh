#!/usr/bin/env bash

show_help() {
    echo "Usage: $(basename $0) [file]"
    echo
    echo "Build script for .wls files."
    echo
    echo "With no FILE, builds all .wls files in the current directory."
    echo "With FILE, builds the specified .wls file."
    echo
    echo "Options:"
    echo "  -h, --help    Display this help and exit"
    echo
    echo "Examples:"
    echo "  $(basename $0)             # Builds all .wls files"
    echo "  $(basename $0) example.wls # Builds example.wls"
    echo
    echo "by Le CHEN, (chenle02@gmail.com)"
    echo "Fri Nov 10 08:46:48 AM EST 2023"
    exit 0
}

# Array of exceptional filenames
exceptional_files=(
    "FoxH-Bessel-J_2_9_18.wls"
    "FoxH-Bessel-K_2_9_19.wls"
    "FoxH-Bessel-Y_2_9_20.wls"
    "FoxH-Whittaker_2_9_21.wls"
    "FoxH-Lommel_2_9_22.wls"
    "FoxH-generalized_Bessel_Maitland_2_9_24.wls"
    "FoxH-Macdonald_function_2_9_33.wls"
    "FoxH-Macdonald_function_2_9_35.wls"
    # Add any other exceptional files here
)

# Function to check if a file is in the array of exceptional files
is_exceptional_file() {
    local file=$1
    for exceptional_file in "${exceptional_files[@]}"; do
        if [[ $file == $exceptional_file ]]; then
            return 0 # File is exceptional
        fi
    done
    return 1 # File is not exceptional
}

# Function to build a single file
build_file() {
    if is_exceptional_file "$1"; then
        # If file is exceptional, build with -s and -t
        ../FoxH.wls -s -t "$1"
        ../FoxH.wls -t "$1"
    else
        # Otherwise, build with -s
        ../FoxH.wls -s "$1"
        ../FoxH.wls "$1"
    fi
}

# Check for help option or if there is an argument provided
if [ "$#" -eq 0 ]; then
    # If no arguments, find all .wls files and build them
    for file in *.wls; do
        build_file "$file"
    done
elif [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    # If '-h' or '--help' is the first argument, show help
    show_help
else
    # If there is one argument, build that file
    build_file "$1"
fi

rm *.aux
rm *.log
rm *.out
rm FoxH_Results.mx
rm -r _minted*
