class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [ :google_oauth2 ]

  has_many :user_books, dependent: :destroy
  has_many :books, through: :user_books

  # Validations
  validates :username, presence: true

  # Remove explicit email validation because Devise :validatable handles it
  # validates :email, presence: true

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    puts "DEBUG: Starting User.from_google with #{email}"

    # 1. Find or Initialize
    user = where(uid: uid, provider: "google_oauth2").first_or_initialize
    puts "DEBUG: User Initialized (New? #{user.new_record?})"

    # 2. Set Attributes
    user.email = email
    user.username = full_name.presence || email.split("@").first
    user.avatar_url = avatar_url

    # 3. SET DUMMY PASSWORD (REQUIRED)
    # Use a solid random string, ensure it's never nil
    if user.new_record?
      user.password = Devise.friendly_token(20)
    end

    # 4. Attempt Save
    if user.save
      puts "DEBUG: User Saved Successfully!"
    else
      puts "DEBUG: User Save Failed!"
      puts "DEBUG: User Errors - #{user.errors.full_messages}"
    end

    user
  end
end
