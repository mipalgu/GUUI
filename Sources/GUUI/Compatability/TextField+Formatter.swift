#if !canImport(SwiftUI)

import Foundation
import TokamakShim

public extension TextField {

    init<S, V>(
        _ title: S,
        value: Binding<V>,
        formatter: NumberFormatter,
        onCommit: @escaping () -> Void
    ) where S: StringProtocol, V: _ObjectiveCBridgeable, V._ObjectiveCType == NSNumber, Label == Text {
        let binding = Binding<String> {
            formatter.string(from: value.wrappedValue._bridgeToObjectiveC()) ?? ""
        } set: {
            guard let num = formatter.number(from: $0) else {
                return
            }
            var val: V? = value.wrappedValue
            V._forceBridgeFromObjectiveC(num, result: &val)
            guard let val = val else {
                return
            }
            value.wrappedValue = val
        }
        self.init(title, text: binding, onCommit: onCommit)
    }

    init<S, V>(
        _ title: S,
        value: Binding<V>,
        formatter: NumberFormatter,
        onEditingChanged: @escaping (Bool) -> Void,
        onCommit: @escaping () -> Void
    ) where S: StringProtocol, V: _ObjectiveCBridgeable, V._ObjectiveCType == NSNumber, Label == Text {
        let binding = Binding<String> {
            formatter.string(from: value.wrappedValue._bridgeToObjectiveC()) ?? ""
        } set: {
            guard let num = formatter.number(from: $0) else {
                return
            }
            var val: V? = value.wrappedValue
            V._forceBridgeFromObjectiveC(num, result: &val)
            guard let val = val else {
                return
            }
            value.wrappedValue = val
        }
        self.init(title, text: binding, onEditingChanged: onEditingChanged, onCommit: onCommit)
    }

    init<S, V>(
        _ title: S,
        value: Binding<V>,
        formatter: NumberFormatter,
        onEditingChanged: @escaping (Bool) -> Void
    ) where S: StringProtocol, V: _ObjectiveCBridgeable, V._ObjectiveCType == NSNumber, Label == Text {
        let binding = Binding<String> {
            formatter.string(from: value.wrappedValue._bridgeToObjectiveC()) ?? ""
        } set: {
            guard let num = formatter.number(from: $0) else {
                return
            }
            var val: V? = value.wrappedValue
            V._forceBridgeFromObjectiveC(num, result: &val)
            guard let val = val else {
                return
            }
            value.wrappedValue = val
        }
        self.init(title, text: binding, onEditingChanged: onEditingChanged)
    }

    init<S, V>(
        _ title: S,
        value: Binding<V>,
        formatter: NumberFormatter
    ) where S: StringProtocol, V: _ObjectiveCBridgeable, V._ObjectiveCType == NSNumber, Label == Text {
        let binding = Binding<String> {
            formatter.string(from: value.wrappedValue._bridgeToObjectiveC()) ?? ""
        } set: {
            guard let num = formatter.number(from: $0) else {
                return
            }
            var val: V? = value.wrappedValue
            V._forceBridgeFromObjectiveC(num, result: &val)
            guard let val = val else {
                return
            }
            value.wrappedValue = val
        }
        self.init(title, text: binding)
    }

}

#endif
