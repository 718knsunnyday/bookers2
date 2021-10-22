class UsersController < ApplicationController

  def index
    @user=current_user
    @book=Book.new
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
    @book=Book.new
    @books=Book.where(user_id: @user.id)
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    user=User.find(params[:id])
    if user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(user.id)
    else
      render :update
    end
  end

  
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
end
