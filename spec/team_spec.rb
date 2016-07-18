require("spec_helper")

describe(Team) do
  describe("#player") do
    it("tells which players are on the team") do
      test_team = Team.create({:name => "Hornets"})
      test_player1 = Player.create({:name => "player1", :team_id => test_team.id})
      test_player2 = Player.create({:name => "player2", :team_id => test_team.id})
     expect(test_team.players()).to(eq([test_player1, test_player2]))
    end
  end
end
