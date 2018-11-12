# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
  - Sinatra specified as a dependency in the project's Gemfile
  - `Bundler.require` in config/environment.rb requires all gems, including Sinatra
  - Sinatra methods are used to create HTTP routes and manage requests
- [x] Use ActiveRecord for storing information in a database
  - `Bundler.require` in config/environment.rb requires all gem dependencies specified in Gemfile, including `activerecord`, `sinatra-activerecord`, and `rake`
  - Connection established between ActiveRecore and database in config/environment.rb
  - environment and Raketasks are required in a Rakefile
  - Migrations created to build project models
- [x] Include more than one model class (e.g. User, Post, Category)
  - Model classes include: `DreamTheme`, `Dream`, `Theme`, and `User`
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
  - User model has_many relationships include: `has_many :dreams` and `has_many :themes, through: :dreams`
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
  - Dream model belongs_to User model
  - Join Table, dreams and themes belong to DreamTheme model
- [x] Include user accounts with unique login attribute (username or email)
  - User model includes Active Record validations for unique username and email attributes
  - Validations are triggered in the UsersController when the `.save method` is called on an instantiated user (line 24)
  - `bcrypt` gem hashes and salts passwords for security
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  - DreamController contains CRUD routes to perform the following actions on User Dreams: new, show, edit, delete.
- [x] Ensure that users can't modify content created by other users
  - The sessions hash user_id key is set equal to the user's ID upon login.
  - A current_user helper method finds the user whose ID is set to the session hash user_id key.
  - Throughout the DreamController, `@dream.user == current_user` is used to ensure that the session[:user_id] matches the user ID associated to a particular dream.
- [x] Include user input validations
  - Validations include: Dream has a unique name, users' email and username are unique
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
