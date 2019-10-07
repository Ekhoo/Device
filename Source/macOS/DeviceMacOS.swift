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
        var model = [CChar](repeating: 0, count: Int(size))
        sysctlbyname("hw.model", &model, &size, nil, 0)
        return String.init(validatingUTF8: model) ?? ""
    }

    static private func getType(code: String) -> Type {
        let versionCode = Device.getVersionCode()
        if versionCode.hasPrefix("MacPro") {
            return Type.macPro
        } else if versionCode.hasPrefix("iMac") {
            return Type.iMac
        } else if versionCode.hasPrefix("MacBookPro") {
            return Type.macBookPro
        } else if versionCode.hasPrefix("MacBookAir") {
            return Type.macBookAir
        } else if versionCode.hasPrefix("MacBook") {
            return Type.macBook
        } else if versionCode.hasPrefix("MacMini") {
            return Type.macMini
        } else if versionCode.hasPrefix("Xserve") {
            return Type.xserve
        }
        return Type.unknown
    }
    
    private static func sizeInInches() -> CGFloat {
        let screen = NSScreen.main
        let description = screen?.deviceDescription
        let displayPhysicalSize = CGDisplayScreenSize(description?[NSDeviceDescriptionKey(rawValue: "NSScreenNumber")] as? CGDirectDisplayID ?? 0)
        return floor(sqrt(pow(displayPhysicalSize.width, 2) + pow(displayPhysicalSize.height, 2)) * 0.0393701);
    }

    static public func size() -> Size {
        let sizeInInches = Device.sizeInInches()

        switch sizeInInches {
        case 11: 
            return Size.screen11Inch
        case 12:
            return Size.screen12Inch
        case 13:
            return Size.screen13Inch
        case 15:
            return Size.screen15Inch
        case 17:
            return Size.screen17Inch
        case 20:
            return Size.screen20Inch
        case 21:
            return Size.screen21_5Inch
        case 24:
            return Size.screen24Inch
        case 27:
            return Size.screen27Inch
        default:
            return Size.unknownSize
        }
    }
    
    static public func version() -> String {
        return String(describing: Device.type()) + " " + String(describing: Device.sizeInInches()) + "-inch"
    }

    static public func type() -> Type {
        let versionName = Device.getVersionCode()
        return Device.getType(code: versionName)
    }

}
