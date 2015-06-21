class TicTacToe (board: Array[Array[String]]) {
  println("Your board: ")
  printBoard

  def printBoard() {
    for (i <- 0 until 3) {
      val row = board(i)
      println(row.mkString(" | "))
      if (i < 2) {
        println("---------")
      }
    }
  }
}

val myTTT = new TicTacToe(Array(Array("O", "X", "X"),
                                Array(" ", "O", "O"),
                                Array("X", "X", "O")))
