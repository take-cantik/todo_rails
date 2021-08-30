class User < ActiveRecord::Base
  devise :trackable, :omniauthable, omniauth_providers: %i(google)

  has_many :columns

  protected
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.create(
        name:     auth.info.name,
        email:    auth.info.email,
        provider: auth.provider,
        uid:      auth.uid,
        token:    auth.credentials.token,
        password: Devise.friendly_token[0, 20],
        meta:     auth.to_yaml
      )
    end
    user
  end
end
