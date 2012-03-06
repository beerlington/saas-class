require './part2'
require 'ruby-debug'

describe Strategy do
  context 'paper' do
    specify 'paper beats rock' do
      (PaperStrategy.new > RockStrategy.new).should be_true
    end

    specify 'paper == paper' do
      (PaperStrategy.new == PaperStrategy.new).should be_true
    end

    specify 'paper loses to scissors' do
      (PaperStrategy.new < ScissorsStrategy.new).should be_true
    end
  end

  context 'rock' do
    specify 'rock beats scissors' do
      (RockStrategy.new > ScissorsStrategy.new).should be_true
    end

    specify 'rock == rock' do
      (RockStrategy.new == RockStrategy.new).should be_true
    end

    specify 'rock loses to paper' do
      (RockStrategy.new < PaperStrategy.new).should be_true
    end
  end

  context 'scissors' do
    specify 'scissors beats paper' do
      (ScissorsStrategy.new > PaperStrategy.new).should be_true
    end

    specify 'scissors == scissors' do
      (ScissorsStrategy.new == ScissorsStrategy.new).should be_true
    end

    specify 'scissors loses to rock' do
      (ScissorsStrategy.new < RockStrategy.new).should be_true
    end
  end
end

describe 'game winner' do
  context 'wrong number of players' do
    it 'should raise an error' do
      strategy =  [ ["Armando", "T"]]
      lambda { rps_game_winner(strategy) }.should raise_error(WrongNumberOfPlayersError)
    end
  end

  context 'invalid strategies' do
    it 'should raise an error' do
      strategy =  [ ["Armando", "T"], ["Dave", "S"] ]
      lambda { rps_game_winner(strategy) }.should raise_error(NoSuchStrategyError)
    end

    it 'should raise an error' do
      strategy =  [ ["Armando", "R"], ["Dave", "O"] ]
      lambda { rps_game_winner(strategy) }.should raise_error(NoSuchStrategyError)
    end
  end

  context 'game winner' do
    specify 'game 1' do
      players = [["Armando", "P"], ["Dave", "S"] ]
      rps_game_winner(players).should == ["Dave", "S"]
    end

    specify 'game 2' do
      players = [ ["Richard", "R"],  ["Michael", "S"] ]
      rps_game_winner(players).should == ["Richard", "R"]
    end

    specify 'game 3' do
      players = [ ["David E.", "R"], ["Richard X.", "P"] ]
      rps_game_winner(players).should == ["Richard X.", "P"]
    end

    specify 'game 4' do
      players = [ ["Allen", "S"], ["Omer", "P"] ]
      rps_game_winner(players).should == ["Allen", "S"]
    end

    specify 'game 5' do
      players = [ ["Allen", "S"], ["Omer", "S"] ]
      rps_game_winner(players).should == ["Allen", "S"]
    end
  end
end

describe 'tournament' do
  it 'should select the winner' do
    tournament = [ ["Armando", "P"], ["Dave", "S"] ]
    rps_tournament_winner(tournament).should == ["Dave", "S"]
  end

  it 'should select the winner' do
    tournament = [ [ [ "Allen", "P" ], [ "Dave", "S" ] ], [ [ "Richard", "R" ] , [ "Armando", "P" ] ]
    ]
    rps_tournament_winner(tournament).should == ["Dave", "S"]
  end

  it 'should select the winner' do
    tournament = [
      [ 
        [ [ "Allen", "P" ], [ "Dave", "S" ] ],
        [ [ "Richard", "R" ] , [ "Armando", "P" ] ]
    ], 
      [ 
        [ [ "Omer", "P" ], [ "David", "S" ] ],
        [ [ "Max", "R" ] , [ "Jonathan", "P" ] ]
    ]
    ]
    rps_tournament_winner(tournament).should == ["Dave", "S"]
  end

  it 'should select the winner' do
   tournament = [
      [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [ 
      [ ["Allen", "S"], ["Omer", "P"] ],
      [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
    ]

    rps_tournament_winner(tournament).should == ["Richard", "R"]
  end
end
