# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  before_action :authenticate_user!, only: [:create, :show, :edit]


  # GET /resource/sign_up
    def new
      @user = User.new
    end

  # POST /resource
    def create
      @user = User.new
      if @user.save
        user_session[:user_id] = current_user.id
        redirect_to("/users/#{current_user.id}/edit")
      else
        render("users/registrations/new")
      end
    end

  #GET /users/show
    def show
    end


  # GET /resource/edit
    def edit
      @user = User.find_by(id: params[:id])
    end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
    def after_sign_up_path_for(resource)
      user_path(resource)
    end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

end
