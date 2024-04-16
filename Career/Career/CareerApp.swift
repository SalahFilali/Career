import SwiftUI

@main
struct CareerApp: App {
    init() {
        configureTabBarAppearance()
    }

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}


func configureTabBarAppearance() {
#if os(iOS)
    let tabBarAppearance = UITabBarAppearance()

    // Use a neutral color that contrasts well with white text and is in line with the app's color scheme
    tabBarAppearance.backgroundColor = UIColor.systemBackground // This will adapt to light/dark mode

    // Use a color for icons and text that has good visibility against the background
    tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.label // Adapts to light/dark mode
    tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.secondaryLabel // A slightly lighter color for unselected items

    // Apply the same colors for the text
    tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.label]
    tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.secondaryLabel]
    // Set the appearance for different tab bar states
    UITabBar.appearance().standardAppearance = tabBarAppearance
    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
#endif
}
