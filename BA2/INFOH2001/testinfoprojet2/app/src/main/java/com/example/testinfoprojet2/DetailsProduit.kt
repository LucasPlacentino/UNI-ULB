package com.example.testinfoprojet2

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity

class DetailsProduit : AppCompatActivity() {

    lateinit var nomProduit: TextView
    lateinit var prix: TextView
    lateinit var boutonAddToPanier: Button
    lateinit var boutonPanier: Button
    lateinit var photoProduit: ImageView

    override fun onCreate(savedInstanceState: Bundle?) {

        super.onCreate(savedInstanceState)
        setContentView(R.layout.details_produit)

        nomProduit = findViewById(R.id.nomProduit)
        prix = findViewById(R.id.priceDetails)
        photoProduit = findViewById(R.id.photoDetails)
        boutonAddToPanier = findViewById(R.id.buttonAddToCart)
        boutonPanier = findViewById(R.id.buttonDetailsToCart)

        val currentObject = intent.getParcelableExtra<Produit>("object") // prend l'objet produit selectionné depuis la recyclerview

        val id = currentObject?.id // non-utilisé, id du produit

        val name = currentObject?.name
        nomProduit.text = name // affiche le nom du produit

        val price = currentObject?.price
        prix.text = price + " €" // affiche le prix du produit

        val image = currentObject?.image
        photoProduit.setImageResource(image!!)

        boutonAddToPanier.setOnClickListener {

            addToPanier(currentObject)// ajoute le produit au panier
            //AlertDialog.Builder(this).setMessage("Ajouté au panier : $name DEBUG: ${currentObject?.name} --- ${currentObject?.price} € --- $currentObject").create().show() //confirmation (et debug)
            AlertDialog.Builder(this).setMessage("Ajouté au panier : ${currentObject?.name} - ${currentObject?.price} €").create().show() //confirmation
        }

        boutonPanier.setOnClickListener { // Lance l'activity Panier

            val intent = Intent(this, Panier::class.java)
            startActivity(intent)
        }
    }
    private fun addToPanier(currentObject: Produit){

        ListePanier.addItem(currentObject)
    }
}