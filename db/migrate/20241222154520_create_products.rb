class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.monetize :price, default: 1
      t.decimal :discount, default: 0
      t.boolean :visible, default: false
      t.references :entity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
