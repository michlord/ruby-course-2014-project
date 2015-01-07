class AddLanguageToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :language, :text
  end
end
