class IncomingController < ApplicationController
  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
  end

  def create

    puts ">>>>>>>>>> #{params.inspect}"
    
    @user = User.find_by(email: params[:sender]) 
    @topic = Topic.find_by(email: params[:subject])
    @url = params["body-plain"]

    # if user == nil?
    # end

    # if topic == nil?
    # end

    # You put the message-splitting and business
    # magic here.
    # Find the user by using params[:sender]
    # Find the topic by using params[:subject]
    # Assign the url to a variable after retreiving it from params["body-plain"]
    # Check if user is nil, if so, create and save a new user
    # Check if the topic is nil, if so, create and save a new topic
    # Now that we're sure we have a valid user and topic, build and save a new bookmark
    # Assuming all went well. 

    head 200
  end
  
end
