class CreateMyAjs < ActiveRecord::Migration[5.2]
  def change
    create_table :my_ajs do |t|
      t.string :name

      t.timestamps
    end
  end
end
