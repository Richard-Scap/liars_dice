module GameHelper
  def player(args)
    @players.find { |p| [:id] == args[:player] }
  end

  def players
    return @players
  end

  def total_dice
    return @total_dice
  end

  def dice_on_table
    return @dice_on_table
  end

  #create factorial function for probablility equation
  def fact(num)
    (1..num).reduce(:*) || 1
  end

  # probablility = n! / k! (n - k)! * (1/6)^k * (5/6)^(n-k)
  # n = total dice; k = claimed dice of same value
  def probability(n, k)
    probability = fact(n) / fact(k) * fact(n - k) * (1.0/6.0) ** k * (5.0/6.0) ** (n-k)
    return probability
  end

end
