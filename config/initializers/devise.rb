# frozen_string_literal: true

Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # Devise will use the `secret_key_base` as its `secret_key`
  # by default. You can change it below and use your own secret key.
  config.secret_key = "fd440b3c6c279e240f27ff09ac2e668ca462cd68188923356c6282926f523b67c6df4e1f77fa37bf0227010fe2b9be1aad7bdbce193844a9de89d9ad3a533154"

  # ==> Controller configuration
  # Configure the parent class to the devise controllers.
  # config.parent_controller = 'DeviseController'

  # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in Devise::Mailer,
  # note that it will be overwritten if you use your own mailer class
  # with default "from" parameter.
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"

  # Configure the class responsible to send e-mails.
  # config.mailer = 'Devise::Mailer'

  # ==> ORM configuration
  require "devise/orm/active_record"

  # ==> Configuration for any authentication mechanism
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [ :http_auth ]

  # ==> Configuration for :database_authenticatable
  config.stretches = Rails.env.test? ? 1 : 12

  # ==> Configuration for :recoverable
  config.reset_password_within = 6.hours
  config.sign_in_after_reset_password = true

  # ==> Configuration for :validatable
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Configuration for :lockable
  config.lock_strategy = :failed_attempts
  config.unlock_keys = [ :email ]
  config.unlock_strategy = :both
  config.maximum_attempts = 20
  config.unlock_in = 1.hour
  config.last_attempt_warning = true

  # ==> Navigation configuration
  config.sign_out_via = :delete
  config.navigational_formats = [ "*/*", :html, :turbo_stream ]

  # ==> Hotwire/Turbo configuration
  config.responder.error_status = :unprocessable_content
  config.responder.redirect_status = :see_other

  # ==========================================
  # IMPORTANT: OMNIAUTH CONFIGURATION
  # ==========================================

  # 1. Define the path prefix so Devise knows where to listen
  config.omniauth_path_prefix = "/users/auth"

  # 2. Configure the Google OAuth2 Strategy
  #    - Uses Environment Variables
  #    - Requests 'email' and 'profile' scopes
  #    - Forces the 'select_account' prompt
  config.omniauth :google_oauth2,
                  ENV["GOOGLE_OAUTH_CLIENT_ID"],
                  ENV["GOOGLE_OAUTH_CLIENT_SECRET"],
                  {
                    scope: "email, profile",
                    prompt: "select_account",
                    image_aspect_ratio: "square",
                    image_size: 50,
                    # Verify token validity
                    skip_jwt: true
                  }
end
