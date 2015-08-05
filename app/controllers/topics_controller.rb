class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @urls = @topic.urls

  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
  @topic = Topic.new(params.require(:topic).permit(:name))
  if @topic.save
    flash[:notice] = "Topic was saved."
    redirect_to @topic
  else
    flash[:error] = "There was an error saving the topic. Please try again."
    render :new
  end
  end

end
