class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user
   has_many :thread_replies, dependent: :destroy
end
