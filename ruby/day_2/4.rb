# grep - take a file and print out lines and line number that include given phrase

class Grep
  def initialize (file)
    file = File.open(file)
    @lines = file.readlines
    file.close
  end

  def find (term)
    pattern = Regexp.new term
    @lines.each_with_index.select do |line, i|
      if pattern =~ line
        puts "\"#{term}\" found on line #{i}: #{line}"
      end
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
  grep.find term
  puts
end
