//
//  Size.swift
//  Device
//
//  Created by Lucas Ortis on 30/10/2015.
//  Copyright © 2015 Ekhoo. All rights reserved.
//

import UIKit

public enum Size {
    case Unknown
    case Screen3_5Inch
    case Screen4Inch
    case Screen4_7Inch
    case Screen5_5Inch
    
    init(height: CGFloat) {
        switch height {
        case 480:
            self = .Screen3_5Inch
        case 568:
            self = .Screen4Inch
        case 667:
            self = UIScreen.mainScreen().scale == 3.0 ? .Screen5_5Inch : .Screen4_7Inch
        case 736:
            self = .Screen5_5Inch
        default:
            self = .Unknown
        }
    }
}

extension Size: Comparable {}

public func ==(x: Size, y: Size) -> Bool {
    return x.hashValue == y.hashValue
}

public func <(x: Size, y: Size) -> Bool {
    return x.hashValue < y.hashValue
}