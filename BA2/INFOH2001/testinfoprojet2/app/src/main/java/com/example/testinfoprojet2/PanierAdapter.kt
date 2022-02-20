package com.example.testinfoprojet2

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class PanierAdapter(private val produitsPanier: ArrayList<Produit?>) : RecyclerView.Adapter<PanierAdapter.ViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {

        val view = LayoutInflater.from(parent.context).inflate(R.layout.panier_row, parent, false)
        val holder = ViewHolder(view)
        view.setOnClickListener { // Enlève le produit du panier

            ListePanier.removeItemPanier(produitsPanier[holder.adapterPosition])
            notifyDataSetChanged()
        }

        return holder
    }

    override fun onBindViewHolder(holder: PanierAdapter.ViewHolder, position: Int) {

        val photo = produitsPanier[position]?.image // défini l'image pour l'item dans la recyclerview du panier
        holder.imagePanier.setImageResource(photo!!)
        holder.namePanier.text = produitsPanier[position]?.name // défini le nom pour l'item dans la recyclerview du panier
        holder.pricePanier.text = produitsPanier[position]?.price + " €" // défini le prix pour l'item dans la recyclerview du panier
    }

    override fun getItemCount(): Int = produitsPanier.size // taille de la liste de produits dans le panier - nombre d'items dans la recyclerview du panier

    class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

        val imagePanier: ImageView = itemView.findViewById(R.id.imagePanier) //référence du prix du produit dans panier_row.xml
        val namePanier: TextView = itemView.findViewById(R.id.namePanier) //référence du prix du produit dans panier_row.xml
        val pricePanier: TextView = itemView.findViewById(R.id.pricePanier) //référence du prix du produit dans panier_row.xml
    }
}