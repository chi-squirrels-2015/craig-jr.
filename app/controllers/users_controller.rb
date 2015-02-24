class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.all
    @category
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.create!(user_params)
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You have been signed out."
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
