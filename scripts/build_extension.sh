#!/bin/bash
# Build the Vite browser extension
set -e
echo "Building extension..."
cd extension
npm install
npm run build
echo "Done. The extension is ready to be loaded unpacked from extension/dist."
