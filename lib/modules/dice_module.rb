module Dice
  # simulate rolling dice
  def roll_dice(args)
    dice = []
    if args[:dice] != nil
      dice = args[:dice].map { |e| e = 1 + rand(6) }
      args[:dice] = dice
    else
      args[:dice_in_hand].times do |die|
        die = 1 + rand(6)
        dice << die
      end
    end
    return dice
  end
end
