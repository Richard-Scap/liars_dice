require './lib/modules/game_helper.rb'
require './lib/modules/players_module.rb'
require './lib/modules/dice_module.rb'

class Game
  include Players
  include Dice
  include GameHelper

  def initialize(args)
    @player_ids = (1..args[:players]).to_a
    @total_dice = args[:players] * 5
    @dice_on_table = []
    @players = []
    create_players
  end

  # player moves selected dice from hand to the table,
  # and rerolls the remaining dice in their hand
  # game.move(player: 1, dice: 2, value: 3)
  def move(args) # player: n, dice: k, value: x
    current_player = @players.select { |x| x[:id] == args[:player]}[0]
    value = args[:value]
    die_check = 0

    current_player[:dice].each do |die|
      die_check += 1 if die == value
    end
    if die_check >= args[:dice]
      current_player[:dice].delete_if do |die|
        if die == value
          @dice_on_table << die
          true
        end
      end
      current_player[:dice_in_hand] = current_player[:dice].count
      current_player[:count_on_table] = args[:dice]
      puts "Move successful. Rolling remaining dice in player's hand..."
      roll_dice(current_player)
    else
      puts "You can't move what you don't have!"
    end
  end

  #player makes a claim that x number of dice of y value exist in the total dice
  def claim(args)
    dice_left = @total_dice - @dice_on_table.count
    claim_count = args[:dice]
    claimed_value_on_table = 0
    @dice_on_table.each do |die|
      claimed_value_on_table += 1 if die == args[:value]
      true
    end
    unless dice_left == 1 && claim_count - claimed_value_on_table == 1
      return probability(dice_left, claim_count - claimed_value_on_table ) + probability(dice_left, dice_left)
    else
      return probability(dice_left, claim_count - claimed_value_on_table )
    end
  end

  # game.challenge(dice: 19, value: 3) => false
  def challenge(args) #args = dice: x, value: y
    dice_challenged = []

    @dice_on_table.each do |die|
      dice_challenged << die if die == args[:value]
    end

    @players.each do |player|
      player[:dice].each do |die|
        dice_challenged << die if die == args[:value]
      end
    end
    return dice_challenged.count >= args[:dice]
  end
end
