# Load the rails application
require File.expand_path('../application', __FILE__)

# adding this fixes the issue
require 'tzinfo'

# Initialize the rails application
Ey::Application.initialize!
