class Workspace < ApplicationRecord
	has_many :users_workspace, dependent: :destroy
has_many :users, :through => :users_workspace
has_many :channels, dependent: :destroy
	 validates :name,{presence:true,length:{maximum:255}}
end
