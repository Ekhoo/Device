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
    case screen7_9Inch
    case screen9_7Inch
    case screen12_9Inch
    #elseif os(OSX)
    case Screen11Inch
    case Screen12Inch
    case Screen13Inch
    case Screen15Inch
    case Screen17Inch
    case Screen20Inch
    case Screen21_5Inch
    case Screen24Inch
    case Screen27Inch
    #endif
}

public func <(lhs: Size, rhs: Size) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func ==(lhs: Size, rhs: Size) -> Bool {
    return lhs.rawValue == rhs.rawValue
}
