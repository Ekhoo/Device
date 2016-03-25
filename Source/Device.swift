//
//  Device.swift
//  Device
//
//  Created by Lucas Ortis on 30/10/2015.
//  Copyright © 2015 Ekhoo. All rights reserved.
//

import UIKit

public class Device {
    static private func getVersionCode() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let versionCode: String = String(UTF8String: NSString(bytes: &systemInfo.machine, length: Int(_SYS_NAMELEN), encoding: NSASCIIStringEncoding)!.UTF8String)!
        
        return versionCode
    }
    
    static private func getVersion(code code: String) -> Version {
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
    
    static private func getType(code code: String) -> Type {
        let versionCode = Device.getVersionCode()
        
        switch versionCode {
            case "iPhone3,1", "iPhone3,2", "iPhone3,3",
            "iPhone4,1", "iPhone4,2", "iPhone4,3",
            "iPhone5,1", "iPhone5,2",
            "iPhone5,3", "iPhone5,4",
            "iPhone6,1", "iPhone6,2",
            "iPhone7,2",
            "iPhone7,1",
            "iPhone8,1",
            "iPhone8,2",
            "iPhone8,4":                                    return Type.iPhone

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
            "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":     return Type.iPad

            case "iPod1,1",
            "iPod2,1",
            "iPod3,1",
            "iPod4,1",
            "iPod5,1",
            "iPod7,1":
                                                            return Type.iPod
            case "i386", "x86_64":                          return Type.Simulator
            default:                                        return Type.Unknown
        }
    }

    
    static public func version() -> Version {
        let versionName = Device.getVersionCode()
        
        return Device.getVersion(code: versionName)
    }
    
    static public func size() -> Size {
        let w: Double = Double(CGRectGetWidth(UIScreen.mainScreen().bounds))
        let h: Double = Double(CGRectGetHeight(UIScreen.mainScreen().bounds))
        let screenHeight: Double = max(w, h)
        
        switch screenHeight {
            case 480:
                return Size.Screen3_5Inch
            case 568:
                return Size.Screen4Inch
            case 667:
                return UIScreen.mainScreen().scale == 3.0 ? Size.Screen5_5Inch : Size.Screen4_7Inch
            case 736:
                return Size.Screen5_5Inch
            case 1024:
                switch Device.version() {
                    case .iPadMini,.iPadMini2,.iPadMini3,.iPadMini4:
                        return Size.Screen7_9Inch
                    default:
                        return Size.Screen9_7Inch
                }
            case 1366:
                return Size.Screen12_9Inch
            default:
                return Size.UnknownSize
        }
    }
    
    static public func type() -> Type {
        let versionName = Device.getVersionCode()
        
        return Device.getType(code: versionName)
    }
    
    static public func isEqualToScreenSize(size: Size) -> Bool {
        return size == Device.size() ? true : false;
    }
    
    static public func isLargerThanScreenSize(size: Size) -> Bool {
        return size.rawValue < Device.size().rawValue ? true : false;
    }
    
    static public func isSmallerThanScreenSize(size: Size) -> Bool {
        return size.rawValue > Device.size().rawValue ? true : false;
    }
}
