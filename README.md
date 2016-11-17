# Liars Dice

To start Liars Dice first clone the repository.
Then bundle the Gemfile
`> bundle`

### Launch IRB session from console and load game
```
> irb
> load './lib/game.rb'
```

### Initialize a game
You may have as many or as little players as you want.
`game = Game.new(players: 4)`

### Make a move
In order to move dice from a players hand to the table.
Remember we are playing with a 6 sided die, so the value of any die can be no more than 6.
move method arguments: (player: "Players ID", dice: "count of dice to move", value: "value of dice to move")
```
game.move(player: 1, dice: 2, value: 3)
game.move(player: 2, dice: 1, value: 3)
```

### Make a claim
Claim how many dice of a particular value you believe there are in all of the dice in the game.
claim method arguments: (dice: "count of dice to claim", value: "value of dice to claim")
`game.claim(dice: 6, value: 3)`


### Challenge
Challenge a claim to see if you are right!
challenge method arguments: (dice: "count of dice to challenge", value: "value of dice to challenge")
`game.challenge(dice: 19, value: 3) => false`
