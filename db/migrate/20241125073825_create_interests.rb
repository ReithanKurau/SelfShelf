class CreateInterests < ActiveRecord::Migration[7.1]
  def change
    create_table :interests do |t|
      t.string :title
      t.string :creator
      t.integer :publishing_year
      t.string :genre
      t.string :media_type

      t.timestamps
    end
  end
end
