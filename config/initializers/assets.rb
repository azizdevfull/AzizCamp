# Be sure to restart your server when you modify this file.
Rails.application.config.assets.precompile += %w( application.scss )
# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"
Rails.application.config.assets.precompile += %w( main.css )
# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.precompile += %w( register.css )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( project.css )
Rails.application.config.assets.precompile += %w( navbar.css )
Rails.application.config.assets.precompile += %w( new_project.css )
Rails.application.config.assets.precompile += %w( menu.css )
Rails.application.config.assets.precompile += %w( project_show.css )
Rails.application.config.assets.precompile += %w( poster.css )
Rails.application.config.assets.precompile += %w( attacher.css )
Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( moderator_att.css )
Rails.application.config.assets.precompile += %w( poster_new.css )
