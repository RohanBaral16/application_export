#!/bin/bash

# Step 1: Check for Python
if ! command -v python3 &> /dev/null
then
    echo "Python3 is not installed. Installing Python3 via Homebrew..."
    
    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null
    then
        echo "Homebrew is not installed. Installing Homebrew first..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    # Install Python
    brew install python
fi

# Step 2: Serve Flutter Web App
cd build/web || { echo "Web build not found. Run 'flutter build web' first."; exit 1; }

echo "Launching browser at http://localhost:8080"
open http://localhost:8080

python3 -m http.server 8080
