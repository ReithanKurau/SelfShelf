class AddStyleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :style, :string
  end
end
