class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:password, :password_confirmation, :current_password],
    )

    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:email, :name, :password, :password_confirmation]
    )
  end

  def current_user_can_edit?(model)
    user_signed_in? &&
      (model.user == current_user || (model.try(:event).present? && model.event.user == current_user))
  end

  def pundit_user
    UserContext.new(current_user, cookies)
  end

  private
  def user_not_authorized
    flash[:alert] = I18n.t('pundit.errors.not_authorized')

    redirect_to(request.referer || root_path)
  end

end


