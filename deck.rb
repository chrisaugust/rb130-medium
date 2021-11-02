# Deck of Cards
#
# Requirements:
# - Card class from previous assignment should be used
# - the Deck class should provide a #draw method to deal one card. 
# - the Deck should be shuffled when it is initialized
# - if the Deck runs out of cards, it should reset itself by generating 
# a new set of 52 shuffled cards.
#
# Implicit requirements:
# - a #count method that tracks number of remaining cards
# - 
#
# Examples:
# deck = Deck.new
# deck.draw # => "Ace of Clubs"
# deck.draw # => "3 of Hearts"
# 
# deck.count # => 50
#
# ...
#
# deck.count # => 1
# deck.draw # => "10 of Clubs"
# # deck's count reaches 0 and triggers a reset
# deck.count # => 52
#
#
# Data Structures:
# Array for RANKS and SUITS
# Array for Deck object
#
# Algorithm:
# 
# Deck#initialize
# - generate cards
# - shuffle cards
# - 'cards' and 'count' attributes
#
# Deck#draw
# - pop a card from the 'cards' array
#
# Deck#reset

require_relative 'cards'

class Deck
  attr_reader :cards

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def count
    @cards.size
  end

  def draw
    reset if count == 0
    @cards.pop
  end

  private

  attr_writer :cards

  def reset
    @cards = []                          
                                    
    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
                                    
    @cards.shuffle!
  end
end

# Tests
deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
