class Team < ActiveRecord::Base
  has_many(:players)
  has_one(:team_coordinators)
end
