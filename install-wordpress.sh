#!/bin/bash

# Define the URL for the latest WordPress package
WORDPRESS_URL="https://wordpress.org/latest.tar.gz"

# Download the latest WordPress package
curl -O $WORDPRESS_URL

# Unpack the downloaded tar.gz file
tar -xzf latest.tar.gz

# Optionally, remove the tar.gz file after extraction
rm latest.tar.gz

echo "WordPress has been downloaded and unpacked."