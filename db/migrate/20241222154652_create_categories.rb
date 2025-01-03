class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :entity, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
