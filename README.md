# Liars Dice

###### To start Liars Dice first clone the repository
###### Then bundle the gemfile
`> bundle`
###### Launch IRB session and load game
`> load './lib/game.rb'`

`game = Game.new(players: 4)`
`game.move(player: 1, dice: 2, value: 3)`
`game.move(player: 2, dice: 1, value: 3)`
`game.claim(dice: 6, value: 3)`
`game.challenge(dice: 19, value: 3) => false`
