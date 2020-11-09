class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :category
      t.datetime :date      
      t.references :user, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end