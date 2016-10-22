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
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":      return Version.iPhone4
            case "iPhone4,1", "iPhone4,2", "iPhone4,3":      return Version.iPhone4S
            case "iPhone5,1", "iPhone5,2":                   return Version.iPhone5
            case "iPhone5,3", "iPhone5,4":                   return Version.iPhone5C
            case "iPhone6,1", "iPhone6,2":                   return Version.iPhone5S
            case "iPhone7,2":                                return Version.iPhone6
            case "iPhone7,1":                                return Version.iPhone6Plus
            case "iPhone8,1":                                return Version.iPhone6S
            case "iPhone8,2":                                return Version.iPhone6SPlus
            case "iPhone8,4":                                return Version.iPhoneSE
            case "iPhone9,1", "iPhone9,3":                   return Version.iPhone7
            case "iPhone9,2", "iPhone9,4":                   return Version.iPhone7Plus

            /*** iPad ***/
            case "iPad1,1":                                  return Version.iPad1
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return Version.iPad2
            case "iPad3,1", "iPad3,2", "iPad3,3":            return Version.iPad3
            case "iPad3,4", "iPad3,5", "iPad3,6":            return Version.iPad4
            case "iPad4,1", "iPad4,2", "iPad4,3":            return Version.iPadAir
            case "iPad5,3", "iPad5,4":                       return Version.iPadAir2
            case "iPad2,5", "iPad2,6", "iPad2,7":            return Version.iPadMini
            case "iPad4,4", "iPad4,5", "iPad4,6":            return Version.iPadMini2
            case "iPad4,7", "iPad4,8", "iPad4,9":            return Version.iPadMini3
            case "iPad5,1", "iPad5,2":                       return Version.iPadMini4
            case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8": return Version.iPadPro
            
            /*** iPod ***/
            case "iPod1,1":                                  return Version.iPodTouch1Gen
            case "iPod2,1":                                  return Version.iPodTouch2Gen
            case "iPod3,1":                                  return Version.iPodTouch3Gen
            case "iPod4,1":                                  return Version.iPodTouch4Gen
            case "iPod5,1":                                  return Version.iPodTouch5Gen
            case "iPod7,1":                                  return Version.iPodTouch6Gen
            
            /*** Simulator ***/
            case "i386", "x86_64":                           return Version.Simulator

            default:                                         return Version.Unknown
        }
    }
    
    static fileprivate func getType(code: String) -> Type {
        let versionCode = Device.getVersionCode()
        
        if versionCode.contains("iPhone") {
            return Type.iPhone
        } else if versionCode.contains("iPad") {
            return Type.iPad
        } else if versionCode.contains("iPod") {
            return Type.iPod
        } else if versionCode == "i386" || versionCode == "x86_64" {
            return Type.Simulator
        } else {
            return Type.Unknown
        }
    }

    
    static open func version() -> Version {
        let versionName = Device.getVersionCode()
        
        return Device.getVersion(code: versionName)
    }
    
    static open func size() -> Size {
        let w: Double = Double(UIScreen.main.bounds.width)
        let h: Double = Double(UIScreen.main.bounds.height)
        let screenHeight: Double = max(w, h)
        
        switch screenHeight {
            case 480:
                return Size.screen3_5Inch
            case 568:
                return Size.screen4Inch
            case 667:
                return UIScreen.main.scale == 3.0 ? Size.screen5_5Inch : Size.screen4_7Inch
            case 736:
                return Size.screen5_5Inch
            case 1024:
                switch Device.version() {
                    case .iPadMini,.iPadMini2,.iPadMini3,.iPadMini4:
                        return Size.screen7_9Inch
                    default:
                        return Size.screen9_7Inch
                }
            case 1366:
                return Size.screen12_9Inch
            default:
                return Size.unknownSize
        }
    }
    
    static open func type() -> Type {
        let versionName = Device.getVersionCode()
        
        return Device.getType(code: versionName)
    }
    
    static open func isEqualToScreenSize(_ size: Size) -> Bool {
        return size == Device.size() ? true : false;
    }
    
    static open func isLargerThanScreenSize(_ size: Size) -> Bool {
        return size.rawValue < Device.size().rawValue ? true : false;
    }
    
    static open func isSmallerThanScreenSize(_ size: Size) -> Bool {
        return size.rawValue > Device.size().rawValue ? true : false;
    }
    
    static open func isRetina() -> Bool {
        return UIScreen.main.scale > 1.0
    }

    static open func isPad() -> Bool {
        return Device.type() == .iPad
    }
    
    static open func isPhone() -> Bool {
        return Device.type() == .iPhone
        
    }
    
    static open func isPod() -> Bool {
        return Device.type() == .iPod
    }
    
    static open func isSimulator() -> Bool {
        return Device.type() == .Simulator
    }
    
}
