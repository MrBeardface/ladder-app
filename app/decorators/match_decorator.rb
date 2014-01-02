class MatchDecorator < Draper::Decorator
  delegate_all

  def match_complete?
  	winner?
  end

  def rank_changed?
  	challenger_victorious?
  end

  def match_played_at
  	played_at.to_s(:mini)
  end

  def challenge_issued_at
  	created_at.to_s(:mini)
  end

  def winner_name
  	if challenger_victorious?
  		challenger.name
  	else
  		challenged_player.name
  	end
  end

  def loser_name
  	if not challenger_victorious?
  		challenged_player.name
  	else
  		challenger.name
  	end
  end
  
  def challenger_name
  	challenger.name
  end

  def challenger_first_name
  	challenger.first_name
  end

  def challenged_player_name
  	challenged_player.name
  end

  def match_score
  	if challenger_victorious?
  		score = "#{challenger_game1}:#{challenged_player_game1}, #{challenger_game2}:#{challenged_player_game2}"
			if challenger_game3 != 0 or challenged_player_game3 != 0
				score = score + ", #{challenger_game3}:#{challenged_player_game3}"
			end
		else
			score = "#{challenged_player_game1}:#{challenger_game1}, #{challenged_player_game2}:#{challenger_game2}"
			if challenger_game3 != 0 or challenged_player_game3 != 0
				score = score + ", #{challenged_player_game3}:#{challenger_game3}"
			end
		end
		score
  end
end
