
#!ruby19
# encoding: utf-8
# 

require 'fileutils'

puts $:
# location of files
file_path = Dir.pwd + "/../../pages/articles"
# find all files in /pages/articles

all_categories = []

Dir.foreach(file_path) do |item|
  next if item == '.' or item == '..'
  file = File.open(file_path + "/" + item, :encoding => "UTF-8").read
  # file.gsub!(/\r\n?/, "\n")

  file.each_line do |line|
    begin
      if line.to_s =~ /^Categories:/
        categories = line.split(": ")[1].split(", ")
        all_categories.push(categories.map {|i| i.chomp })
      end
      # puts "#{categories}" if line.to_s =~ /^Categories:/  
    rescue Exception => e
      
    end
    
  end
end

# File.open("/Users/aaron/9thport.net/content/menu.txt", "w") do |file|
  cats = all_categories.flatten.sort.uniq

  # file << "articles\n"
  cats.each do |c|
    puts c
  end
    # file << "  #{c}\n"

    # FileUtils.mkdir_p '/Users/aaron/9thport.net/content/pages/categories'
    # File.open("/Users/aaron/9thport.net/content/pages/categories/#{c.split("/")[1].capitalize}.haml", "w") do |file|
      # file << "%h1 #{c.split("/")[1].capitalize}\n"
      # file << "\n"
      # file << "#{@content.gsub(/^\s */, "")}\n"
    # end

  # end
# end


