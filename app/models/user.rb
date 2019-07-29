class User < ApplicationRecord
	  has_secure_password
	  has_many :users_workspace, dependent: :destroy
      has_many :workspaces, :through => :users_workspace
      has_many :messages
      has_many :channels_user,dependent: :destroy
      has_many :channels, :through => :channels_user
	  validates :name,{presence:true,length:{maximum:255}}
      validates :email,{presence:true,uniqueness:true,length:{maximum:255}}
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
     validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
     validates :password,{presence:true,length:{minimum:6}}
     validates :password_confirmation,{presence:true,length:{minimum:6}}      
end
