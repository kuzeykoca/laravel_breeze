#!/bin/bash

# Exit on any error
set -e

# Check if project name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <project-name>"
  exit 1
fi

PROJECT_NAME=$1

# Create Laravel project
composer create-project laravel/laravel:^12.0 "$PROJECT_NAME"

# Change directory to project
cd "$PROJECT_NAME"

# Require Laravel Breeze
composer require laravel/breeze --dev

# Install Breeze with React and Pest
php artisan breeze:install react --pest

echo "✅ Laravel app '$PROJECT_NAME' created and Breeze installed with React + Pest."
