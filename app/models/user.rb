class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :update_user_token!

  def is_admin?
    self.has_role? :admin
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def update_user_token!
    self.token = Devise.friendly_token
    self.save
  end
end
