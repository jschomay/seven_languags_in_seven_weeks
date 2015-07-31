# grep - take a file and print out lines and line number that include given phrase

class Grep
  def initialize (file)
    file = File.open(file)
    @lines = file.readlines
    file.close
  end

  def find (term)
    pattern = Regexp.new term
    @lines.each_with_index.reduce([]) do |matches, (line, i)|
      match = pattern =~ line
      if match
        matches << {:lineNumber => i + 1, :lineText => line}
      end
      matches
    end
  end
end
  

grep = Grep.new './canterbury_tales.txt'

terms = [
  "to seke",
  "with his",
  "Engelond",
  "Yo homes"
]

terms.each do |term|
  puts "Searching for \"#{term}\""
  matches = grep.find term
  if matches.length > 0
    puts "#{matches.length} matches found:"
    matches.each { |match| puts "Line #{match[:lineNumber]}: #{match[:lineText]}" }
  else
    puts 'No matches found'
  end
  puts
end
