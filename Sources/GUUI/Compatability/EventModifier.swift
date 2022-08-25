#if !canImport(SwiftUI)

import TokamakShim

public struct EventModifiers: Equatable, ExpressibleByArrayLiteral, OptionSet, RawRepresentable, Sendable, SetAlgebra {

    public typealias RawValue = Int

    public static let all = EventModifiers([.capsLock, .command, .control, .numericPad, .option, .shift])

    public static let capsLock = EventModifiers([EventModifiers(rawValue: 0)])

    public static let command = EventModifiers([EventModifiers(rawValue: 1)])

    public static let control = EventModifiers([EventModifiers(rawValue: 2)])

    public static let numericPad = EventModifiers([EventModifiers(rawValue: 3)])

    public static let option = EventModifiers([EventModifiers(rawValue: 4)])

    public static let shift = EventModifiers([EventModifiers(rawValue: 5)])

    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

}

#endif
