import scala.io.Source

class Complaint(complaint: String) extends Censor {
  println(censor(complaint))
}

trait Censor {
  val replacements = new scala.collection.mutable.HashMap[String,String]
  Source.fromFile("censored_words.txt").getLines.foreach( { replacement =>
    replacements += (replacement.split(" -> ")(0) -> replacement.split(" -> ")(1))
  } )
  def censor(language: String) = {
    language.split(" ").foldLeft("")( { (sentence, word) =>
      val w = word.replaceAll("[.,!?\"']", "").toLowerCase
      if (replacements.contains(w)) {
        sentence + " " + replacements(w)
      } else {
        sentence + " " + word
      }
    })
  }
}

val complaint = new Complaint("Shoot!  Those darn darn shoot darn kids again, they're messing everything up!")
