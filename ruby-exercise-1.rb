poem = File.read('the-man-from-snowy-river.txt')
lines = poem.lines
words = poem.split /\s+/


#Example
puts "There are #{words.count} words"
puts "There are #{words.uniq.count} different words"
puts "The shortest line is #{lines.}"

#Exercises
puts "The second through sixth words are …"
puts "The "
