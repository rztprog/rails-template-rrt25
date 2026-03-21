# Rztprog Rails Template 2026 - rrt26
# This boilerplate/template is inspired by https://raw.githubusercontent.com/lewagon/rails-templates/master/minimal.rb
########################################

# Before
## Stop spring on Mac
########################################
run "if uname | grep -q 'Darwin'; then pgrep spring | xargs kill -9; fi"

# Gemfile
########################################
## Add
inject_into_file "Gemfile", before: "group :development, :test do" do
  <<~RUBY
    # Style
    gem "autoprefixer-rails"
    gem "tailwindcss-rails"

    # Dev
    gem "hotwire-livereload"
    gem "foreman"

  RUBY
end

inject_into_file "Gemfile", after: "group :development, :test do" do
  <<~RUBY
    gem "dotenv-rails"
    gem "faker"
  RUBY
end

# Assets
########################################
## Add stylesheets template
run "rm -rf app/assets/stylesheets"
run "rm -rf vendor"
run "curl -L https://github.com/rztprog/rails-template-rrt26/raw/refs/heads/main/rails-rrt26-stylesheets-master.zip > stylesheets.zip"
run "unzip stylesheets.zip -d app/assets"
run "mv app/assets/rails-rrt26-stylesheets-master app/assets/stylesheets"

# Layout
########################################
## Add shrink-to-fit=no
gsub_file(
  "app/views/layouts/application.html.erb",
  '<meta name="viewport" content="width=device-width,initial-scale=1">',
  '<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">'
)

# README
########################################
markdown_file_content = <<~MARKDOWN
  Rails app generated with [rztprog/rails-template-rrt26](https://github.com/rztprog/rails-template-rrt26), inspired by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
MARKDOWN
file "README.md", markdown_file_content, force: true

# Generators
########################################
generators = <<~RUBY
  config.generators do |generate|
    generate.assets false
    generate.helper false
    generate.test_framework :test_unit, fixture: false
  end
RUBY

environment generators

# General Config
########################################
## Prevent Rails from throwing an exception if a callback references a method that does not exist in the controller
general_config = <<~RUBY
  config.action_controller.raise_on_missing_callback_actions = false if Rails.version >= "7.1.0"
RUBY

environment general_config


# After bundle
########################################
after_bundle do
  # Generators: db + tailwind + pages controller / home
  ########################################
  rails_command "db:drop db:create db:migrate"
  # generate("simple_form:install", "--bootstrap")
  generate(:controller, "pages", "home", "--skip-routes", "--no-test-framework")

  # Bundling
  ########################################
  run "bundle install"
  run "rails tailwindcss:install"

  # Procfile
  ########################################
  # Add Procfile configuration for Foreman
  run "rm -rf 'Procfile.dev'"
  run "touch 'Procfile.dev'"
  run "echo 'web: bin/rails server -b 0.0.0.0 -p 3000' > Procfile.dev"
  run "echo 'css: bin/rails tailwindcss:watch' >> Procfile.dev"
  run "mv Procfile.dev Procfile"

  # Routes
  ########################################
  route 'root to: "pages#home"'

  # Gitignore
  ########################################
  append_file ".gitignore", <<~TXT

    # Ignore .env file containing credentials.
    .env*

    # Ignore Mac and Linux file system files
    *.swp
    .DS_Store
  TXT
  
  # Gitignore
  ########################################
  run "mkdir app/views/shared"

  # Javascript NPM Importmap
  ########################################


  # Dotenv
  ########################################
  run "touch '.env'"

  # Rubocop
  ########################################
  # run "curl -L https://raw.githubusercontent.com/lewagon/rails-templates/master/.rubocop.yml > .rubocop.yml"

  # Git
  ########################################
  git :init
  git add: "."
  git commit: "-m 'Initial commit with rztprog rails template 2026 - rrt26'"
  
  # Final message
  ########################################
  puts "***************************"
  puts " "
  puts " "
  puts "   🎉 RRT26 Configuration is complete! 🎉"
  puts " "
  puts "   To start the server and Tailwind watcher, run:"
  puts "          foreman start or bin/dev"
  puts " "
  puts "          Enjoy building your app! 🚀"
  puts " "
  puts "***************************"
end
