#if !canImport(SwiftUI)

import Foundation
import TokamakShim

public extension TextField {

    init<S, V>(
        _ title: S,
        value: Binding<V>,
        formatter: NumberFormatter
    ) where S: StringProtocol, Label == Text {
        let binding = Binding<String> {
            formatter.string(for: value.wrappedValue) ?? ""
        } set: {
            value.wrappedValue = formatter.number(from: $0) as! V
        }
        self.init(title, text: binding)
    }

}

#endif
