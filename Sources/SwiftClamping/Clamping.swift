//
//  Clamping.swift
//  Clamping
//
//  Created by Chen-Hai Teng on 2021/6/11.
//

import Foundation

@propertyWrapper
public struct Clamping<T> where T:Comparable {
    private var value: T
    private let range: ClosedRange<T>
    public var wrappedValue: T {
        get {
            return value
        }
        set {
            value = clamp(newValue)
        }
    }
    
    private func clamp(_ v: T) -> T {
        max(min(v, range.upperBound), range.lowerBound)
    }
    
    public init(wrappedValue: T, _ range: ClosedRange<T>) {
        self.range = range
        value = wrappedValue // 1st phase, initialize properties.
        value = clamp(wrappedValue) // 2nd phase, custom the value of property
    }
    
    public init(wrappedValue: T, max: T, min: T) {
        self.range = min...max
        value = wrappedValue
        value = clamp(wrappedValue)
    }
}
