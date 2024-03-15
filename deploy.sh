#!/usr/bin/env bash

# Update package index and install Node.js and npm
sudo apt update && sudo apt install nodejs npm

# Install pm2 - a production process manager for Node.js with a built-in load balancer
sudo npm install -g pm2

# Stop any instance of our application currently running
pm2 stop example_app

# Change directory to the folder where application is downloaded
cd SimpleApplication1/

# Install application dependencies
npm install

# Start the application with the process name example_app using pm2
pm2 start ./bin/www --name example_app
