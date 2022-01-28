class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.date :date, null: false
      t.string :place, null: false
      t.integer :charge, null: false
      t.text :content, null: false
      t.integer :impressions_count, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
