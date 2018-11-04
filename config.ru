# this require will also require app dir
require './config/environment.rb'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise "Migrations are pending. Run 'rake db:migrate' to resolve this issue."
end

run ApplicationController
