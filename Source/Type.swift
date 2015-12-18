//
//  Type.swift
//  Device
//
//  Created by Stefan Jansen on 08-12-15.
//  Copyright © 2015 Ekhoo. All rights reserved.
//

public enum Type {
    case iPhone
    case iPad
    case iPod
    case Simulator
    case Unknown
    
    init(code: String) {
        switch code {
        case "iPhone3,1", "iPhone3,2", "iPhone3,3",
        "iPhone4,1", "iPhone4,2", "iPhone4,3",
        "iPhone5,1", "iPhone5,2",
        "iPhone5,3", "iPhone5,4",
        "iPhone6,1", "iPhone6,2",
        "iPhone7,2",
        "iPhone7,1",
        "iPhone8,1",
        "iPhone8,2":                                    self = .iPhone
            
        case "iPad1,1",
        "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4",
        "iPad3,1", "iPad3,2", "iPad3,3",
        "iPad3,4", "iPad3,5", "iPad3,6",
        "iPad4,1", "iPad4,2", "iPad4,3",
        "iPad5,3", "iPad5,4",
        "iPad2,5", "iPad2,6", "iPad2,7",
        "iPad4,4", "iPad4,5", "iPad4,6",
        "iPad4,7", "iPad4,8", "iPad4,9",
        "iPad5,1", "iPad5,2",
        "iPad6,7", "iPad6,8":                           self = .iPad
            
        case "iPod1,1",
        "iPod2,1",
        "iPod3,1",
        "iPod4,1",
        "iPod5,1",
        "iPod7,1":
                                                        self = .iPod
        case "i386", "x86_64":                          self = .Simulator
        default:                                        self = .Unknown
        }
    }
}
