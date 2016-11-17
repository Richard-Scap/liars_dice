require 'spec_helper.rb'

describe Game do

  before(:all) do
    @game = Game.new(players: 2)
    @player1 = @game.players.select { |x| x[:id] == 1 }[0]
    @player2 = @game.players.select { |x| x[:id] == 2 }[0]
    @player1[:dice] = [1, 1, 2, 2, 2]
    @player2[:dice] = [1, 1, 2, 2, 2]
  end

  describe 'initialize' do
    it "creates player hashes" do
      g = Game.new(players:2)
      expect(g).to be_an_instance_of(Game)
      expect(g.players).to include({:id => be_an(Integer),
                                    :dice => be_an(Array),
                                    :count_on_table => nil,
                                    :dice_in_hand => 5
                                  })
      expect(g.players.count).to equal(2)
    end

    it "calculates total dice" do
      expect(@game.total_dice).to equal(10)
    end
  end

  describe '#move' do
    it "moves player's dice to table" do
      @game.move(player: 1, dice: 2, value: 1)
      expect(@game.dice_on_table).to eq([1,1])
    end

    it "rerolls player's dice left in hand" do
      @game.move(player: 1, dice: 2, value: 1)
      expect(@player1[:dice_in_hand]).to equal(3)
      expect(@player1[:dice]).not_to equal([2,2,2]) #there is a small chance this test will fail in the event that the reroll yields the same result
    end
  end

  describe '#claim' do
    it "returns the probability of a claim" do
      @game.move(player: 1, dice: 2, value: 1)
      #test claim returns a float
      expect(@game.claim(dice: 4, value: 1)).to be_a(Float)
      #test probability function
      expect(@game.probability(1,1)).to equal(0.16666666666666666)
    end
  end

  describe '#challenge' do
    it "challenges a claim and returns a true of false" do
      expect(@game.challenge(dice: 4, value: 1)).to be(true)
      expect(@game.challenge(dice: 8, value: 1)).to be(false)
    end

  end
end
