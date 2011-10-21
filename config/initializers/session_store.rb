# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_workshop_session',
  :secret      => 'f0280563384eef5ff7a443daddcac9fccb7fba5eebcc6e1503a8a07597c5e522983675e7a82030552014afad2c73d2b1b028cc57067228df13af790405f2046c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
