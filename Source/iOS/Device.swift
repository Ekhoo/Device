//
//  Device.swift
//  Device
//
//  Created by Lucas Ortis on 30/10/2015.
//  Copyright © 2015 Ekhoo. All rights reserved.
//

import UIKit

open class Device {
    static fileprivate func getVersionCode() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let versionCode: String = String(validatingUTF8: NSString(bytes: &systemInfo.machine, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)!.utf8String!)!
        
        return versionCode
    }
    
    static fileprivate func getVersion(code: String) -> Version {
        switch code {
            /*** iPhone ***/
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return .iPhone4
            case "iPhone4,1", "iPhone4,2", "iPhone4,3":     return .iPhone4S
            case "iPhone5,1", "iPhone5,2":                 return .iPhone5
            case "iPhone5,3", "iPhone5,4":                 return .iPhone5C
            case "iPhone6,1", "iPhone6,2":                 return .iPhone5S
            case "iPhone7,2":                            return .iPhone6
            case "iPhone7,1":                            return .iPhone6Plus
            case "iPhone8,1":                            return .iPhone6S
            case "iPhone8,2":                            return .iPhone6SPlus
            case "iPhone8,3", "iPhone8,4":                 return .iPhoneSE
            case "iPhone9,1", "iPhone9,3":                 return .iPhone7
            case "iPhone9,2", "iPhone9,4":                 return .iPhone7Plus
            case "iPhone10,1", "iPhone10,4":               return .iPhone8
            case "iPhone10,2", "iPhone10,5":               return .iPhone8Plus
            case "iPhone10,3", "iPhone10,6":               return .iPhoneX
            case "iPhone11,2":                           return .iPhoneXS
            case "iPhone11,4", "iPhone11,6":               return .iPhoneXS_Max
            case "iPhone11,8":                           return .iPhoneXR
            case "iPhone12,1":                return .iPhone11
            case "iPhone12,3":                return .iPhone11Pro
            case "iPhone12,5":                return .iPhone11Pro_Max

            
            /*** iPad ***/
            case "iPad1,1", "iPad1,2":                    return .iPad1
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return .iPad2
            case "iPad3,1", "iPad3,2", "iPad3,3":           return .iPad3
            case "iPad3,4", "iPad3,5", "iPad3,6":           return .iPad4
            case "iPad6,11", "iPad6,12":                   return .iPad5
            case "iPad7,5", "iPad7,6":                    return .iPad6
            case "iPad4,1", "iPad4,2", "iPad4,3":           return .iPadAir
            case "iPad5,3", "iPad5,4":                     return .iPadAir2
            case "iPad11,3", "iPad11,4":                   return .iPadAir3
            case "iPad2,5", "iPad2,6", "iPad2,7":           return .iPadMini
            case "iPad4,4", "iPad4,5", "iPad4,6":           return .iPadMini2
            case "iPad4,7", "iPad4,8", "iPad4,9":           return .iPadMini3
            case "iPad5,1", "iPad5,2":                     return .iPadMini4

            /*** iPadPro ***/
            case "iPad6,3", "iPad6,4":                       return .iPadPro9_7Inch
            case "iPad6,7", "iPad6,8":                       return .iPadPro12_9Inch
            case "iPad7,1", "iPad7,2":                       return .iPadPro12_9Inch2
            case "iPad7,3", "iPad7,4":                       return .iPadPro10_5Inch
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4": return .iPadPro11_0Inch
            case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8": return .iPadPro12_9Inch3
            
            /*** iPod ***/
            case "iPod1,1":                                  return .iPodTouch1Gen
            case "iPod2,1":                                  return .iPodTouch2Gen
            case "iPod3,1":                                  return .iPodTouch3Gen
            case "iPod4,1":                                  return .iPodTouch4Gen
            case "iPod5,1":                                  return .iPodTouch5Gen
            case "iPod7,1":                                  return .iPodTouch6Gen
            
            /*** Simulator ***/
            case "i386", "x86_64":                           return .simulator

            default:                                         return .unknown
        }
    }
    
    static fileprivate func getType(code: String) -> Type {
        let versionCode = getVersionCode()
        
        if versionCode.contains("iPhone") {
            return .iPhone
        } else if versionCode.contains("iPad") {
            return .iPad
        } else if versionCode.contains("iPod") {
            return .iPod
        } else if versionCode == "i386" || versionCode == "x86_64" {
            return .simulator
        } else {
            return .unknown
        }
    }
    
    static public func version() -> Version {
        return getVersion(code: getVersionCode())
    }
    
    static public func size() -> Size {
        let w: Double = Double(UIScreen.main.bounds.width)
        let h: Double = Double(UIScreen.main.bounds.height)
        let screenHeight: Double = max(w, h)
        
        switch screenHeight {
            case 480:
                return .screen3_5Inch
            case 568:
                return .screen4Inch
            case 667:
                return UIScreen.main.scale == 3.0 ? .screen5_5Inch : .screen4_7Inch
            case 736:
                return .screen5_5Inch
            case 812:
                return .screen5_8Inch
            case 896:
                switch version() {
                case .iPhoneXS_Max:
                    return .screen6_5Inch
                default:
                    return .screen6_1Inch
                }
            case 1024:
                switch version() {
                case .iPadMini,.iPadMini2,.iPadMini3,.iPadMini4:
                    return .screen7_9Inch
                case .iPadPro10_5Inch:
                    return .screen10_5Inch
                default:
                    return .screen9_7Inch
                }
            case 1080:
                return .screen10_2Inch
            case 1112:
                return .screen10_5Inch
            case 1194:
                return .screen11Inch
            case 1366:
                return .screen12_9Inch
            default:
                return .unknownSize
        }
    }
    
    static public func type() -> Type {
        return getType(code: getVersionCode())
    }

    @available(*, deprecated, message: "use == operator instead")
    static public func isEqualToScreenSize(_ size: Size) -> Bool {
        return size == self.size() ? true : false;
    }

    @available(*, deprecated, message: "use > operator instead")
    static public func isLargerThanScreenSize(_ size: Size) -> Bool {
        return size.rawValue < self.size().rawValue ? true : false;
    }

    @available(*, deprecated, message: "use < operator instead")
    static public func isSmallerThanScreenSize(_ size: Size) -> Bool {
        return size.rawValue > self.size().rawValue ? true : false;
    }
    
    static public func isRetina() -> Bool {
        return UIScreen.main.scale > 1.0
    }

    static public func isPad() -> Bool {
        return type() == .iPad
    }
    
    static public func isPhone() -> Bool {
        return type() == .iPhone
    }
    
    static public func isPod() -> Bool {
        return type() == .iPod
    }
    
    static public func isSimulator() -> Bool {
        return type() == .simulator
    }
    
    static public func cpuInfo() -> (name: String, clock: String) {
        switch version() {
            case .iPodTouch5Gen:
                return ("A5", "800 MHz")
            case .iPodTouch6Gen:
                return ("A8", "1.4 GHz")
            case .iPhone4:
                return ("A4", "800 MHz")
            case .iPhone4S:
                return ("A5", "800 MHz")
            case .iPhone5,
                 .iPhone5C:
                return ("A6", "1.3 GHz")
            case .iPhone5S:
                return ("A7", "1.3 GHz")
            case .iPhone6,
                 .iPhone6Plus:
                return ("A8", "1.4 GHz")
            case .iPhone6S,
                 .iPhone6SPlus,
                 .iPhoneSE:
                return ("A9", "1.85 GHz")
            case .iPhone7,
                 .iPhone7Plus:
                return ("A10 Fusion", "2.34 GHz")
            case .iPhone8,
                 .iPhone8Plus,
                 .iPhoneX:
                return ("A11 Bionic", "2.39 GHz")
            case .iPhoneXS,
                 .iPhoneXS_Max,
                 .iPhoneXR:
                return ("A12 Bionic", "2.5 GHz")
            case .iPhone11,
                 .iPhone11Pro,
                 .iPhone11Pro_Max:
                return ("A13 Bionic", "2.65 GHz")
            case .iPad2:
                return ("A5", "1.0 GHz")
            case .iPad3:
                return ("A5X", "1.0 GHz")
            case .iPad4:
                return ("A6X", "1.4 GHz")
            case .iPad5:
                return ("A9", "1.85 GHz")
            case .iPad6:
                return ("A10 Fusion", "2.34 GHz")
            case .iPadAir:
                return ("A7", "1.4 GHz")
            case .iPadAir2:
                return ("A8X", "1.5 GHz")
            case .iPadAir3:
                return ("A12 Bionic", "2. 49 GHz")
            case .iPadMini:
                return ("A5", "1.0 GHz")
            case .iPadMini2,
                 .iPadMini3:
                return ("A7", "1.3 GHz")
            case .iPadMini4:
                return ("A8", "1.5 GHz")
            case .iPadPro9_7Inch:
                return ("A9X", "2.16 GHz")
            case .iPadPro12_9Inch:
                return ("A9X", "2.24 GHz")
            case .iPadPro12_9Inch2,
                 .iPadPro10_5Inch:
                return ("A10X Fusion", "2.34 GHz")
            case .iPadPro11_0Inch,
                 .iPadPro12_9Inch3:
                return ("A12Z Bionic", "2.5 GHz")
             default:
                return ("N/A", "N/A")
        }
    }
}
