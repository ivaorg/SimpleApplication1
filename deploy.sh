#!/usr/bin/env bash

# Update package lists and install Node.js and npm
sudo apt update && sudo apt install nodejs npm

# Install pm2, a production process manager for Node.js with a built-in load balancer
sudo npm install -g pm2

# Stop any instance of our application running currently
pm2 stop example_app

# Change directory into folder where application is downloaded
cd SimpleApplication1/

# Install application dependencies
npm install

# Set up private key and server certificate
echo "$PRIVATE_KEY" > privatekey.pem
echo "$SERVER_CERTIFICATE" > server.crt

# Start the application with the process name example_app using pm2
pm2 start ./bin/www --name example_app
