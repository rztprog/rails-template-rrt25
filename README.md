# <p align='center'>Rztprog Rails Template 2026 - RRT25 🚀</p>
## <p align='center'>Last updated : 2026 / 03 / 21</p>

Welcome to the **Rztprog Rails Template 2026 (RRT26)**, a Rails starter template optimized for a modern workflow, integrating TailwindCSS, Hotwire, and productivity tools.

## Prerequisites 🛠️

Tested with :

- **Ruby** version >= 3.4.9
- **Rails** version >= 8.1.2
- **PostgreSQL** for the database
- **Git** for version control

## Installation 📥

1. **Create your new Rails application in terminal with this template :**

```bash
rails new \
  -d postgresql \
  -m https://raw.githubusercontent.com/rztprog/rails-template-rrt26/refs/heads/main/minimal.rb \
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
