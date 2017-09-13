//
//  Size.swift
//  Device
//
//  Created by Lucas Ortis on 30/10/2015.
//  Copyright © 2015 Ekhoo. All rights reserved.
//

public enum Size: Int, Comparable {
    case unknownSize = 0
    #if os(iOS)
    case screen3_5Inch
    case screen4Inch
    case screen4_7Inch
    case screen5_5Inch
    case screen5_8Inch
    case screen7_9Inch
    case screen9_7Inch
    case screen10_5Inch
    case screen12_9Inch
    #elseif os(OSX)
    case screen11Inch
    case screen12Inch
    case screen13Inch
    case screen15Inch
    case screen17Inch
    case screen20Inch
    case screen21_5Inch
    case screen24Inch
    case screen27Inch
    #endif
}

public func <(lhs: Size, rhs: Size) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func ==(lhs: Size, rhs: Size) -> Bool {
    return lhs.rawValue == rhs.rawValue
}
