package com.example.testinfoprojet2

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.drawable.Drawable
import android.widget.ImageView
import java.io.IOException

/*     #TODO    ---    NON UTILISE    ---

import android.graphics.drawable.Drawable
import androidx.core.content.res.ResourcesCompat

class ImageProduit {
    //val file: Drawable? = ResourcesCompat.getDrawable(context.resources, R.drawable.placeholder_image, null)
    val url: String? = "R.drawable.giorgio_trovato_unsplash"
}
*/

/* NON UTILISE
class ImageProduit {

    lateinit var imageView: ImageView

    fun creer(){
        setContentView(R.layout.activity_main)
        // assets folder image file name with extension
        val fileName = "giorgio_trovato_unsplash.png"

        // get bitmap from assets folder
        val bitmap: Bitmap? = assetsToBitmap(fileName)

        // show bitmap on first image view
        bitmap?.apply {
            imageView.setImageBitmap(this)
        }

        // get the bitmap from assets folder and show on second image view
        imageView2.setImageAssets(applicationContext,fileName)
    }

    // extension function to set image view image from assets folder
    fun ImageView.setImageAssets(context: Context, fileName: String){
        try {
            with(context.assets.open(fileName)){
                setImageBitmap(BitmapFactory.decodeStream(this))
            }
        }catch (e: IOException) {
            // log error
        }
    }

    // extension function to get bitmap from assets
    fun Context.assetsToBitmap(fileName: String): Bitmap?{
        return try {
            with(assets.open(fileName)){
                BitmapFactory.decodeStream(this)
            }
        } catch (e: IOException) { null }
    }
} */
/* TEST
class ImageProduit(
        val image: Int?
        ) {
}*/