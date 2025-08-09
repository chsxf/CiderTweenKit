/// Specify the rate of change of a parameter over time.
///
/// Easing functions receive a value between 0 and 1, and produce a transformed value.
///
/// > Note: The transformed value does not need to be confined between 0 and 1.
///
/// For example, a linear easing function (enabled with ```Easing/linear```) will simple return the original parameter, without transformation:
///
/// ```swift
/// static func linear(_ x: Float) -> Float { x }
/// ```
///
/// Another example is ```Easing/inCubic``` that will return the cube of the input value,
/// producing values that increase slowly and accelerate at the end.
///
/// ```swift
/// static func inCubic(_ x: Float) -> Float { pow(x, 3.0) }
/// ```
///
/// > Tip: While the previous examples are already provided through ```Easing``` enumerations, you can create your own easing functions and use them with ```Easing/custom(_:_:)```.
/// >
/// > For example, here is an easing function that subtract the input value from 1, creating a "reversed linear" sequence:
/// >
/// > ```swift
/// > static func reverseLinear(_ x: Float) -> Float { 1.0 - x }
/// > ```
///
/// - Parameter x: Value between 0 and 1
public typealias EasingFunction = @Sendable (_ x: Float) -> Float
