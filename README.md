# Swift-Clamping

## Purpose:
1. For values that have upper and lower bound, provide a way to not write duplicate code.
2. In swift, when one try to preprocess an property before apply it, it needs following code:
```swift
    private var _computedVarStorage: Int
    public var computedVar: Int {
        get {
            return _computedVarStorage
        }
        set {
            _computedVarStorage = newValue*10
        }
    }
```
Because the get/set syntax will change variable to computed variable, it always need write a getter, even through we want a write-only property.

Also, to keep the modified value, a extra storage variable is needed, and it looks ugly.

3. In additionally, we also want the solution could be apply to protocol.

## Solution:
1. Use @propertyWrapper to apply clamp; replace max, min and degree into one declaration.
```swift
    @Clamping(max: 0.0, min: 360.0) var degree = 0.0
    @Clamping(0.0...1.0) var value = 0.5
```
2. In some situation, it need modify the range later, property wrapper use projectedValue to implement this requirement:
```swift
    @Clamping(0.0...1.0) var value = 0.5
    $value = 0.0...10.0
```
3. Although @propertyWrapper is useful, it hard to apply this mechanism to protocol. However, there has a workaround:
```swift
protocol ClampProtocol {
    var degree: Double // Can declare as @Clamping
    var range: ClosedRange<Double> // Can map to projectedValue in @Clamping
}

struct ClampStruct {
    @Clamping(0.0...360.0) var degree = 0.0
    var range: ClosedRange<Double> {
        get { $degree }
        set { $degree = newValue }
    }
}
```
 With this workaround, all class/struct implement ClampProtocol can apply @Clamping to simplify the effort to write clamp function, and keep it interface clear.

The detail about the implementation of @Clamping could be refer to :  [Clamping.swift](Sources/SwiftClamping/Clamping.swift)

## Installation:
### CocoaPods

SwiftClamping is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftClamping'
```

### Swift Package Manager
#### - Add to Xcode

1. File > Swift Packages > Add Package Dependency...
2. Choose Project you want to add SwiftClamping
3. Paste repository https://github.com/chenhaiteng/SwiftClamping.git
4. Rules > Version: Up to Next Major 1.0.1
It's can also apply Rules > Branch : Main to access latest code.

**Note:** It might need to link SwiftClamping to your target maunally.

1. Open *Project Editor* by tap on root of project navigator
2. Choose the target you want to use SwiftClamping.
3. Choose **Build Phases**, and expand **Link Binary With Libraries**
4. Tap on **+** button, and choose SwiftClamping to add it.

#### - Add to SPM package
```swift
dependencies: [
    .package(url: "https://github.com/chenhaiteng/SwiftClamping.git", from: "1.0.1")
],
targets: [
    .target(
        name: "MyPackage",
        dependencies: ["SwiftClamping"]),
]
```

## References:

[Property Wrapper - Swift Doc](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#ID617)

[Property Wrapper(SE-0258) - Swift Evolution](https://github.com/apple/swift-evolution/blob/master/proposals/0258-property-wrappers.md)

[Swift: Why does a variable with a setter must also have a getter? - stackoverflow](https://stackoverflow.com/a/34677538/505763)

[PropertyWrappers and protocol declaration? - stackoverflow](https://stackoverflow.com/a/57657870/505763)

---
<a href="https://www.buymeacoffee.com/chenhaiteng"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=☕&slug=chenhaiteng&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff" /></a>
