class Balle {
    fun bouge() {
        println("la balle bouge")
    }
}

abstract class Joueur(val laBalle: Balle) {
    var position = 0

    open fun interagitBalle() {
        println("Je tape la balle avec le pied")
        laBalle.bouge() //envoi de message
    }

    override fun toString(): String /* redéfinition de la méthode toString() définie dans la classe Object*/ {
        return javaClass.name
    }

    open fun avance() {
        println("la position actuelle du " + toString() + " est " + position)
        /*Présence de la méthode " toString() " pour obtenir la classe ultime de l'objet*/
        position += 20
    }

}

class Gardien(laBalle: Balle) : Joueur(laBalle) {

    /* héritage */
    init {
        position = 0
    }
    override fun interagitBalle() { /* redéfinition */
        super.interagitBalle() /* appel de la méthode originelle */
        println("Je prends la Balle avec les mains")
    }

    override fun avance() { /* redéfinition */
        if (position < 10) println("Moi gardien, je peux encore prendre la balle avec les mains")
        if (position < 20) super.avance() /* appel de la méthode originelle sous condition */
    }
}

class Defenseur(laBalle: Balle) : Joueur(laBalle) {

    init {
        position = 20
    }

    override fun avance() {
        if (position < 100) super.avance()
    }
}

class Attaquant(laBalle: Balle) : Joueur(laBalle) {

    init {
        position = 100
    }

    override fun avance() {
        if (position < 200) {
            super.avance()
            if (position > 150) println("moi attaquant je fais attention au hors-jeu")
        }
    }

    fun marquerUnBut() {
        println("BUT !!!!!!!!!!!!!!!!!!!!!!!!")
    }
}

class Entraineur(val lesJoueurs: Array<Joueur?>) {
    fun panique() {
        println("C'est la panique")
        for (i in lesJoueurs) {
            i?.avance() /* le même message à tous les joueurs – attention !!! polymorphisme*/
        }
        /*if (lesJoueurs[1] is Attaquant) {
            var j: Attaquant = lesJoueurs[1] as Attaquant
            j.marquerUnBut()
        }*/
    }
}

fun main() {
    val uneBalle = Balle() // création de la balle
    val lesJoueurs =
        arrayOfNulls<Joueur>(3) /* création de l'objet tableau*/
    lesJoueurs[0] = Gardien(uneBalle) /* création du premier joueur, un gardien */
    lesJoueurs[1] = Defenseur(uneBalle) /* création du deuxième joueur, un défenseur*/
    lesJoueurs[2] = Attaquant(uneBalle) /* création du troisième joueur, un attaquant */
    val unEntraineur = Entraineur(lesJoueurs) /* création de l'entraîneur */
    println("******* d'abord les joueurs  *****")
    for (i in lesJoueurs.indices) lesJoueurs[i]?.interagitBalle()
    println("******* puis l'entraineur  *****")
    for (i in 0..5) unEntraineur.panique()
}