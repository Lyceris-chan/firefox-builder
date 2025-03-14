#!/bin/bash
set -e

# If the LibreWolf repository isn’t already present, clone it.
if [ ! -d "librewolf-source" ]; then
    echo "Cloning LibreWolf repository..."
    git clone --recursive https://gitlab.com/librewolf-community/browser/source.git librewolf-source
fi

mv mozconfig librewolf-source/assets/mozconfig.new

cd librewolf-source

# Prepare the build directory for Windows.
echo "Setting up build directory..."
make dir

# Bootstrap the build system (only needs to be done once).
echo "Bootstrapping build environment..."
make bootstrap

# Build LibreWolf.
echo "Starting build..."
make build

# Package the build. (Alternatively, you can use 'make run' to launch it.)
echo "Packaging build..."
make package

# Optionally, to run the built executable, uncomment the next line:
# make run
