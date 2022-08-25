#if !canImport(SwiftUI)

import TokamakShim

public extension View {

    func keyboardShortcut(_: KeyboardShortcut) -> some View {
        self
    }

    func keyboardShortcut(_: KeyboardShortcut?) -> some View {
        self
    }

    func keyboardShortcut(_: KeyEquivalent, modifiers _: EventModifiers) -> some View {
        self
    }

}

#endif
