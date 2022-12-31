/*
 * Ref.swift
 * MachineViews
 *
 * Created by Callum McColl on 16/11/20.
 * Copyright © 2020 Callum McColl. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials
 *    provided with the distribution.
 *
 * 3. All advertising materials mentioning features or use of this
 *    software must display the following acknowledgement:
 *
 *        This product includes software developed by Callum McColl.
 *
 * 4. Neither the name of the author nor the names of contributors
 *    may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
 * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * -----------------------------------------------------------------------
 * This program is free software; you can redistribute it and/or
 * modify it under the above terms or under the terms of the GNU
 * General Public License as published by the Free Software Foundation;
 * either version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/licenses/
 * or write to the Free Software Foundation, Inc., 51 Franklin Street,
 * Fifth Floor, Boston, MA  02110-1301, USA.
 *
 */

#if canImport(SwiftUI)
import SwiftUI
#else
import TokamakShim
#endif
// import Attributes

/// Create a reference type for an underlying value type.
@dynamicMemberLookup
public class ConstRef<T>: ObservableObject, Identifiable {

    /// A getter for the underlying object.
    fileprivate var get: () -> T

    /// Computed property for creating a binding to the underlying object.
    /// This binding is read-only, the setter will not mutate the object in this
    /// class.
    public var asReadOnlyBinding: Binding<T> {
        Binding(get: { self.value }, set: { _ in })
    }

    /// Get the underlying value.
    public var value: T {
        self.get()
    }

    /// Initialise the Ref by copying the underlying object.
    /// - Parameter value: The object to refer to in this object.
    public convenience init(copying value: T) {
        // swiftlint:disable:next trailing_closure
        self.init(get: { value })
    }

    /// Initialise this ref by passing a getter function to the underlying type.
    /// - Parameter get: The getter function.
    public init(get: @escaping () -> T) {
        self.get = get
    }

    /// Access the underlying objects types by using a keypath.
    public subscript<U>(dynamicMember keyPath: KeyPath<T, U>) -> ConstRef<U> {
        ConstRef<U> { self.get()[keyPath: keyPath] }
    }
//
    // public subscript<Path: ReadOnlyPathProtocol>(
    //     readOnly path: Path
    // ) -> ConstRef<Path.Value> where Path.Root == T {
    //     self[dynamicMember: path.keyPath]
    // }

}

/// Equatable conformance for ConstRef.
extension ConstRef: Equatable where T: Equatable {

    /// Value-type equality.
    /// - Parameters:
    ///   - lhs: The Ref on the lhs of the operator.
    ///   - rhs: The Ref on the rhs of the operator.
    /// - Returns: Whether lhs is equal to rhs.
    public static func == (lhs: ConstRef<T>, rhs: ConstRef<T>) -> Bool {
        lhs.value == rhs.value
    }

}

/// Hashable conformance for ConstRef.
extension ConstRef: Hashable where T: Hashable {

    /// Hash function for ConstRef.
    /// - Parameter hasher: The hasher used.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
    }

}

/// Decodable conformance for Ref.
extension Ref: Decodable where T: Decodable {

    /// Initialise the Ref from a decoder.
    /// - Parameter decoder: The decoder to use.
    public convenience init(from decoder: Decoder) throws {
        let value = try T(from: decoder)
        self.init(copying: value)
    }

}

/// Encodable conformance for ConstRef.
extension ConstRef: Encodable where T: Encodable {

    /// Encode ConstRef into an encoder.
    /// - Parameter encoder: The encoder to use.
    public func encode(to encoder: Encoder) throws {
        try self.value.encode(to: encoder)
    }

}

/// Provides a getter for converting this type into an array.
extension ConstRef where T: RandomAccessCollection, T.Index: Hashable {

    /// Convert this type into an array-equivalent type.
    public var constRefArray: [ConstRef<T.Element>] {
        self.value.indices.map { self[$0] }
    }

}

// swiftlint:disable type_name

/// A class used to convert value-types into reference types with mutation.
@dynamicMemberLookup
public final class Ref<T>: ConstRef<T> {

// swiftlint:enable type_name

    /// A setter function for mutating the underlying type.
    fileprivate var set: (T) -> Void

    /// Computed property for receiving and mutating the underlying object.
    override public var value: T {
        get {
            get()
        } set {
            self.objectWillChange.send()
            set(newValue)
        }
    }

    /// Convert the ref to a binding-equivalent type.
    public var asBinding: Binding<T> {
        Binding(get: { self.value }, set: { self.value = $0 })
    }

    /// Initialise this ref from a pointer.
    /// - Parameter pointer: The pointer pointing to the underlying object this
    ///                      ref will mutate.
    public convenience init(to pointer: UnsafeMutablePointer<T>) {
        self.init(get: { pointer.pointee }, set: { pointer.pointee = $0 })
    }

    /// Initialise this object by copying an object.
    /// - Parameter value: The object to copy from.
    public convenience init(copying value: T) {
        var value = value
        self.init(get: { value }, set: { value = $0 })
    }

    /// Initialise this Ref by using functions for setting and getting an object.
    /// - Parameters:
    ///   - get: The function to retrieve the object.
    ///   - set: The function to set the object.
    public init(get: @escaping () -> T, set: @escaping (T) -> Void) {
        self.set = set
        super.init(get: get)
    }

    /// Access the underlying type properties through a keypath.
    public subscript<U>(dynamicMember keyPath: WritableKeyPath<T, U>) -> Ref<U> {
        Ref<U>(
            get: { self.get()[keyPath: keyPath] },
            set: {
                var value = self.value
                value[keyPath: keyPath] = $0
                self.value = value
            }
        )
    }
//
//    public subscript<Path: PathProtocol>(path path: Path) -> Ref<Path.Value> where Path.Root == T {
//        return self[dynamicMember: path.path]
//    }
//
//    public subscript<Path: PathProtocol>(bindingTo path: Path) -> Binding<Path.Value> where Path.Root == T {
//        self[path: path].asBinding
//    }

}

/// Provide a computed property for converting a Ref to an array-equivalent type.
extension Ref where T: MutableCollection, T: RandomAccessCollection, T.Index: Hashable {

    /// Convert the Ref into and array.
    public var refArray: [Ref<T.Element>] {
        self.value.indices.map { self[$0] }
    }

}
