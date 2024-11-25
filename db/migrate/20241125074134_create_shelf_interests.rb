class CreateShelfInterests < ActiveRecord::Migration[7.1]
  def change
    create_table :shelf_interests do |t|
      t.text :journal
      t.references :interest, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
