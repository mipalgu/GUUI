#if !canImport(SwiftUI)

import Foundation
import TokamakShim

public extension TextField {

    init<S, V>(
        _ title: S,
        value: Binding<V>,
        formatter: Formatter
    ) where S: StringProtocol, Label == Text {
        let binding = Binding<String> {
            formatter.string(for: value.wrappedValue) ?? ""
        } set: {
            let nsvalue = NSValue(nonretainedObject: value.wrappedValue)
            _ = formatter.getObjectValue(&nsvalue, for: $0, errorDescription: nil)
            value.wrappedValue = nsvalue.nonretainedObjectValue as! V
        }
        self.init(title, text: binding)
    }

}

#endif
