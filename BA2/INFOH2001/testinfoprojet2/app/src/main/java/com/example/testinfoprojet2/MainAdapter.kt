package com.example.testinfoprojet2

import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class MainAdapter(private val produits: ArrayList<Produit>) : RecyclerView.Adapter<MainAdapter.ViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {

        val view = LayoutInflater.from(parent.context).inflate(R.layout.product_row, parent, false)
        val holder = ViewHolder(view)
        view.setOnClickListener { // Lance l'activity DetailsProduit du produit

            val intent = Intent(parent.context, DetailsProduit::class.java) // ?
            intent.putExtra("object", produits[holder.adapterPosition]) // transfère l'objet vers l'activity DetailsProduits
            parent.context.startActivity(intent)
        }
        return holder
    }

    override fun onBindViewHolder(holder: MainAdapter.ViewHolder, position: Int) {

        val photo = produits[position].image // défini l'image pour l'item dans la recyclerview
        holder.image1.setImageResource(photo!!)
        holder.text1.text = produits[position].name // défini le nom pour l'item dans la recyclerview
        holder.price1.text = produits[position].price + " €" // défini le prix pour l'item dans la recyclerview
    }

    override fun getItemCount(): Int = produits.size // taille de la liste de produits - nombre d'items dans la recyclerview

    class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

        val image1: ImageView = itemView.findViewById(R.id.image1) //référence de l'image du produit dans product_row.xml
        val text1: TextView = itemView.findViewById(R.id.text1) //référence du nom du produit dans product_row.xml
        val price1: TextView = itemView.findViewById(R.id.price1) //référence du prix du produit dans product_row.xml
    }

}