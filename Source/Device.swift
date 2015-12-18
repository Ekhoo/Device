//
//  Device.swift
//  Device
//
//  Created by Lucas Ortis on 30/10/2015.
//  Copyright © 2015 Ekhoo. All rights reserved.
//

import UIKit

public class 📱Device {
    private lazy var versionCode: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let versionCode: String = String(UTF8String: NSString(bytes: &systemInfo.machine, length: Int(_SYS_NAMELEN), encoding: NSASCIIStringEncoding)!.UTF8String)!
        
        return versionCode
    }()
    
    private lazy var screenHeight: CGFloat = {
        let size = UIScreen.mainScreen().bounds.size
        return max(size.width, size.height)
    }()
    
    private(set) public lazy var systemVersion = UIDevice.currentDevice().systemVersion
    
    public var version: Version {
        return Version(code: versionCode)
    }
    
    public var type: Type {
        return Type(code: versionCode)
    }
    
    public var size: Size {
        return Size(height: screenHeight)
    }
}

public let Device = 📱Device()