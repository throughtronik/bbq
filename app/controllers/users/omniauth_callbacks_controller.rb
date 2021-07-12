class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    authorize(__method__)
  end

  def vkontakte
    authorize(__method__)
  end

  def authorize(provider)
    @user = User.find_for_provider_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = I18n.t(
        'devise.omniauth_callbacks.failure',
        kind: provider.capitalize,
        reason: I18n.t('errors.oauth_auth_error')
      )

      redirect_to root_path
    end
  end
end
