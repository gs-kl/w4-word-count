words = Hash.new

IO.foreach(ARGV.first) do |l|    # http://stackoverflow.com/a/5546681/4171919
  l.scan(/[\w']+/) do |w|     # http://stackoverflow.com/a/20525585/4171919
    if words.has_key?(w.downcase)
      words[w.downcase] += 1
    else
      words[w.downcase] = 1
    end
  end
end

ordered_words = words.sort_by {|word, frequency| frequency}.reverse    # http://www.rubyinside.com/how-to/ruby-sort-hash

if words.size < 10
  count_to = words.size
else
  count_to = 10
end

puts "Most frequently occurring words in " + ARGV.first.to_s
(0..(count_to - 1)).each do |n|
  puts "#{n + 1}. \"#{ordered_words[n][0]}\" (#{ordered_words[n][1]} occurrences)"
end
