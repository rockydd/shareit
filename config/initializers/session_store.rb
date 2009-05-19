# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sharestore_session',
  :secret      => 'eb475524da3326c03a833c700a76cf52a8ff97fe82eb4ffb6e5302e25f89ec6b47f79694ce4ff91e590aa6460126e6f257ce02458800955adb4d952300b82b5c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
