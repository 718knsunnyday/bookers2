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

  def create
    @book=Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
