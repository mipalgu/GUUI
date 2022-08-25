#if !canImport(SwiftUI)

import TokamakShim

public extension View {

    func contextMenu<MenuItems>(menuItems: () -> MenuItems) -> some View where MenuItems: View {
        self
    }

}

#endif
