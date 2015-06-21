val strings = List("a", "few", "words", "about", "nothing")

/* println(strings.foldLeft(0)((count, word) => count + word.length)) */
println((0 /: strings) { (count, word) => count + word.length })
