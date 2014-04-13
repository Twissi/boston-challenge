# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# rake db:seed

# Create user data
User.create! email: "admin@admin.com", role: "admin", password: "12345678", password_confirmation: "12345678"
User.create! email: "ben@ben.com", role: "ben", password: "12345678", password_confirmation: "12345678"

def create_challenge_for day
  Challenge.create! title: "challenge#{rand(1000)}", enabled: true, date: day
end

create_challenge_for Time.now.yesterday
create_challenge_for Time.now
create_challenge_for Time.now.tomorrow


