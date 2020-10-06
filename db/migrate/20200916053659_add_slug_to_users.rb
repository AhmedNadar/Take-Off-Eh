class AddSlugToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
    add_column :users, :suggested_url, :string
  end
end
