#if !canImport(SwiftUI)

import TokamakShim

public extension View {

    func onExitCommand(perform _: (() -> Void)?) -> some View {
        self
    }

}

#endif
