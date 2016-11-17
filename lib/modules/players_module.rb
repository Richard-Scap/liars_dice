module Players
  # create players hash & roll initial 5 dice
  def create_players
    @player_ids.each do |id|
      p = { id: id,
            dice: nil,
            count_on_table: nil,
            dice_in_hand: 5
      }
      @players << p
      p[:dice] = roll_dice(@players.select {|x| x[:id] == p[:id]}[0])
    end
  end

end
