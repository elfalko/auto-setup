#!/bin/bash

# Ensure a source and target directory are provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <source_directory>"
  echo "Creates a copy of the folder tree with a _raw extension and moves all raw files to this new tree"
  exit 1
fi

cd $1
SOURCE_DIR="$(pwd)"
DEST_DIR="${SOURCE_DIR}_raw"
cd -

echo "$SOURCE_DIR -> $DEST_DIR"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source directory does not exist: $SOURCE_DIR"
  exit 1
fi

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Function to copy folder structure and move .cr3 files
copy_and_move_cr3() {
  local current_dir="$1"
  local dest_dir="$2"

  # Iterate through the contents of the current directory
  for entry in "$current_dir"/*; do
    # If it's a directory, create the same directory structure in the destination
    if [ -d "$entry" ]; then
      # echo "found directory $entry"
      local new_dir="$dest_dir/$(basename "$entry")"
      # echo "  creating $new_dir"
      mkdir -p "$new_dir"
      
      # Recursively call the function for the subdirectory
      copy_and_move_cr3 "$entry" "$new_dir"
    
    # If it's a file with a .cr3 extension, move it to the corresponding directory
    elif [ -f "$entry" ] && [[ "$entry" == *.CR3 ]]; then
      echo "found raw $entry, moving to $dest_dir"
      mv "$entry" "$dest_dir"
    else
      echo "(skipping $entry)"
    fi
  done
}

# Call the function with the source and destination
copy_and_move_cr3 "$SOURCE_DIR" "$DEST_DIR"

echo "Finished processing. All .cr3 files have been moved."
