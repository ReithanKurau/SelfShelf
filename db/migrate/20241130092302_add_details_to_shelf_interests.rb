class AddDetailsToShelfInterests < ActiveRecord::Migration[7.1]
  def change
    add_column :shelf_interests, :title, :string
    add_column :shelf_interests, :creator, :string
    add_column :shelf_interests, :publishing_year, :integer
    add_column :shelf_interests, :genre, :string
    add_column :shelf_interests, :media_type, :string
    add_column :shelf_interests, :description, :text
    add_column :shelf_interests, :cover_url, :string
  end
end
