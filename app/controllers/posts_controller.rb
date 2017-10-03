class PostsController < ApplicationController
  before_action :set_post
  
  def show
    
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end
