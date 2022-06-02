class UsersController < ApplicationController
  def login
  end

  def login_form
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to("/users/show")
    else
      render("users/new")
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail_address, :password_digest)
  end

end
