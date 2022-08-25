#if !canImport(SwiftUI)

import TokamakShim

public extension Button {

    func buttonStyle<S>(_ style: S) -> some View where S: PrimitiveButtonStyle {
        self
    }

}

#endif
