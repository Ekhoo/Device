//
//  Version.swift
//  Device
//
//  Created by Lucas Ortis on 30/10/2015.
//  Copyright © 2015 Ekhoo. All rights reserved.
//

public enum Version: String {
    /*** iPhone ***/
    case iPhone4
    case iPhone4S
    case iPhone5
    case iPhone5C
    case iPhone5S
    case iPhone6
    case iPhone6Plus
    case iPhone6S
    case iPhone6SPlus
    
    /*** iPad ***/
    case iPad1
    case iPad2
    case iPadMini
    case iPad3
    case iPad4
    case iPadAir
    case iPadMini2
    case iPadAir2
    case iPadMini3
    case iPadMini4
    case iPadPro
    
    /*** iPod ***/
    case iPodTouch1Gen
    case iPodTouch2Gen
    case iPodTouch3Gen
    case iPodTouch4Gen
    case iPodTouch5Gen
    case iPodTouch6Gen
    
    /*** Simulator ***/
    case Simulator
    
    /*** Unknown ***/
    case Unknown
    
    init(code: String) {
        switch code {
            /*** iPhone ***/
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":      self = .iPhone4
        case "iPhone4,1", "iPhone4,2", "iPhone4,3":      self = .iPhone4S
        case "iPhone5,1", "iPhone5,2":                   self = .iPhone5
        case "iPhone5,3", "iPhone5,4":                   self = .iPhone5C
        case "iPhone6,1", "iPhone6,2":                   self = .iPhone5S
        case "iPhone7,2":                                self = .iPhone6
        case "iPhone7,1":                                self = .iPhone6Plus
        case "iPhone8,1":                                self = .iPhone6S
        case "iPhone8,2":                                self = .iPhone6SPlus
            
            /*** iPad ***/
        case "iPad1,1":                                  self = .iPad1
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": self = .iPad2
        case "iPad3,1", "iPad3,2", "iPad3,3":            self = .iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6":            self = .iPad4
        case "iPad4,1", "iPad4,2", "iPad4,3":            self = .iPadAir
        case "iPad5,3", "iPad5,4":                       self = .iPadAir2
        case "iPad2,5", "iPad2,6", "iPad2,7":            self = .iPadMini
        case "iPad4,4", "iPad4,5", "iPad4,6":            self = .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9":            self = .iPadMini3
        case "iPad5,1", "iPad5,2":                       self = .iPadMini4
        case "iPad6,7", "iPad6,8":                       self = .iPadPro
            
            /*** iPod ***/
        case "iPod1,1":                                  self = .iPodTouch1Gen
        case "iPod2,1":                                  self = .iPodTouch2Gen
        case "iPod3,1":                                  self = .iPodTouch3Gen
        case "iPod4,1":                                  self = .iPodTouch4Gen
        case "iPod5,1":                                  self = .iPodTouch5Gen
        case "iPod7,1":                                  self = .iPodTouch6Gen
            
            /*** Simulator ***/
        case "i386", "x86_64":                           self = .Simulator
            
        default:                                         self = .Unknown
        }
    }
}
