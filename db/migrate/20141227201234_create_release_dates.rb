class CreateReleaseDates < ActiveRecord::Migration
  def change
    create_table :release_dates do |t|
      t.references :movie, index: true
      t.date :date
      t.text :country

      t.timestamps null: false
    end
    add_foreign_key :release_dates, :movies
  end
end
