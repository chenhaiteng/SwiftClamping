import XCTest
@testable import SwiftClamping

final class ClampingTests: XCTestCase {
    
    func clampingArg(@Clamping(0.0...1.0) _ arg: CGFloat) {
        debugPrint("clamping \(arg), projected: \($arg)")
    }
    
    func testExample() throws {
        XCTAssertNoThrow(clampingArg(0.8))
        @Clamping(0...10) var clampedInt: Int = 0
        clampedInt = 100
        XCTAssertEqual(clampedInt, 10)
        clampedInt = -20
        XCTAssertEqual(clampedInt, 0)
        clampedInt = 5
        XCTAssertEqual(clampedInt, 5)
        
        let lowerStr =  String(Unicode.Scalar((Character("A").asciiValue ?? 1) - 1))
        let upperStr = String(Unicode.Scalar((Character("Z").asciiValue ?? 0) + 1))
        
        @Clamping("A"..."Z") var clampedStr: String = "A"
        clampedStr = lowerStr
        XCTAssertEqual(clampedStr, "A")
        clampedStr = upperStr
        XCTAssertEqual(clampedStr, "Z")
        clampedStr = "G"
        XCTAssertEqual(clampedStr, "G")
    }
}
