class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum provider: [:google, :facebook]

  after_create :update_user_token!
  has_one_attached :avatar

  def as_json(options = {})
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      token: token,
      email: email,
      provider: provider,
      avatar: user_avatar
    }
  end

  def user_avatar
    if self.avatar.attached?
      url_for(self.avatar)
    elsif self.avatar_url
      self.avatar_url
    else
      ""
    end
  end

  def is_admin?
    has_role? :admin
  end

  require 'securerandom'
  def self.from_google(provider, user_data, token)
    where(provider: provider, uid: user_data['id']).first_or_create do |user|
      user.uid = user_data['id']
      user.token = token
      user.email = user_data['email']
      user.first_name = user_data['first_name']
      user.last_name = user_data['last_name']
      user.avatar_url = user_data['avatar_url']
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def update_user_token!
    if self.token.nil?
      self.token = Devise.friendly_token
      self.save
    end
  end
end
