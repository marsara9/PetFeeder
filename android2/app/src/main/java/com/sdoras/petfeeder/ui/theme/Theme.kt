package com.sdoras.petfeeder.ui.theme

import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable

private val PetFeederLightColors = lightColorScheme(
    primary = Cyan,
    onPrimary = Black,
    primaryContainer = Ink,
    onPrimaryContainer = White,
    secondary = Ink,
    onSecondary = White,
    background = White,
    onBackground = Black,
    surface = White,
    onSurface = Black,
)

@Composable
fun PetFeederTheme(content: @Composable () -> Unit) {
    MaterialTheme(
        colorScheme = PetFeederLightColors,
        content = content,
    )
}
