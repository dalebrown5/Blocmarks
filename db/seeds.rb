require 'faker'

# Create test admin user
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld'
)
admin.skip_confirmation!
admin.save!

# Create test member user
premium = User.new(
  name:     'Premium User',
  email:    'premium@example.com',
  password: 'helloworld'
)
premium.skip_confirmation!
premium.save!

# Create test member user
standard = User.new(
  name:     'Standard User',
  email:    'standard@example.com',
  password: 'helloworld'
)
standard.skip_confirmation!
standard.save!


users = User.all

Topic.create!(
# user: user,  
title: 'Test Topic'
)

Topic.create!(
# user: user,  
title: 'Funny'
)

Topic.create!(
# user: user,  
title: 'Programming'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} lists created"
# # puts "#{.count} items created"