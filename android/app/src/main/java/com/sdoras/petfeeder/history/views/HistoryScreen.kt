package com.sdoras.petfeeder.history.views

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import com.sdoras.petfeeder.history.viewModels.HistoryViewModel
import net.adamjak.math.fractions.Fraction
import java.text.DateFormat
import kotlin.math.floor

@Composable
fun HistoryScreen(
        viewModel : HistoryViewModel = viewModel()
) {
    val history by viewModel.history.observeAsState(emptyList())

    LazyColumn(
            contentPadding = PaddingValues(horizontal = 16.dp, vertical = 8.dp)
    ) {
        items(history) {
            Column {
                Header(it.dateString)
                LazyColumn {
                    items(it.feedings) {
                        val whole = floor(it.cups).toInt()
                        val fraction = Fraction.createFraction(it.cups - whole)

                        val title = if(whole > 0) {
                            "$whole-$fraction"
                        } else {
                            fraction.toString()
                        }
                        val details = DateFormat.getTimeInstance().format(it.date)
                        DetailRow(title = title, details)
                    }
                }
            }
        }
    }
}

@Preview
@Composable
fun PreviewHistoryScreen() {
    HistoryScreen()
}

@Composable
fun Header(title : String) {
    Text(title)
}

@Composable
fun DetailRow(
        title : String,
        details : String
) {
    Column {
        Text(title)
        Text(details)
    }
}