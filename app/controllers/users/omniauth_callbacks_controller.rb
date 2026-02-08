class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    from_google_params = from_google_params

    if from_google_params.nil?
      redirect_to new_user_session_path, alert: "Could not authenticate via Google (Params missing)."
    else
      # Get User Object (Regardless of Persistence)
      @user = User.from_google(**from_google_params)

      if @user && @user.persisted?
        sign_out_all_scopes
        flash[:notice] = t "devise.omniauth_callbacks.success", kind: "Google"
        sign_in_and_redirect @user, event: :authentication
      else
        error_msg = @user ? @user.errors.full_messages.join(", ") : "User object is nil"
        redirect_to new_user_session_path, alert: "Validation Failed: #{error_msg}"
      end
    end
  end

  protected

  def after_omniauth_failure_path_for(_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  private

  def from_google_params
    return nil unless auth.present?

    @from_google_params ||= {
      uid: auth.uid,
      email: auth.info.email,
      full_name: auth.info.name,
      avatar_url: auth.info.image
    }
  end

  def auth
    @auth ||= request.env["omniauth.auth"]
  end
end
