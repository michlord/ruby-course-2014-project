class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
