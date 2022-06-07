package com.sdoras.petfeeder.core.utils

import android.widget.TextView
import androidx.databinding.BindingAdapter
import androidx.databinding.InverseBindingAdapter
import net.adamjak.math.fractions.Fraction
import java.text.DateFormat
import java.text.ParseException
import java.util.*
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
    fun bindFloatToText(textView : TextView, float: Float?) {
        if(float == null) {
            return
        }

        val whole = floor(float).toInt()
        val fraction = Fraction.createFraction(float - whole)

        textView.text = if(whole > 0) {
            "$whole-$fraction"
        } else {
            fraction.toString()
        }
    }

    @JvmStatic
    @InverseBindingAdapter(attribute = "android:textString", event = "android:textAttrChanged")
    fun bindTextToDouble(textView: TextView) : Double? {
        return try {
            Fraction.tryParse(textView.text.toString()).toDouble()
        } catch(e : ParseException) {
            return null
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

    @JvmStatic
    @InverseBindingAdapter(attribute = "android:textString", event = "android:textAttrChanged")
    fun bindTextToInt(textView: TextView) : Int? {
        return textView.text.toString().toIntOrNull()
    }

    @JvmStatic
    @BindingAdapter("android:textTime")
    fun bindDateToText(textView: TextView, date: Date?) {
        if(date == null) {
            return
        }

        textView.text = DateFormat.getTimeInstance().format(date)
    }
}
