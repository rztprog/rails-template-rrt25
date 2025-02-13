# Rztprog Rails Template 2025 - RRT25 🚀

Welcome to the **Rztprog Rails Template 2025 (RRT25)**, a Rails starter template optimized for a modern workflow, integrating TailwindCSS, Hotwire, and productivity tools.

## Prerequisites 🛠️

Before starting, make sure you have the following installed:

- **Ruby** version >= 3.0
- **Rails** version >= 7.1
- **PostgreSQL** for the database
- **Git** for version control

## Installation 📥

1. **Create your new Rails application with this template:**

```bash
rails new \
  -d postgresql \
  -m https://raw.githubusercontent.com/rztprog/rails-template-rrt25/refs/heads/main/minimal.rb \
  CHANGE_THIS_TO_YOUR_RAILS_APP_NAME
```


2. **Run the following commands after installing the template to get your project started:**
```
cd CHANGE_THIS_TO_YOUR_RAILS_APP_NAME
bundle install
foreman start
```
This will install all the necessary dependencies and start both the Rails server and the TailwindCSS watcher.

## Features 🌟
- PostgreSQL: Default configuration for PostgreSQL as your database.
- TailwindCSS: TailwindCSS integration for fast and modern design.
- Hotwire: Hotwire technology for a reactive user interface.
- Foreman: Uses foreman to manage processes like the server and watchers during development.

## Development 🚀
To start the Rails server and the TailwindCSS watcher, use the following command:

```
foreman start
```
This will launch both processes simultaneously, allowing you to see server-side and CSS changes in real-time.

## Project Structure 📁
Here’s what the default file structure looks like for this template:

- app/ : Contains your Rails application (controllers, views, models, etc.).
- config/ : Configuration files for your application, including TailwindCSS integration.
- assets/ : Contains your CSS and JavaScript files.
- Procfile : Configuration for Foreman to manage multiple processes.
- .gitignore : Ignores sensitive files like .env.
