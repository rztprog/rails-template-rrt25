# Rztprog Rails Template 2025 - RRT25
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
    gem "sassc-rails"
    gem "font-awesome-sass"
    gem "autoprefixer-rails"
    gem "tailwindcss-rails"

    # Dev
    gem "hotwire-livereload"
    gem "foreman"

    # Tools
    gem 'faker'
  RUBY
end

inject_into_file "Gemfile", after: "group :development, :test do" do
  "\n  gem \"dotenv-rails\""
end

# Assets
########################################
## Add stylesheets template
run "rm -rf app/assets/stylesheets"
run "rm -rf vendor"
run "curl -L https://github.com/rztprog/rails-template-rrt25/blob/main/rails-rrt25-stylesheets-master.zip > stylesheets.zip"
run "unzip stylesheets.zip -d app/assets && rm -f stylesheets.zip && rm -f app/assets/rails-stylesheets-master/README.md"
run "mv app/assets/rails-stylesheets-master app/assets/stylesheets"

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
  Rails app generated with [rztprog/rails-template-rrt25](https://github.com/rztprog/rails-template-rrt25), inspired by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
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
  run "bundle add cssbundling-rails"
  run "bundle install"
  run "rails css:install:tailwind"
  run "rails livereload:install && rails livereload:enable"


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

  # Javascript NPM Importmap
  ########################################
  ## For reference purpose
  # append_file "config/importmap.rb", <<~RUBY
  #   pin "bootstrap", to: "bootstrap.min.js", preload: true
  #   pin "@popperjs/core", to: "popper.js", preload: true
  # RUBY

  # append_file "config/initializers/assets.rb", <<~RUBY
  #   Rails.application.config.assets.precompile += %w(bootstrap.min.js popper.js)
  # RUBY

  # append_file "app/javascript/application.js", <<~JS
  #   import "@popperjs/core"
  #   import "bootstrap"
  # JS


  # append_file "app/assets/config/manifest.js", <<~JS
  #   //= link popper.js
  #   //= link bootstrap.min.js
  # JS

  # Heroku
  # run "bundle lock --add-platform x86_64-linux"

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
  git commit: "-m 'Initial commit with rztprog rails template 2025 - rrt25'"
end
