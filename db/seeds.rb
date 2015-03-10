require 'faker'

# # Create my user
# dale = User.new(
#   name:     'Dale Brown',
#   email:    'dalebrown5@gmail.com',
#   password: 'helloworld'
# )
# dale.skip_confirmation!
# dale.save!

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
user_id: "1",  
title: 'Test Topic'
)

Topic.create!(
user_id: "2", 
title: 'Funny'
)

Topic.create!(
user_id: "3", 
title: 'Programming'
)

topics = Topic.all

# Create Bookmarks
topics.each do |topic|
  2.times do
    topic.bookmarks.create!(
    user_id: "1",  
    url: Faker::Internet.url('example.com') 
  )
  end
end

# Create Bookmarks
topics.each do |topic|
  2.times do
    topic.bookmarks.create!(
    user_id: "2",  
    url: Faker::Internet.url('example.com') 
  )
  end
end

# Create Bookmarks
topics.each do |topic|
  2.times do
    topic.bookmarks.create!(
    user_id: "3",  
    url: Faker::Internet.url('example.com') 
  )
  end
end

bookmarks = Bookmark.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} lists created"
puts "#{Bookmark.count} items created"