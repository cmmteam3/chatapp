class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :name
      t.boolean :privacy
      t.belongs_to :workspace, foreign_key: true

      t.timestamps
    end
  end
end
