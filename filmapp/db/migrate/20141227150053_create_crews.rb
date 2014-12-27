class CreateCrews < ActiveRecord::Migration
  def change
    create_table :crews do |t|
      t.references :movie, index: true
      t.text :name
      t.text :function
      t.text :role

      t.timestamps null: false
    end
    add_foreign_key :crews, :movies
  end
end
