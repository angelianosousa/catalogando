class CreateLandpages < ActiveRecord::Migration[7.2]
  def change
    create_table :landpages do |t|
      t.references :entity, null: false, foreign_key: true
      t.string :banner
      t.string :logo
      t.boolean :open, default: false

      t.timestamps
    end
  end
end
