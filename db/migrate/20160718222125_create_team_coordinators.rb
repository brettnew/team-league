class CreateTeamCoordinators < ActiveRecord::Migration
  def change
    create_table(:team_coordinators) do |t|
      t.column(:name, :string)
      t.column(:team_id, :integer)
    end
  end
end
