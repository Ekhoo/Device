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
        return Version(code: code)
    }
    
    static private func getType(code code: String) -> Type {
        let versionCode = Device.getVersionCode()
        return Type(code: versionCode)
    }

    
    static public func version() -> Version {
        let versionName = Device.getVersionCode()
        
        return Device.getVersion(code: versionName)
    }
    
    static public func size() -> Size {
        let w: Double = Double(CGRectGetWidth(UIScreen.mainScreen().bounds))
        let h: Double = Double(CGRectGetHeight(UIScreen.mainScreen().bounds))
        let screenHeight: Double = max(w, h)
        
        return Size(height: screenHeight)
    }
    
    static public func type() -> Type {
        let versionName = Device.getVersionCode()
        
        return Device.getType(code: versionName)
    }
    
    static public func isEqualToScreenSize(size: Size) -> Bool {
        return Device.size() == size
    }
    
    static public func isLargerThanScreenSize(size: Size) -> Bool {
        return Device.size() > size
    }
    
    static public func isSmallerThanScreenSize(size: Size) -> Bool {
        return Device.size() < size
    }
}
