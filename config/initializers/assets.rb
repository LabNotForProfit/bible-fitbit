# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( leaderboard/leaderboardsIndex.js )
Rails.application.config.assets.precompile += %w( timeline/index/timelineIndex.js )
Rails.application.config.assets.precompile += %w( timeline/edit/timelineEdit.js )
Rails.application.config.assets.precompile += %w( timeline/update/timelineUpdate.js )
Rails.application.config.assets.precompile += %w( friends/friendshipsIndex.js )
Rails.application.config.assets.precompile += %w( users/usersEdit.js )
Rails.application.config.assets.precompile += %w( users/userShow.js )

# Rails.application.config.assets.precompile += %w( dashboard/dashboard.css )
Rails.application.config.assets.precompile += %w( timeline/timeline.css )
Rails.application.config.assets.precompile += %w( timeline/index/timelineIndex.css )
Rails.application.config.assets.precompile += %w( bookreview/fillInBlanks.css )
Rails.application.config.assets.precompile += %w( bookreview/fillInBlanksIndex.js )
Rails.application.config.assets.precompile += %w( bookreview/fillInBlanksShow.js )
Rails.application.config.assets.precompile += %w( users/users.css )
# Rails.application.config.assets.precompile += %w( homeIndex.js )
# Rails.application.config.assets.precompile += %w( allBadges.js )
# Rails.application.config.assets.precompile += %w( jquery.classywiggle.js )
# Rails.application.config.assets.precompile += %w( jquery.knob.js )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
