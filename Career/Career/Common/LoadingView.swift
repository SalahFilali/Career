import Foundation
import SwiftUI

/// Displays a loading indicator while the app's data is loading.
struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(2)
    }
}
