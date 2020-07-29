package com.sdoras.petfeeder.core.utils

import android.widget.TextView
import androidx.databinding.BindingAdapter
import net.adamjak.math.fractions.Fraction
import kotlin.math.floor

object BindingAdapters {

    @JvmStatic
    @BindingAdapter("android:textString")
    fun bindDoubleToText(textView : TextView, double: Double?) {
        if(double == null) {
            return
        }

        val whole = floor(double).toInt()
        val fraction = Fraction.createFraction(double - whole)

        textView.text = if(whole > 0) {
            "$whole-$fraction"
        } else {
            fraction.toString()
        }
    }

    @JvmStatic
    @BindingAdapter("android:textString")
    fun bindIntToText(textView : TextView, int: Int?) {
        if(int == null) {
            return
        }

        textView.text = "$int"
    }
}
