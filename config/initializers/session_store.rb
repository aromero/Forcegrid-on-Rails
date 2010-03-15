# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ITPARC_session',
  :secret      => '261f00ac37c8ae8ee7cb793eee7b17e50f45b8697e8175367836b462abf971a2fde9b932ebc4caebc48bd372b52242844a5032175e9542c4be456c58ff9163cd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
