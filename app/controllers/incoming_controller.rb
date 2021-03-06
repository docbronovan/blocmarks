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

    # Find the topic by using params[:subject]

    # Assign the url to a variable after retreiving it from params["body-plain"]
    @url = params["body-plain"]
    # Check if user is nil, if so, create and save a new user
    @user = User.find_or_create_by(email: params[:sender])
    # Check if the topic is nil, if so, create and save a new topic

    @topic = Topic.find_or_create_by(title: params[:subject])

    #verify url looks like a url, if not skip



    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    Bookmark.create!(
      url: @url,
      topic: @topic,
      user: @user
      )
    # Assuming all went well.
    head 200
  end


end