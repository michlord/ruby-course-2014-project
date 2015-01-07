class CreateCasts < ActiveRecord::Migration
  def change
    create_table :casts do |t|
      t.references :movie, index: true
      t.references :actor, index: true
      t.text :character

      t.timestamps null: false
    end
    add_foreign_key :casts, :movies
    add_foreign_key :casts, :actors
  end
end
