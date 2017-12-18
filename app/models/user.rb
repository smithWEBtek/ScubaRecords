class User < ApplicationRecord
  #attr_accessor :login

  has_many :records
  has_many :sites, through: :records

  validates :username, presence: true
  validates :username, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
  data = access_token.info
  user = User.where(:email => data["email"]).first

    unless user
      password = Devise.friendly_token[0,20]
      user = User.create(username: data["name"], email: data["email"],
        password: password, password_confirmation: password
      )
    end
    user
  end

end
