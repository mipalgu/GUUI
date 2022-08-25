#if !canImport(SwiftUI)

import TokamakShim

public struct EventModifiers: Equatable, ExpressibleByArrayLiteral, OptionSet, RawRepresentable, Sendable, SetAlgebra {

    public typealias RawValue = Int

    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

}

#endif
