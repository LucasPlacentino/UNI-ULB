package com.example.testinfoprojet2

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
/* pour les coroutines il faut qu'il y ait bien dans les dépendances dans gradle.build les implémentations
      'org.jetbrains.kotlinx:kotlinx-coroutines-android:1.3.9'
  et
      'org.jetbrains.kotlinx:kotlinx-coroutines-core:1.3.9'      */

class MainActivity : AppCompatActivity() {

    private lateinit var GridLayoutManager: GridLayoutManager
    private lateinit var mainadapter: MainAdapter
    lateinit var recyclerView: RecyclerView
    lateinit var boutonPanier: Button
    //val listeProduits = ListeProduits() // initialise la liste de produits

    override fun onCreate(savedInstanceState: Bundle?) {

        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        recyclerView = findViewById(R.id.myListView)
        GridLayoutManager = GridLayoutManager(this, 2)
        recyclerView.layoutManager = GridLayoutManager

        GlobalScope.launch(Dispatchers.IO) {

            val listeProduits = ListeProduits() // initialise la liste de produits dans une autre coroutine

            launch(Dispatchers.Main) { // reviens sur la main coroutine pour finir de l'initialisation du recyclerview

                mainadapter = MainAdapter(listeProduits.getListeDesProduits())
                recyclerView.adapter = mainadapter
            } // petite erreur à l'execution (mais ne fait pas planter), est-ce grave ? : E/RecyclerView: No adapter attached; skipping layout
        }
        //mainadapter = MainAdapter(listeProduits.getListeDesProduits())
        //recyclerView.adapter = mainadapter

        boutonPanier = findViewById(R.id.buttonCart)
        boutonPanier.setOnClickListener { // Lance l'activity Panier

            val intent = Intent(this, Panier::class.java) // ?
            startActivity(intent)
        }
    }

}