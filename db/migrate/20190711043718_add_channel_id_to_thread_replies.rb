class AddChannelIdToThreadReplies < ActiveRecord::Migration[5.2]
  def change
    add_column :thread_replies, :channel_id, :integer
  end
end
