package com.example.testinfoprojet2

class ListePanier {

    companion object { // équivalent d'un static en java, permet ici de garder ces données à travers n'importe quelle activity

        private val itemsPanierTest = arrayListOf<Produit?>() // le panier : une ArrayList d'objets Produit

        fun addItem(item: Produit){
            itemsPanierTest.add(item)
        }

        fun getListeitemsPanier(): ArrayList<Produit?> {
            return itemsPanierTest
        }

        fun clearPanier(){
            itemsPanierTest.clear()
        }

        fun removeItemPanier(item: Produit?){
            itemsPanierTest.remove(item)
        }
    }

}

