# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
BostonChallenge::Application.initialize!

Time::DATE_FORMATS[:day_and_month] = '%a, %d.%m.'
