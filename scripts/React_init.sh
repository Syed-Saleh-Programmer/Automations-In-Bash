#!/bin/bash

# Function to display a loading bar
show_loading_bar() {
  local duration=$1
  local current=0
  local bar_length=40

  while [ $current -le $duration ]; do
    local filled_length=$((current * bar_length / duration))
    local empty_length=$((bar_length - filled_length))
    
    local bar_filled=$(printf "%0.s#" $(seq 1 $filled_length))
    local bar_empty=$(printf "%0.s-" $(seq 1 $empty_length))
    
    printf "\r[%s%s] %d%%" "$bar_filled" "$bar_empty" $((current * 100 / duration))

    sleep 1
    ((current++))
  done
  printf "\n"
}

# Prompt user for the project name
echo "Enter the project name:"
read project_name

# Prompt user for Tailwind CSS installation
echo "Do you want to install Tailwind CSS? (y/n):"
read install_tailwind

# Create a new React app with Vite
echo "Creating a new React app using Vite..."
npm create vite@latest "$project_name" -- --template react &

# Show loading bar while the app is being created (estimated duration 15 seconds)
show_loading_bar 15

# Navigate into the project directory
cd "$project_name" || exit

# Install the necessary packages
echo "Installing dependencies..."
npm install &

# Show loading bar while npm install is running (estimated duration 20 seconds)
show_loading_bar 20

# Check if the user wants to install Tailwind CSS
if [ "$install_tailwind" == "y" ]; then
  echo "Installing Tailwind CSS..."
  
  # Install Tailwind CSS and its peer dependencies
  npm install -D tailwindcss postcss autoprefixer &

  # Show loading bar while Tailwind CSS is being installed (estimated duration 10 seconds)
  show_loading_bar 10

  # Initialize Tailwind CSS configuration files
  npx tailwindcss init -p

  # Inform the user about updating the Tailwind config
  echo "Tailwind CSS has been installed. Remember to configure 'tailwind.config.js' and your CSS files."
fi

echo "Setup complete! Your React app is ready."
