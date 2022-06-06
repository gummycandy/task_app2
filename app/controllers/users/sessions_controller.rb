# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/new
    def new
    end

  # POST /resource/sign-in
    def sign_in
      @user = User.find_by(authenticate_user_params)
      if @user
        session[:user_id] = @user.id
        flash[:notice] = "ログインしました"
        redirecto_to("/")
      else
        @error_message = "メールアドレスまたはパスワードが間違っています"
        @email = params[:email]
        @password = params[:encrypted_password]
        render("users/sessions/new")
      end
    end

    def logout
      session[:user_id] = nil
      flash[:notice] = "ログアウトしました"
      redirect_to("/login")
    end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

    def authenticate_user_params
      params.require(:user).permit(:email, :encrypted_password)
    end

end

