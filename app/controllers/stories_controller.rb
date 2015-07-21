class StoriesController < ApplicationController
  def list
    @user = User.find(params["user_id"])
    @stories = @user.stories
  end
  
  def new_form
    @user = User.find(params["user_id"])
    @story = Story.new
  end
  
  def new_form_do
    @user = User.find(params["user_id"])
    @story = Story.new(params["stories"].permit(:name, :user_id))
    if @story.save
      redirect_to "/users/#{@user.id}/stories/#{@story.id}"
    else
      render :"stories/new_form"
    end
  end
  
  def delete_form
    @user = User.find(params["user_id"])
    @story = Story.find(params["story_id"])
  end
  
  def delete_form_do
    @user = User.find(params["user_id"])
    @story = Story.find(params["story_id"])
    if @story.delete
      redirect_to "/users/#{@user.id}/stories"
    else
      render :"stories/delete_form"
    end
  end
  
  def edit_form
    @user = User.find(params["user_id"])
    @story = Story.find(params["story_id"])
  end
  
  def edit_form_do
    @user = User.find(params["id"])
    @story = Story.find(params["story_id"])
    if @story.update(params["stories"].permit(:name, :user_id))
      redirect_to "/users/#{@user.id}/stories/#{@story.id}"
    else
      render :"stories/edit_form"
    end
  end
  
  def single
    @user = User.find(params["user_id"])
    @story = Story.find(params["story_id"])
  end
end
