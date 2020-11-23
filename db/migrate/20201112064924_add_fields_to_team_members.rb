class AddFieldsToTeamMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :team_members, :note, :string
  end
end
