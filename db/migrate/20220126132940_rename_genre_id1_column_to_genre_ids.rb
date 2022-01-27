class RenameGenreId1ColumnToGenreIds < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :genre_id1, :genre_id
  end
end
