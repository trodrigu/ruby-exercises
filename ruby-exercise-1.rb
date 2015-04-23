poem = File.read('the-man-from-snowy-river.txt')
lines = poem.lines
words = poem.split /\s+/


#Example
puts "There are #{words.count} words"
puts "There are #{words.uniq.count} different words"

#Exercises
puts "The second through sixth words are …"
puts "The first line has … words in it"

first_stanza_lines = 'replace this with code'
first_stanza = 'replace this with code'
puts "The first stanza has … words in it"
puts "Here is the poem with its lines randomly rearranged …"
