package com.sdoras.petfeeder

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.History
import androidx.compose.material.icons.outlined.Home
import androidx.compose.material.icons.outlined.Settings
import androidx.compose.material.icons.outlined.Schedule
import androidx.compose.material3.Icon
import androidx.compose.material3.NavigationBar
import androidx.compose.material3.NavigationBarItem
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.Modifier
import androidx.navigation.NavDestination.Companion.hierarchy
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import androidx.lifecycle.viewmodel.compose.viewModel
import com.sdoras.petfeeder.dashboard.DashboardScreen
import com.sdoras.petfeeder.dashboard.DashboardViewModelFactory
import com.sdoras.petfeeder.ui.theme.PetFeederTheme

private sealed class AppDestination(
    val route: String,
    val label: String,
    val icon: androidx.compose.ui.graphics.vector.ImageVector,
) {
    data object Dashboard : AppDestination("dashboard", "Dashboard", Icons.Outlined.Home)
    data object Schedule : AppDestination("schedule", "Schedule", Icons.Outlined.Schedule)
    data object History : AppDestination("history", "History", Icons.Outlined.History)
    data object Settings : AppDestination("settings", "Settings", Icons.Outlined.Settings)
}

private val destinations = listOf(
    AppDestination.Dashboard,
    AppDestination.Schedule,
    AppDestination.History,
    AppDestination.Settings,
)

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            PetFeederTheme {
                PetFeederApp()
            }
        }
    }
}

@Composable
private fun PetFeederApp() {
    val navController = rememberNavController()
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentDestination = navBackStackEntry?.destination

    Scaffold(
        modifier = Modifier.fillMaxSize(),
        bottomBar = {
            NavigationBar {
                destinations.forEach { destination ->
                    NavigationBarItem(
                        selected = currentDestination?.hierarchy?.any {
                            it.route == destination.route
                        } == true,
                        onClick = {
                            navController.navigate(destination.route) {
                                popUpTo(navController.graph.startDestinationId) {
                                    saveState = true
                                }
                                launchSingleTop = true
                                restoreState = true
                            }
                        },
                        icon = { Icon(destination.icon, contentDescription = destination.label) },
                        label = { Text(destination.label) },
                    )
                }
            }
        },
    ) { contentPadding ->
        NavHost(
            navController = navController,
            startDestination = AppDestination.Dashboard.route,
            modifier = Modifier.padding(contentPadding),
        ) {
            destinations.forEach { destination ->
                composable(destination.route) {
                    if (destination == AppDestination.Dashboard) {
                        val container = (LocalContext.current.applicationContext as PetFeederApplication).container
                        val factory = remember(container) {
                            DashboardViewModelFactory(container.feederRepository, container::feedingApiFor)
                        }
                        DashboardScreen(viewModel(factory = factory))
                    } else {
                        PlaceholderScreen(destination.label)
                    }
                }
            }
        }
    }
}

@Composable
private fun PlaceholderScreen(title: String) {
    androidx.compose.foundation.layout.Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = androidx.compose.ui.Alignment.Center,
    ) {
        Text(title)
    }
}
