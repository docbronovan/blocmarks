class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @bookmarks = Bookmark.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
    #@count = @topic.bookmarks.count
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    #@topic = Topic.new(params.require(:topic).permit(:title,:user))
    @topic = current_user.topics.new(params.require(:topic).permit(:title,:user))
    
    #@topic.user_id = current_user.id
    if @topic.save
      flash[:notice] = "Topic was saved."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the topic. Please try again."
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "Topic was removed."
    else
      flash[:notice] = "Topic couldn't be deleted. Try again"
    end
    redirect_to topics_path
  end


end
