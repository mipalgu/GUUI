#if !canImport(SwiftUI)

import TokamakShim

public struct PrimitiveButtonStyleConfiguration {

    public struct Label: View {

        public var body: Never {
            fatalError("Unable to construct label.")
        }

    }

    public let label = Label()

}

#endif
