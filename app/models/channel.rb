class Channel < ApplicationRecord
  belongs_to :workspace
  has_many :messages, dependent: :destroy
   has_many :channels_user, dependent: :destroy
   has_many :users, through: :channels_user
  validates :name,{presence:true,length:{maximum:255}}
end
