class AddCoverToInterests < ActiveRecord::Migration[7.1]
  def change
    add_column :interests, :cover, :string
  end
end
