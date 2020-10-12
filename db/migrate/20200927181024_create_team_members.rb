class CreateTeamMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :team_members do |t|
      t.belongs_to :company, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :profile_link
      t.string :email

      t.timestamps
    end
  end
end
