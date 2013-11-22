# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#Railstutorial::Application.config.secret_key_base = '94cb3691babcee32fdd9a637a79abafa213dac2e75c4931f704d3d20795b86c1036888848bcc54fbdb9bdb3fb8f92c8a4a7d9bf8ddb4a10486662ff4f824032a'

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# Use the existing token
		File.read(token_file)
	else
		# Generate a new token an dstore it in token_file.
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

Railstutorial::Application.config.secret_key_base = secure_token
