a = []
(1..16).each do |n|
  a.push n
  if a.length == 4
    puts a.join ' '
    a = []
  end
end
