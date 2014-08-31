def count_words(string)
  words = string.split(' ')
  frequency = Hash.new(0)
  words.each do |word| 
    frequency[scrub(word.downcase)] += 1 unless word.nil? or word.downcase =~ /^a-z/ or word.downcase.length < 10 or word.downcase =~ /jpeg/
    
    # word.downcase =~ /(width|to|of|the|be|me|you|them|for|that|will|give|are|here|giving|i|but|am|after|more|don\'t|alt\=|my|I|<a|\#|a)[a-z]*/
  end
  return frequency
end

def scrub(string)
  return string.gsub(/\<.*\>/, "")
end
  
# location of files
file_path = Dir.pwd + "/../../pages/articles"
# find all files in /pages/articles
Dir.foreach(file_path) do |item|
  next if item == '.' or item == '..'
  # next unless item =~ /(a\-deeper\-look|after\-the\-rain)/
  
  # scan for word frequency
  word_count = count_words(File.read(file_path + "/" + item))
  
  puts "---------------------------"
  puts "name: #{item}"
  words_sorted = word_count.sort_by {|key, value| value}.reverse
  puts words_sorted.inspect
end

