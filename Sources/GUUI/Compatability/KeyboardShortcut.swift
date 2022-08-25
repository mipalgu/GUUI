#if !canImport(SwiftUI)

import TokamakShim

public struct KeyboardShortcut {

    static let cancelAction = KeyboardShortcut("\u{001B}", modifiers: [])

    static let defaultAction = KeyboardShortcut("\u{23CE}", modifiers: [])

    public var key: KeyEquivalent

    public var modifiers: EventModifiers

    public init(_ key: KeyEquivalent, modifiers: EventModifiers) {
        self.key = key
        self.modifiers = modifiers
    }

}

#endif
