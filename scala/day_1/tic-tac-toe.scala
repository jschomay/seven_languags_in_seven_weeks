class TicTacToe (board: Array[String]) {
  println
  println("Your board: ")
  printBoard
  findWnner

  def printBoard() {

    def printRow(row: Range) {
      var rowPosition = 0
      for (i <- row) {
        print(board(i))
        if (rowPosition < row.length - 1) {
          print(" | ")
        } else {
          println()
        }
        rowPosition += 1
      }
    }

    val row1 = Range(0,3)
    val row2 = Range(3,6)
    val row3 = Range(6,9)

    printRow(row1)
    println("---------")
    printRow(row2)
    println("---------")
    printRow(row3)
  }

  def findWnner() {
    val lines = Array(("Row 1", Array(0,1,2)),
                      ("Row 2", Array(3,4,5)),
                      ("Row 3", Array(6,7,8)),
                      ("Column 1", Array(0,3,6)),
                      ("Column 2", Array(1,4,7)),
                      ("Column 3", Array(2,5,8)),
                      ("Diagonal 1", Array(0,4,8)),
                      ("Diagonal 2", Array(2,4,6)))

    var Xwins = ""
    var Owins = ""
  
    for (i <- 0 until lines.length) {
      var Xs = 0
      var Os = 0
      lines(i)._2.foreach { i =>
        if (board(i) == "X") Xs += 1
        if (board(i) == "O") Os += 1
      }
      if (Xs == 3) {
        Xwins = lines(i)._1
      }
      if (Os == 3) {
        Owins = lines(i)._1
      }
    }
    println
    if (Xwins != "") println("X's wins! (" + Xwins + ")")
    if (Owins != "") println("O's wins! (" + Owins + ")")
  }
}

val TTT1 = new TicTacToe(Array("X", "X", "O",
                                " ", "O", "O",
                                "X", "X", "O"))

val TTT2 = new TicTacToe(Array("O", "X", "O",
                                " ", "O", " ",
                                "X", "X", "O"))

val TTT3 = new TicTacToe(Array(" ", " ", "O",
                                " ", "O", "O",
                                "X", "X", "X"))

val TTT4 = new TicTacToe(Array("X", " ", "O",
                                " ", "O", " ",
                                "X", " ", " "))

