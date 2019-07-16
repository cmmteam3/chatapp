class CreateThreadReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :thread_replies do |t|
      t.string :text
      t.belongs_to :message, foreign_key: true

      t.timestamps
    end
  end
end
