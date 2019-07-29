class ThreadReply < ApplicationRecord
  belongs_to :message
  belongs_to :channel
  belongs_to :user
end
