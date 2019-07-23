class User < ApplicationRecord
	  has_secure_password
	  has_many :users_workspace
	  has_many :workspaces, :through => :users_workspace
end
