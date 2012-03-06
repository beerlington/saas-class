class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

class Player
  attr_reader :name, :strategy

  def initialize(player_strategy)
    @name = player_strategy[0]
    @strategy = Strategy.build(player_strategy[1])
  end
end

class Strategy
  include Comparable

  def self.build(strategy)
    if strategy == "P"
      PaperStrategy.new
    elsif strategy == "R"
      RockStrategy.new
    elsif strategy == "S"
      ScissorsStrategy.new
    else
      raise NoSuchStrategyError
    end
  end
end

class PaperStrategy < Strategy
  def <=>(other)
    if other.is_a? RockStrategy
      1
    elsif other.is_a? ScissorsStrategy
      -1
    else
      0
    end
  end

  def to_s
    "P"
  end
end

class RockStrategy < Strategy
  def <=>(other)
    if other.is_a? ScissorsStrategy
      1
    elsif other.is_a? PaperStrategy
      -1
    else
      0
    end
  end

  def to_s
    "R"
  end
end

class ScissorsStrategy < Strategy
  def <=>(other)
    if other.is_a? PaperStrategy
      1
    elsif other.is_a? RockStrategy
      -1
    else
      0
    end
  end

  def to_s
    "S"
  end
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  player1 = Player.new(game[0])
  player2 = Player.new(game[1])

  winner = [player1, player2].max_by(&:strategy)

  [winner.name, winner.strategy.to_s]
end

def rps_tournament_winner(tournaments)
  if tournaments[0][0].is_a? String
    rps_game_winner(tournaments)
  else
    tournament_winner = tournaments.map {|tournament| rps_tournament_winner(tournament) }
    rps_game_winner(tournament_winner)
  end
end
