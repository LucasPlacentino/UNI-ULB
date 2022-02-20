package com.example.testinfoprojet2

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView

class Panier : AppCompatActivity() {

    lateinit var linearLayoutManager: LinearLayoutManager
    lateinit var panieradapter: PanierAdapter
    lateinit var recyclerView: RecyclerView
    lateinit var totalTextView: TextView
    lateinit var boutonRefresh: Button
    lateinit var boutonFinaliser: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.panier)

        recyclerView = findViewById(R.id.recyclerViewPanier)
        linearLayoutManager = LinearLayoutManager(this)
        recyclerView.layoutManager = linearLayoutManager

        panieradapter = PanierAdapter(ListePanier.getListeitemsPanier())
        recyclerView.adapter = panieradapter

        totalTextView = findViewById(R.id.totalPanier)

        totalTextView.setText(calculTotalPanier() + " €") // affiche le total

        boutonRefresh = findViewById(R.id.buttonRefreshTotal)
        boutonRefresh.setOnClickListener { // Refresh le montant total du panier

            totalTextView.setText(calculTotalPanier() + " €") // affiche le total
        }

        boutonFinaliser = findViewById(R.id.boutonFinaliser)
        boutonFinaliser.setOnClickListener { // Lance l'activity Commande Terminée

            val intent = Intent(this, CommandeTerminee::class.java)
            startActivity(intent) // lance l'activity
        }
    }
    private fun calculTotalPanier(): String {
        var sum: Double = 0.00
        for (item in ListePanier.getListeitemsPanier()) { // calcule le total
            sum += item?.price?.toDouble()!!
        }
        val total = String.format("%.2f", sum) // formater pour forcer à afficher que 2 décimales du Double qu'est total
        return total
    }
}
