#!/bin/bash

# Check if Node.js is installed
if type node &> /dev/null; then
    echo "node is installed" > /dev/null
else
    echo "Node.js is not installed, install Node.js from your package manager on your distro"
    exit 1
fi

# Check if Node.js is installed
if type html-inline &> /dev/null; then
    echo "html-inline is installed" > /dev/null
else
    echo "html-inline npm package is not installed, installing it"
    npm install html-inline --global
fi

echo "Making static recovery HTML file"
html-inline index.html -o index-static.html || echo "Something went wrong during conversion, check error logs for for more information"
