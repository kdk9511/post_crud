class BoardController < ApplicationController
  def index
    @all_post = Post.all
    
  end

  def show
    post_id = params[:id]
    @post = Post.find(post_id)
  end

  def new
    
  end

  def create
    new_post = Post.new(title: params[:title],
                        editor: params[:editor],
                        content: params[:content])
    new_post.save
    redirect_to '/'
  end

  def edit
    post_id = params[:id]
    @post = Post.find(post_id)
  end

  def update
    update_post = Post.find(params[:id])
    update_post.title = params[:title]
    update_post.editor = params[:editor]
    update_post.content = params[:content]
    
    update_post.save
    redirect_to "/board/show/#{update_post.id}"
  end
  def destroy
    post_id = params[:id]
    post = Post.find(post_id)
    post.destroy
    
    redirect_to '/'  # ???
    # redirect_to :back
    
  end
end
