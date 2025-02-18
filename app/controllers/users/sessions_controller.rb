# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_in_path_for(user)
    if current_user.characters.presence == nil
      character_select_user_path(user)
    else
      character_path(id: current_user)
    end
  end

  def after_sign_out_path_for(user)
    root_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(
      :sign_in, keys: [:email, :name, :password, :password_confirmation])
  end
end
