#!/bin/bash

# Replace these with your actual MEGA account credentials
EMAIL="thayeeboi890@gmail.com"
PASSWORD="$3"

# Specify the local file or folder to upload
LOCAL_PATH="$1"

# Specify the remote folder to upload to
REMOTE_PATH="$2"

# Log in to MEGA
echo "Logging into MEGA..."
mega-login $EMAIL $PASSWORD

# Check if login was successful
if [ $? -ne 0 ]; then
    echo "Login failed. Exiting."
    exit 1
fi
# apt update ; apt install wget ; wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megacmd-xUbuntu_22.04_amd64.deb ; apt install ./*deb

# remove file from mega
echo "Removing "$REMOTE_PATH$LOCAL_PATH
mega-rm "$REMOTE_PATH""$LOCAL_PATH" 

# Upload the file or folder
echo "Uploading $LOCAL_PATH to $REMOTE_PATH..."
mega-put "$LOCAL_PATH" "$REMOTE_PATH"

# Check if upload was successful
if [ $? -ne 0 ]; then
    echo "Upload failed. Exiting."
    exit 1
fi

# Log out from MEGA
echo "Logging out from MEGA..."
mega-logout

echo "Upload complete."


