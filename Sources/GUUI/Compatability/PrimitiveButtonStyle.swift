#if !canImport(SwiftUI)

import TokamakShim

public protocol PrimitiveButtonStyle {

    associatedtype Body: View

    typealias Configuration = PrimitiveButtonStyleConfiguration

    func makeBody(configuration: Configuration) -> Self.Body

}

public extension PrimitiveButtonStyle where Self == PlainButtonStyle {

    static var plain: PlainButtonStyle { PlainButtonStyle() }

}

#endif
