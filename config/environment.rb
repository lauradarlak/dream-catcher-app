require 'bundler'
Bundler.require

# establish connection between ActiveRecore and database
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
)

# require entre app dir
require_all "app"
