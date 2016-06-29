# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'


Rails.application.config.assets.paths << "#{Rails.root}/client/src"
Rails.application.config.assets.paths << "#{Rails.root}/client/images"
Rails.application.config.assets.paths << "#{Rails.root}/client/stylesheets"
Rails.application.config.assets.paths << "#{Rails.root}/client/bower_components"

Rails.application.config.assets.precompile += %w( app.js app.css )

Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
Rails.application.config.assets.precompile << /\.(?:png|jpg)\z/
