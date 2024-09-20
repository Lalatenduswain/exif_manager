#!/bin/bash

# Check if exiftool is installed
if ! command -v exiftool &> /dev/null
then
    echo "exiftool not found. Please install it first using: sudo apt-get install libimage-exiftool-perl"
    exit 1
fi

# Function to display usage
usage() {
    echo "Usage: $0"
    echo "Options:"
    echo "  -a                  Add random metadata to all images in the specified directory"
    echo "Examples:"
    echo "  $0 -a"
}

# Function to generate random artist name
generate_random_artist() {
    artists=("John Doe" "Jane Smith" "Alice Johnson" "Bob Brown" "Charlie White")
    echo "${artists[RANDOM % ${#artists[@]}]}"
}

# Function to save as a copy with "_modified" suffix
save_as_copy() {
    local filepath="$1"
    local filename=$(basename -- "$filepath")
    local extension="${filename##*.}"
    local filename_no_ext="${filename%.*}"
    local new_filepath="${filename_no_ext}_modified.${extension}"
    echo "$new_filepath"
}

# Ask for source directory
echo -n "Enter the source directory path: "
read source_dir

# If the source directory doesn't exist, exit with an error
if [ ! -d "$source_dir" ]; then
    echo "Error: Directory does not exist at $source_dir"
    exit 1
fi

# Parse command-line options
if [ $# -lt 1 ]; then
    usage
    exit 1
fi

while getopts ":a" opt; do
    case $opt in
        a) # Add random metadata to all images in the specified directory
            for img in "$source_dir"/*.{jpeg,jpg,png}; do
                [ -e "$img" ] || continue # Skip if no matching files
                destination_path=$(save_as_copy "$img")
                random_artist=$(generate_random_artist)
                random_datetime=$(date +"%Y:%m:%d %H:%M:%S" -d "$((RANDOM % 5 + 2019))-$(printf "%02d" $((RANDOM % 12 + 1)))-$(printf "%02d" $((RANDOM % 28 + 1))) $((RANDOM % 24)):$(printf "%02d" $((RANDOM % 60))):$(printf "%02d" $((RANDOM % 60)))")
                
                exiftool "-Artist=$random_artist" "-DateTimeOriginal=$random_datetime" "-Model=iPhone 16 Pro Max" "$img" -o "$destination_path"
                echo "Added metadata to '$img', saved as '$destination_path'."
            done
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            exit 1
            ;;
    esac
done
