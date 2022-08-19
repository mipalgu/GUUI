//
//  File.swift
//  
//
//  Created by Morgan McColl on 23/4/21.
//

import Foundation

/// Provide common operators to CGPoint.
public extension CGPoint {

    /// Plus operation for points
    /// - Parameters:
    ///   - lhs: The point on the left-hand side of the operator
    ///   - rhs: The point on the right-hand side of the operator
    /// - Returns: A new point containing the respective coordinates added together.
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    /// Subtract 2 points.
    /// - Parameters:
    ///   - lhs: The point on the lhs of the operator.
    ///   - rhs: The point on the rhs of the operator.
    /// - Returns: A new point with the new coordinates.
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }

    /// Multiply points as a scalar.
    /// - Parameters:
    ///   - lhs: The point on the lhs of the operator.
    ///   - rhs: The point on the rhs of the operator.
    /// - Returns: A new point with the new coordinates.
    static func * (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
    }

    /// Divide points as a scalar.
    /// - Parameters:
    ///   - lhs: The point on the lhs of the operator.
    ///   - rhs: The point on the rhs of the operator.
    /// - Returns: The resultant point.
    static func / (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x / rhs.x, y: lhs.y / rhs.y)
    }

    /// Divide the coordinate in a point by a scalar quantity.
    /// - Parameters:
    ///   - lhs: The point containing the original coordinates.
    ///   - rhs: The scalar quantity to divide by.
    /// - Returns: A new point representing the new coordinates.
    static func / (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
    }

    /// Find the angle between the y and x coordinates with respect to the
    /// origin.
    /// - Parameter value: The point containing the coordinates.
    /// - Returns: The angle between x and y.
    postfix static func < (value: CGPoint) -> CGFloat {
        CGFloat(atan2(Double(value.y), Double(value.x)) / Double.pi * 180.0)
    }

    /// Find the magnitude of the line between the origin and a point.
    /// - Parameter value: The point to use from the origin.
    /// - Returns: The length of the line from the origin to value.
    postfix static func || (value: CGPoint) -> CGFloat {
        CGFloat(sqrt(Double(value.x * value.x) + Double(value.y * value.y)))
    }

    /// Find the magnitude and angle using || and < functions.
    /// - Parameter value: The point distant from the origin.
    /// - Returns: A tuple containing the magnitude and angle (mag, angle).
    postfix static func ||< (value: CGPoint) -> (CGFloat, CGFloat) {
        (value||, value<)
    }

    /// Find the width between 2 points.
    /// - Parameters:
    ///   - point0: The first point.
    ///   - point1: The second point.
    /// - Returns: The absolute difference between the x coordinates.
    static func width(point0: CGPoint, point1: CGPoint) -> CGFloat {
        abs(point1.x - point0.x)
    }

    /// Find the height between 2 points.
    /// - Parameters:
    ///   - point0: The first point.
    ///   - point1: The second point.
    /// - Returns: The absolute difference between the 2 y-coordinates.
    static func height(point0: CGPoint, point1: CGPoint) -> CGFloat {
        abs(point1.y - point0.y)
    }

    /// Find the center point between 2 points.
    /// - Parameters:
    ///   - point0: The first point.
    ///   - point1: The second point.
    /// - Returns: The point which lies between point0 and point1.
    static func center(point0: CGPoint, point1: CGPoint) -> CGPoint {
        point0 + (point1 - point0) / 2.0
    }

}

/// Angle operator.
postfix operator <

/// Magnitude operator.
postfix operator ||

/// Angle and magnitude operator.
postfix operator ||<

/// Provides common operations to CGFloat.
public extension CGFloat {

    /// Normalise degrees between -180.0 and 180.0
    /// - Parameter degrees: The degrees to normalise.
    /// - Returns: The normalised degrees.
    static func normalise(degrees: CGFloat) -> CGFloat {
        let normalisedDegrees = degrees.truncatingRemainder(dividingBy: 360.0)
        return normalisedDegrees > 180.0 ? normalisedDegrees - 360.0 : normalisedDegrees
    }

    /// Normalise radians between -pi and pi.
    /// - Parameter radians: The radians to normalise.
    /// - Returns: The normalise radians.
    static func normalise(radians: CGFloat) -> CGFloat {
        deg2rad(degrees: normalise(degrees: rad2deg(radians: radians)))
    }

    /// Convert radians to degrees.
    /// - Parameter radians: The radians to convert.
    /// - Returns: The angle represented as degrees.
    static func rad2deg(radians: CGFloat) -> CGFloat {
        CGFloat(Double(radians) / Double.pi * 180.0)
    }

    /// Convert degrees to radians.
    /// - Parameter degrees: The degrees to convert.
    /// - Returns: The angle represented as radians.
    static func deg2rad(degrees: CGFloat) -> CGFloat {
        CGFloat(Double(degrees / 180.0) * Double.pi)
    }

}
