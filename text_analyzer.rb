# PROBLEM
# Write a class TextAnalyzer that can read a text file and analyze it to 
# output 1) the number of paragraphs, 2) the number of lines, and 3) the number
# of words.
#
# Example
# analyzer = TextAnalyzer.new
# analyzer.process { .. }   # output: 3 paragraphs
# analyzer.process { .. }   # output: 15 lines
# analyzer.process { .. }   # output: 126 words
#
# Data Structure
# File -> Array
#
# Algorithm
# - read file and save to `file`
# - yield(file.read)
#   within block with `text` block variable:
#   - paragraphs = text.split('\n\n'), return interpolated string with paragraphs.size
#   - lines = text.split('\n'), return interpolated string with lines.size
#   - words = text.split(' ') , return interpolated string with words.size
# - file.close


class TextAnalyzer
  def process
    file = File.open('./text.txt', 'r')
    puts yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| paragraphs = text.split("\n\n"); "#{paragraphs.size} paragraphs" }
analyzer.process { |text| lines = text.split("\n"); "#{lines.size} lines" }
analyzer.process { |text| words = text.split(" "); "#{words.size} words" }
