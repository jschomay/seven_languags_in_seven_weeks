class Complaint(complaint: String) extends Censor {
  println(censor(complaint))
}

trait Censor {
  val replacements = Map("darn" -> "beans", "shoot" -> "blimmin")
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
