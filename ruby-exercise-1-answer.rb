poem = File.read('the-man-from-snowy-river.txt')
lines = poem.lines
words = poem.split /\s+/


#Example
puts "There are #{words.count} words"
puts "There are #{words.uniq.count} different words"

#Exercises
puts "The second through sixth words are #{words[1, 4].join ', '}"
puts "The first line has #{lines.first.split(/\s+/).count} words in it"

first_stanza_lines = lines[0, 8]
first_stanza = first_stanza_lines.join "\n"
puts "The first stanza has #{first_stanza.split(/\s+/).count} words in it"
puts "Here is the poem with its lines randomly rearranged #{lines.shuffle.join ""}"
