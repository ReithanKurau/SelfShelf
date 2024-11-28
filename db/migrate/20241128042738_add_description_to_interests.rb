class AddDescriptionToInterests < ActiveRecord::Migration[7.1]
  def change
    add_column :interests, :description, :text
  end
end
