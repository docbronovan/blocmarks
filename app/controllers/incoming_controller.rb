class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    puts "INCOMING PARAMS HERE: #{params}"

    # You put the message-splitting and business
    # magic here.
    # Find the user by using params[:sender]
    @user = params[:sender]
    # Find the topic by using params[:subject]
    @topic = params[:subject]
    # Assign the url to a variable after retreiving it from params["body-plain"]
    @url = params["body-plain"]
    # Check if user is nil, if so, create and save a new user
    if @user = nil
      @user = User.create!( email: @user)
    # Check if the topic is nil, if so, create and save a new topic
    if @topic = nil
      @topic = Topic.create!(title: @topic)
    end
    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    Bookmark.create!(
      url: @url
      topic_id = (Topic.find_by title: @topic).id
      )
    # Assuming all went well.
    head 200
  end
end