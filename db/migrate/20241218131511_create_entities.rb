class CreateEntities < ActiveRecord::Migration[7.2]
  def change
    create_table :entities do |t|
      t.string :name
      t.boolean :active, default: true
      t.string :slug

      t.timestamps
    end

    add_index :entities, :slug, unique: true
  end
end
