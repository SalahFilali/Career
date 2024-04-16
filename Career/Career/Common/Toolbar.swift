import Foundation
import SwiftUI

enum Toolbar {
    static var leadingToolbarItemPlacement: ToolbarItemPlacement {
#if os(iOS)
    return .navigationBarLeading
#else
    return  .navigation
#endif
    }

    static var trailingToolbarItemPlacement: ToolbarItemPlacement {
#if os(iOS)
    return .navigationBarTrailing
#else
    return  .confirmationAction
#endif
    }
}
