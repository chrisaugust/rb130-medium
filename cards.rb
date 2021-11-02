# Highest and Lowest Ranking Cards
#
# Update the Card class to determine the highest and lowest ranking
# cards in an Array of Card objects.
#
# Requirements:
# - numeric cards are ordered 2 through 10
# - Jacks < Queens < Kings < Aces
# - suit plays no part in relative ranking
# - #min and #max methods should return one of a pair of same rank;
#   doesn't matter which card is returned
# - #to_s method should return a String representation of the card, 
#   e.g. 'Jack of Diamonds', '4 of Clubs', etc.
# 
# Implicit requirements:
# - #rank instance method returns value of card's rank
# - #== instance method compares ranks of two Card objects
# - need to define a #<=> method to give Card class the methods available
#   in Comparable module
# 
# Examples:
# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')] 
#
# puts cards.min == Card.new(2, 'Hearts') # output: true
# puts card.max == Card.new('Ace', 'Clubs') # output: true
# puts card.min # output: 2 of Hearts
# puts card.max # output: Aces of Clubs
# puts card.min.rank # output: 2
# puts card.max.rank # output: Ace
# 
# Data Structure:
# Array
#
# Algorithm:
# #<=>(other_card)
# - compare return values of convert_rank_value for self and other_card
#
# #convert_rank_value
# - convert Jack to rank of 11
# - convert Queen to rank of 12
# - convert King to rank of 13
# - convert Ace to rank of 14
# 
# #min
# - make use of Comparable#min 
#
# #max
# - make use of Comparable#max
#
# Card class with rank and suit attributes, and methods to work with rank values
class Card
  include Comparable
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    self.convert_rank_value <=> other_card.convert_rank_value
  end

  def to_s
    "#{rank} of #{suit}"
  end

  protected

  def convert_rank_value
    if rank.is_a? String
      case rank
      when 'Jack'
        11
      when 'Queen'
        12
      when 'King'
        13
      when 'Ace'
        14
      end
    else
      rank
    end
  end
end

# Tests
# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')
# 
# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')
# 
# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')
# 
# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'
# 
# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8
