//
//  DeviceMacOS.swift
//  Device
//
//  Created by Tom Baranes on 16/08/16.
//  Copyright © 2016 Ekhoo. All rights reserved.
//

import Cocoa

public class Device {
    static private func getVersionCode() -> String {
        var size : Int = 0
        sysctlbyname("hw.model", nil, &size, nil, 0)
        var model = [CChar](count: Int(size), repeatedValue: 0)
        sysctlbyname("hw.model", &model, &size, nil, 0)
        return String.fromCString(model) ?? ""
    }

    static private func getType(code code: String) -> Type {
        let versionCode = Device.getVersionCode()
        if versionCode.hasPrefix("MacPro") {
            return Type.MacPro
        } else if versionCode.hasPrefix("iMac") {
            return Type.iMac
        } else if versionCode.hasPrefix("MacBookPro") {
            return Type.MacBookPro
        } else if versionCode.hasPrefix("MacBookAir") {
            return Type.MacBookAir
        } else if versionCode.hasPrefix("MacBook") {
            return Type.MacBook
        } else if versionCode.hasPrefix("MacMini") {
            return Type.MacMini
        } else if versionCode.hasPrefix("Xserve") {
            return Type.Xserve
        }
        return Type.Unknown
    }

    static public func size() -> Size {
        let screen = NSScreen.mainScreen()
        let description = screen?.deviceDescription
        let displayPhysicalSize = CGDisplayScreenSize(description?["NSScreenNumber"] as? CGDirectDisplayID ?? 0)
        let sizeInInches = floor(sqrt(pow(displayPhysicalSize.width, 2) + pow(displayPhysicalSize.height, 2)) * 0.0393701);

        switch sizeInInches {
        case 11: 
            return Size.Screen11Inch
        case 12:
            return Size.Screen12Inch
        case 13:
            return Size.Screen13Inch
        case 15:
            return Size.Screen15Inch
        case 17:
            return Size.Screen17Inch
        case 20:
            return Size.Screen20Inch
        case 21:
            return Size.Screen21_5Inch
        case 24:
            return Size.Screen24Inch
        case 27:
            return Size.Screen27Inch
        default:
            return Size.UnknownSize
        }
    }

    static public func type() -> Type {
        let versionName = Device.getVersionCode()
        return Device.getType(code: versionName)
    }

}
