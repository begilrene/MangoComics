class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @hasperm = @user.permission
    @comm = Comment.where(:user_id => @user.flists.all.map(&:followid)).or(Comment.where(wall_id: @user.userID))
    @icomments = @user.IComments.where.not('issue_id' => nil )
    store_location
  end
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the MangoComics!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
      # Handle a successful update.
    else
      render 'edit'
    end
  end
  
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end
  
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end
  
  def destroy
  end
  
  def icomments
    @user = User.find(params[:id])
    @icomments = @user.IComments
  end
  
  def get_icomm
    @user = User.find(params[:id])
    render 'icomments'
  end
    
  
   private

    def user_params
      params.require(:user).permit(:displayName, :email, :password,
                                   :password_confirmation, :personalBio, :firstname, :lastname, :profilePic)
    end
end
