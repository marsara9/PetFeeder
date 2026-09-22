package com.sdoras.petfeeder.dashboard

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.Refresh
import androidx.compose.material3.Button
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.unit.dp
import androidx.lifecycle.compose.collectAsStateWithLifecycle

@Composable
fun DashboardScreen(viewModel: DashboardViewModel) {
    val state by viewModel.uiState.collectAsStateWithLifecycle()
    var cupsInput by remember { mutableStateOf("0.125") }

    Column(
        modifier = Modifier.fillMaxSize().padding(24.dp),
        verticalArrangement = Arrangement.spacedBy(20.dp),
    ) {
        Row(verticalAlignment = Alignment.CenterVertically, modifier = Modifier.fillMaxWidth()) {
            Column(modifier = Modifier.weight(1f)) {
                Text("Today", style = MaterialTheme.typography.labelLarge)
                Text(state.feederName ?: "No feeder selected", style = MaterialTheme.typography.headlineMedium)
            }
            IconButton(onClick = { viewModel.onIntent(DashboardIntent.Refresh) }) {
                Icon(Icons.Outlined.Refresh, contentDescription = "Refresh")
            }
        }

        Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
            Text("Dispensed", style = MaterialTheme.typography.labelLarge)
            Text("%.3f cups".format(state.cupsDispensedToday), style = MaterialTheme.typography.displaySmall)
        }

        OutlinedTextField(
            value = cupsInput,
            onValueChange = { cupsInput = it },
            label = { Text("Amount in cups") },
            singleLine = true,
            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Decimal),
            modifier = Modifier.fillMaxWidth(),
        )
        Button(
            onClick = { cupsInput.toDoubleOrNull()?.let { viewModel.onIntent(DashboardIntent.TriggerManualFeed(it)) } },
            enabled = !state.isFeeding && state.feederName != null,
            modifier = Modifier.fillMaxWidth(),
        ) {
            if (state.isFeeding) CircularProgressIndicator(modifier = Modifier.height(18.dp), strokeWidth = 2.dp)
            else Text("Dispense food")
        }

        state.errorMessage?.let { message ->
            Text(message, color = MaterialTheme.colorScheme.error)
            OutlinedButton(onClick = { viewModel.onIntent(DashboardIntent.DismissError) }) {
                Text("Dismiss")
            }
        }
        if (state.isLoading) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                CircularProgressIndicator(modifier = Modifier.height(18.dp), strokeWidth = 2.dp)
                Spacer(Modifier.width(8.dp))
                Text("Loading feeding history")
            }
        }
    }
}
