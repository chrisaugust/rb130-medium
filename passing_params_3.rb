items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*first_items, remaining_item|
  puts first_items.join(', ')
  puts remaining_item
end

gather(items) do |first_item, *middle_items, last_item|
  puts first_item
  puts middle_items.join(', ')
  puts last_item
end
 
gather(items) do |first_item, *remaining_items|
  puts first_item
  puts remaining_items.join(', ')
end
 
gather(items) do |first, second, third, fourth|
  puts "#{first}, #{second}, #{third}, #{fourth}"
end
