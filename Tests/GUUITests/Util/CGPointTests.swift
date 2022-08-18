// CGMathTests.swift 
// GUUI 
// 
// Created by Morgan McColl.
// Copyright © 2022 Morgan McColl. All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
// 
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
// 
// 2. Redistributions in binary form must reproduce the above
//    copyright notice, this list of conditions and the following
//    disclaimer in the documentation and/or other materials
//    provided with the distribution.
// 
// 3. All advertising materials mentioning features or use of this
//    software must display the following acknowledgement:
// 
//    This product includes software developed by Morgan McColl.
// 
// 4. Neither the name of the author nor the names of contributors
//    may be used to endorse or promote products derived from this
//    software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
// NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// -----------------------------------------------------------------------
// This program is free software; you can redistribute it and/or
// modify it under the above terms or under the terms of the GNU
// General Public License as published by the Free Software Foundation;
// either version 2 of the License, or (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, see http://www.gnu.org/licenses/
// or write to the Free Software Foundation, Inc., 51 Franklin Street,
// Fifth Floor, Boston, MA  02110-1301, USA.
// 

@testable import GUUI
import XCTest

/// Test class for CGMath source file.
final class CGPointTests: XCTestCase {

    /// Test + operator.
    func testPlus() {
        let result = CGPoint(x: 1.0, y: 2.0) + CGPoint(x: 10.0, y: 11.0)
        XCTAssertEqual(result, CGPoint(x: 11.0, y: 13.0))
    }

    /// Test - operator.
    func testMinus() {
        let result = CGPoint(x: 1.0, y: 2.0) - CGPoint(x: 10.0, y: 12.0)
        XCTAssertEqual(result, CGPoint(x: -9.0, y: -10.0))
    }

    /// Test * operator.
    func testMultiply() {
        let result = CGPoint(x: 1.0, y: 2.0) * CGPoint(x: 10.0, y: 12.0)
        XCTAssertEqual(result, CGPoint(x: 10.0, y: 24.0))
    }

    /// Test / operator.
    func testDivide() {
        let result = CGPoint(x: 1.0, y: 2.0) / CGPoint(x: 10.0, y: 12.0)
        XCTAssertEqual(result, CGPoint(x: 0.1, y: 2.0 / 12.0))
    }

    /// Test / operator with a scalar.
    func testDivideScalar() {
        let result = CGPoint(x: 1.0, y: 2.0) / 2.0
        XCTAssertEqual(result, CGPoint(x: 0.5, y: 1.0))
    }

    /// Test < operator.
    func testAngle() {
        let result = CGPoint(x: 1.0, y: 1.0)<
        XCTAssertEqual(result, 45.0)
    }

    /// Test || operator.
    func testMagnitude() {
        let result = CGPoint(x: 3.0, y: 4.0)||
        XCTAssertEqual(result, 5.0)
    }

    /// Test ||< operator.
    func testMagnitudeAndAngle() {
        let result = CGPoint(x: 1.0, y: 1.0)||<
        XCTAssertEqual(result.0, sqrt(2.0))
        XCTAssertEqual(result.1, 45.0)
    }

    /// Test Width.
    func testWidth() {
        let result = CGPoint.width(point0: CGPoint(x: 5.0, y: 1.0), point1: CGPoint(x: 2.0, y: 1.0))
        XCTAssertEqual(result, 3.0)
    }

    /// Test Height.
    func testHeight() {
        let result = CGPoint.height(point0: CGPoint(x: 5.0, y: 1.0), point1: CGPoint(x: 2.0, y: 3.0))
        XCTAssertEqual(result, 2.0)
    }

    /// Test Center.
    func testCenter() {
        let result = CGPoint.center(point0: CGPoint(x: 6.0, y: 1.0), point1: CGPoint(x: 2.0, y: 3.0))
        XCTAssertEqual(result, CGPoint(x: 4.0, y: 2.0))
    }

}
