//
//  Type.swift
//  Device
//
//  Created by Stefan Jansen on 08-12-15.
//  Copyright © 2015 Ekhoo. All rights reserved.
//

public enum Type: String {
    #if os(iOS)
    case iPhone
    case iPad
    case iPod
    case simulator
    #elseif(OSX)
    case iMac
    case MacMini
    case MacPro
    case MacBook
    case MacBookAir
    case MacBookPro
    case Xserve
    #endif
    case unknown
}
