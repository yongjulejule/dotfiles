#!/bin/bash

# Replace these with your actual directory paths
local_dir="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
backup_dir="$PWD/nvim"

# Step 1 and 2: Check for new and deleted files
echo "Checking for new and deleted files..."

# Define a shell function to get relative paths
get_relative_path_cmd='get_relative_path() { echo "${1#"$2"/}"; }; '

# Find new files
fd . "$local_dir" --type f --exec bash -c "$get_relative_path_cmd relative_path=\$(get_relative_path \"{}\" \"$local_dir\"); [[ -f \"$backup_dir/\$relative_path\" ]] || echo \"New file in Local: \$relative_path\"" \;


# Find deleted files
fd . "$backup_dir" --type f --exec bash -c "$get_relative_path_cmd relative_path=\$(get_relative_path \"{}\" \"$backup_dir\"); [[ -f \"$local_dir/\$relative_path\" ]] || echo \"New file in Dotfiles: \$relative_path\"" \;


# Step 3: Check for differences in common files
echo "Checking for differences in common files..."
fd . "$local_dir" --type f --exec bash -c "$get_relative_path_cmd relative_path=\$(get_relative_path \"{}\" \"$local_dir\"); [[ -f \"$backup_dir/\$relative_path\" ]] && diff \"{}\" \"$backup_dir/\$relative_path\" || echo \"Differences found in \$relative_path\"" \;
