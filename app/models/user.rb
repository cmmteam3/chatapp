class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      has_many :users_workspace
      has_many :workspaces, :through => :users_workspace
      has_many :messages
      has_many :channels_user
      has_many :channels, :through => :channels_user
end
