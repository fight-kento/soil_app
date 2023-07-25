class PostsController < ApplicationController


  def index
    @posts = Post.all.order(created_at: :desc)
    @likes_count = {}
    @posts.each do |post|
      @likes_count[post.id] = Like.where(post_id: post.id).count
    end
  end

  def  show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      titles: params[:titles],
      content: params[:content],
      user_id: current_user.id)
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
  
  def post_params
    params.require(:@post).permit(:title, :content)
  end

end
