class AddFavouriteToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :favourite, :boolean
  end
end
