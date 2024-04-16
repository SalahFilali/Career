import Foundation
import SwiftUI

protocol SmallCardProtocol {
    var titleHintString: String { get }
    var titleValueString: String { get }
    var headLineString: String { get }
    var headValueString: String { get }
}


struct SmallCardView<T: SmallCardProtocol>: View {
    let smallCardObject: T
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if !smallCardObject.titleValueString.isEmpty {
                VStack(alignment: .leading) {
                    Text(smallCardObject.titleHintString)
                        .font(.caption)
                    Text(smallCardObject.titleValueString)
                        .font(.headline)
                        .bold()
                }
            }
            if !smallCardObject.headValueString.isEmpty {
                VStack(alignment: .leading) {
                    Text(smallCardObject.headLineString)
                        .font(.caption)
                    Text(smallCardObject.headValueString)
                        .font(.subheadline)
                        .bold()
                }
            }
        }
    }
}
