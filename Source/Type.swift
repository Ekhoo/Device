//
//  Type.swift
//  Device
//
//  Created by Stefan Jansen on 08-12-15.
//  Copyright © 2015 Ekhoo. All rights reserved.
//


public enum Type {
    public typealias RawValue = String
    
    #if os(iOS)
    case iPhone
    case iPad
    case iPod
    /// only  Device.strictMode = true
    indirect  case simulator(Type)

    #elseif os(OSX)
    
    case iMac
    case macMini
    case macPro
    case macBook
    case macBookAir
    case macBookPro
    case xserve
    #endif
    case unknown
}
