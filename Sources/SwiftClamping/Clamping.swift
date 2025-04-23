//
//  Clamping.swift
//  Clamping
//
//  Created by Chen-Hai Teng on 2021/6/11.
//

import Foundation

private class RangeWrapper<Value: Comparable> {
    var range : ClosedRange<Value>
    init(_ range: ClosedRange<Value>) {
        self.range = range
    }
    
    func clamping(_ value: Value) -> Value {
        max(min(value, range.upperBound), range.lowerBound)
    }
}

@propertyWrapper
public struct Clamping<T> where T:Comparable {
    private var value: T
    private var valueRange: RangeWrapper<T>
    public var wrappedValue: T {
        get {
            return value
        }
        set {
            value = valueRange.clamping(newValue)
        }
    }
    
    public var projectedValue: ClosedRange<T> {
        get {
            valueRange.range
        }
        nonmutating set {
            valueRange.range = newValue
        }
    }
    
    public init(wrappedValue: T, _ range: ClosedRange<T>) {
        self.valueRange = RangeWrapper(range)
        value = valueRange.clamping(wrappedValue)
    }
    
    public init(wrappedValue: T, max: T, min: T) {
        self.valueRange = RangeWrapper(min...max)
        value = valueRange.clamping(wrappedValue)
    }
}

