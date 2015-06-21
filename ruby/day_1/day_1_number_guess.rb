trys = 1
input = 0
win = rand(10) + 1
puts "Guess a number between 1 and 10"
until input == "q\n" or trys > 11
  input = gets
  if input == "q\n"
    puts "Thanks for playing"
  elsif not /[0-9]/ =~ input
    puts "Please guess a number between 1 and 10"
  else
    trys += 1
    if input.to_i == win
      puts "You win!"
      input = "q\n"
    else
      if trys == 11
        puts "Sorry, you lose.  The correct number was #{win}.  Maybe next time."
        input = "q\n"
      else
        puts "Sorry, that's incorrect, try again. (#{11 - trys} trys left, or press \"q\" to quit.)"
      end
    end
  end
end
