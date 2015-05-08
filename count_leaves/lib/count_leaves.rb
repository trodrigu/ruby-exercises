class CountLeaves
  def count_leaves c
    if c.is_a? Array
#      puts "#{c}is ARRAY"
      count_array c
    elsif c.is_a? Hash
#      puts "#{c} is HASH"
      count_hash c
    else
      1
    end
  end

  private

  def count_array c
    return 0 if c == []
    # TODO finish
    first = c.shift
    #puts first.class
    #puts first.count
    count_leaves(first) + count_array(c)
  end

  def count_hash c
    return 0 if c == {}
    #TODO finish
    first = c.values[0]
    c.shift
    count_leaves(first) + count_hash(c)
  end
end

#
#
# a = CountLeaves.new
# a.count_leaves a: [2,3,4,2]
