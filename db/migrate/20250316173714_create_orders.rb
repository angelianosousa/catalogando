class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :entity, null: false, foreign_key: true
      t.decimal :total_value

      t.timestamps
    end
  end
end
