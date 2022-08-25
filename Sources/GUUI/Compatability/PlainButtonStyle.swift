#if !canImport(SwiftUI)

import TokamakShim

public struct PlainButtonStyle: PrimitiveButtonStyle {

    public init() {}

    public func makeBody(configuration: PrimitiveButtonStyleConfiguration) -> some View {
        EmptyView()
    }

}

#endif
