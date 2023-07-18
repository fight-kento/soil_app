class UsersController < ApplicationController
  before_action :authenticate_user!, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user!, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user!, {only: [:edit, :update]}

  def index
    @users = User.all
  end


  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
   @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if params[:image]
      @user.image = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image}", image.read)
    end
    
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
 end

 def likes
  @user = User.find_by(id: params[:id])
  @likes = Like.where(user_id: @user.id)
 end

  
end
