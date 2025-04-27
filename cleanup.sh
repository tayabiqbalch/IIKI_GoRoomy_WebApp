#!/bin/bash

# Ensure the script is run from the root of the solution directory
SOLUTION_ROOT="$(pwd)"

# Confirm with the user before proceeding
read -p "Are you sure you want to delete all 'bin' and 'obj' directories under '$SOLUTION_ROOT'? (y/n): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Operation canceled."
    exit 0
fi

# Clean the solution using dotnet
echo "Cleaning the solution using 'dotnet clean'..."
dotnet clean

# Find and delete all bin directories
echo "Deleting 'bin' directories..."
find "$SOLUTION_ROOT" -type d -name 'bin' -exec rm -rf {} + 2>/dev/null

# Find and delete all obj directories
echo "Deleting 'obj' directories..."
find "$SOLUTION_ROOT" -type d -name 'obj' -exec rm -rf {} + 2>/dev/null

echo "All 'bin' and 'obj' directories under the solution have been deleted."