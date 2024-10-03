#!/bin/bash

# Define the path to your .env file and wp-config.php
ENV_FILE=".env"
WP_CONFIG_FILE="wordpress/wp-config.php"

# Check if the .env file exists
if [ ! -f "$ENV_FILE" ]; then
    echo "Error: .env file not found!"
    exit 1
fi

# Read the .env file and export variables
export $(grep -v '^#' $ENV_FILE | xargs)

# Check if wp-config.php exists, if not create a new one from sample
if [ ! -f "$WP_CONFIG_FILE" ]; then
    cp wordpress/wp-config-sample.php "$WP_CONFIG_FILE"
fi

# Populate wp-config.php with database details
sed -i "s/database_name_here/${DB_NAME}/" "$WP_CONFIG_FILE"
sed -i "s/username_here/${DB_USER}/" "$WP_CONFIG_FILE"
sed -i "s/password_here/${DB_PASSWORD}/" "$WP_CONFIG_FILE"
sed -i "s/localhost/${DB_HOST}/" "$WP_CONFIG_FILE"

echo "wp-config.php has been populated with database details."