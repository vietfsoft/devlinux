#!/bin/bash

# Print specific environment variables
echo "PATH=$PATH"
echo "HOME=$HOME"
echo "USER=$USER"
echo "SHELL=$SHELL"

# Count number of directories in $PATH
echo "Number of directories in PATH: $(echo "$PATH" | tr ':' '\n' | wc -l)"

# List all environment variables and count them
echo ""
echo "All environment variables:"
printenv
echo ""
echo "Total environment variables: $(printenv | wc -l)"
