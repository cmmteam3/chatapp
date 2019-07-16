class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  has_many :thread_replies, dependent: :destroy
end
