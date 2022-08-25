#if !canImport(SwiftUI)

import TokamakShim
import Foundation

public extension ForEach {

    func onDelete(perform action: ((IndexSet) -> Void)?) -> some View {
        self
    }

}

#endif
