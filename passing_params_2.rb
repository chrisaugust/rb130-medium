# Write a method that takes an array as an argument. The method should yield the contents 
# of the array to a block, which should assign your block variables in such a way that it 
# ignores the first two elements, and groups all remaining elements as a raptors array.

def group_birds(bird_array)
  yield(bird_array)
end

group_birds(%w(raven finch hawk eagle)) { |_, _, *raptors| puts "Raptors: #{raptors.join(', ')}."}
