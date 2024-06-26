class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

      def self.from_google(u)
          create_with(uid: u[:uid], provider: 'google',
                      password: Devise.friendly_token[0, 20]).find_or_create_by!(email: u[:email])
      end

      def self.from_omniauth(auth)
        find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0, 20]
        end
      end
end
