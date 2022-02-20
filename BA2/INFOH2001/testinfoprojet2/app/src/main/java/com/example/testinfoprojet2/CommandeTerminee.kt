package com.example.testinfoprojet2

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class CommandeTerminee : AppCompatActivity() {

    lateinit var textView: TextView
    lateinit var boutonOk: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.commande_terminee)

        textView = findViewById(R.id.MerciCommande)
        textView.setText("Merci pour votre commande de " + calculTotal() + " €")

        boutonOk = findViewById(R.id.ok)
        boutonOk.setOnClickListener { // bouton OK appuyé

            val i = Intent(applicationContext, MainActivity::class.java)
            i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
            i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK)
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            i.putExtra("EXIT", true)

            ListePanier.clearPanier() // vide le panier

            startActivity(i) // relance l'appli depuis la MainActivity (accueil)
            finish() // termine cette activity
        }
    }
    private fun calculTotal(): String {

        var sum: Double = 0.00
        for (item in ListePanier.getListeitemsPanier()) { // calcul le total
            sum += item?.price?.toDouble()!!
        }
        val total = String.format("%.2f", sum) // formater pour forcer à afficher que 2 décimales du Double qu'est total

        return total
    }
}