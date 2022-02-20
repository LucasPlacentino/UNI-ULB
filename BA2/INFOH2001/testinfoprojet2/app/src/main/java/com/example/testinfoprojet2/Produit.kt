package com.example.testinfoprojet2

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
class Produit(  /* Object de type Parcelable : permet de le transférer entre différente activities
                ----> doit ajouter le plugin kotlin-parcelize dans build.gradle (testinfoprojet2/app/build.gradle) (et sync le projet avec les gradle files) */
        val id: String?,
        val name: String?,
        val price: String?,
        val image: Int?,
        //val urlPhoto: String?  // Alors nécessite la permission à l'app d'accéder à internet     ---   non-utilisé
    ): Parcelable {
}