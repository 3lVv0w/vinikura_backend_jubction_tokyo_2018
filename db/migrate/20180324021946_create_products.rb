class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :uuid
      t.string :image
      t.string :sell_status

      t.timestamps null: false
    end
  end
end
