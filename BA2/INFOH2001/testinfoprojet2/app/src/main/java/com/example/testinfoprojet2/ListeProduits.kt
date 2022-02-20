package com.example.testinfoprojet2

import kotlin.collections.ArrayList

class ListeProduits {

    private val listeProduits = arrayListOf<Produit>()

    init { // Liste prédeterminée de produits, hard-codée dans l'app (on pourrait l'importer d'un JSON ou une database etc)
        listeProduits.add(Produit("1","Lunettes de soleil homme", "26.99",R.drawable.sunglasses_giorgio_trovato_unsplash))
        listeProduits.add(Produit("2","Voiture miniature", "11.50",R.drawable.car_giorgio_trovato_unsplash))
        listeProduits.add(Produit("3","Livre", "14.99",R.drawable.book_brett_jordan_unsplash))
        listeProduits.add(Produit("4","Appareil photo", "485.50",R.drawable.camera_subtle_cinematics_unsplash))
        listeProduits.add(Produit("5","Thermos café", "12.00",R.drawable.coffeebottle_quokkabottles_unsplash))
        listeProduits.add(Produit("6","Presse à citron", "7.99",R.drawable.lemonsqueezer_giorgio_trovato_unsplash))
        listeProduits.add(Produit("7","Stylo", "4.99",R.drawable.pen_hope_house_press_unsplash))
        listeProduits.add(Produit("8","Skateboard Penny", "89.99",R.drawable.pennyboard_mike_meyers_unsplash))
        listeProduits.add(Produit("9","Sticker", "1.23",R.drawable.sticker_mathias_reding_unsplash))
        listeProduits.add(Produit("10","Lunettes de soleil femme", "17.99",R.drawable.sunglasseswomen_annie_theby_unsplash))
        listeProduits.add(Produit("11","Portefeuille", "25.10",R.drawable.wallet_oliur_unsplash))
        listeProduits.add(Produit("12","Montre", "67.48",R.drawable.watch_krismawan_kadek_unsplash))
        listeProduits.add(Produit("13","T-shirt blanc", "8.99",R.drawable.whiteshirt_anomaly_unsplash))
        listeProduits.add(Produit("14","Chaussures homme", "95.99",R.drawable.shoe_imani_bahati_unsplash))
        listeProduits.add(Produit("15","Vin rouge", "25.00",R.drawable.winebottle_brett_jordan_unsplash))
    }

    fun getListeDesProduits(): ArrayList<Produit> { //renvoie la liste de produits
        return listeProduits
    }
}