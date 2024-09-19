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
    /// iPhone 2G, 3G, 3GS, 4, 4s, iPod Touch 4th gen.
    case screen3_5Inch
    /// iPhone 5, 5s, 5c, SE, iPod Touch 5-7th gen.
    case screen4Inch
    /// iPhone 6, 6s, 7, 8, SE 2nd gen.
    case screen4_7Inch
    /// iPhone 12 Mini
    case screen5_4Inch
    /// iPhone 6+, 6s+, 7+, 8+
    case screen5_5Inch
    /// iPhone X, Xs, 11 Pro
    case screen5_8Inch
    /// iPhone Xr, 11, 12, 12 Pro, 13, 13 Pro, 14
    case screen6_1Inch
    /// iPhone 14 Pro,  iPhone 15, iPhone 15 Pro, iPhone 16
    case screen6_1Inch_2
    /// iPhone 16 Pro
    case screen6_3Inch
    /// iPhone Xs Max, 11 Pro Max
    case screen6_5Inch
    /// iPhone 12 Pro Max, 13 Pro Max, 14 Plus, 15 Plus
    case screen6_7Inch
    /// iPhone 14 Pro Max, iPhone 15 Pro Max, iPhone 16 Plus
    case screen6_7Inch_2
    /// iPhone 16 Pro Max
    case screen6_9Inch
    /// iPad Mini
    case screen7_9Inch
    /// iPad, iPad Pro (9.7-inch)
    case screen9_7Inch
    /// iPad (10.2-inch)
    case screen10_2Inch
    /// iPad Pro (10.5-inch)
    case screen10_5Inch
    /// iPad Air 4th gen.
    case screen10_9Inch
    /// iPad Pro (11-inch)
    case screen11Inch
    /// iPad Pro (12.9-inch)
    case screen12_9Inch
    /// iPad Pro (13-inch)
    case screen13Inch
    #elseif os(OSX)
    case screen11Inch
    case screen12Inch
    case screen13Inch
    case screen15Inch
    case screen16Inch
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
