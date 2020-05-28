//
//  CPUInfo.swift
//  Device
//
//  Created by KWANG HYOUN KIM on 2020/05/28.
//  Copyright © 2020 KWANG HYOUN KIM. All rights reserved.
//

public struct CPUInfo {
    static public let na = CPUInfo(version: -1, name: .na, clock: .na)
    static public let a4_800mhz = CPUInfo(version: 4, name: .a4, clock: .mhz800)
    static public let a5_800mhz = CPUInfo(version: 5, name: .a5, clock: .mhz800)
    static public let a5x_1000mhz = CPUInfo(version: 5.1, name: .a5x, clock: .mhz1000)
    static public let a6_1300mhz = CPUInfo(version: 6, name: .a6, clock: .mhz1300)
    static public let a6x_1400mhz = CPUInfo(version: 6.1, name: .a6x, clock: .mhz1400)
    static public let a7_1300mhz = CPUInfo(version: 7, name: .a7, clock: .mhz1300)
    static public let a7_1400mhz = CPUInfo(version: 7.1, name: .a7, clock: .mhz1400)
    static public let a8_1100mhz = CPUInfo(version: 8, name: .a8, clock: .mhz1100)
    static public let a8_1400mhz = CPUInfo(version: 8.1, name: .a8, clock: .mhz1400)
    static public let a8x_1500mhz = CPUInfo(version: 8.2, name: .a8x, clock: .mhz1500)
    static public let a9_1850mhz = CPUInfo(version: 9, name: .a9, clock: .mhz1850)
    static public let a9x_2160mhz = CPUInfo(version: 9.1, name: .a9x, clock: .mhz2160)
    static public let a9x_2240mhz = CPUInfo(version: 9.2, name: .a9x, clock: .mhz2240)
    static public let a10_2340mhz = CPUInfo(version: 10, name: .a10, clock: .mhz2340)
    static public let a10x_2340mhz = CPUInfo(version: 10.1, name: .a10x, clock: .mhz2340)
    static public let a11_2390mhz = CPUInfo(version: 11, name: .a11, clock: .mhz2390)
    static public let a12_2490mhz = CPUInfo(version: 12, name: .a12, clock: .mhz2490)
    static public let a12z_2500mhz = CPUInfo(version: 12.1, name: .a12z, clock: .mhz2500)
    static public let a13_2650mhz = CPUInfo(version: 13, name: .a13, clock: .mhz2650)
    
    public let version: Float
    public let name: Name
    public let clock: Clock
    
    public enum Name: String {
        case na = "NA"
        case a4 = "A4"
        case a5 = "A5"
        case a5x = "A5X"
        case a6 = "A6"
        case a6x = "A6X"
        case a7 = "A7"
        case a8 = "A8"
        case a8x = "A8X"
        case a9 = "A9"
        case a9x = "A9X"
        case a10 = "A10 Fusion"
        case a10x = "A10X Fusion"
        case a11 = "A11 Bionic"
        case a12 = "A12 Bionic"
        case a12z = "A12Z Bionic"
        case a13 = "A13 Bionic"
    }
    
    public enum Clock: UInt {
        case na = 0
        case mhz800 = 800
        case mhz1000 = 1000
        case mhz1100 = 1100
        case mhz1300 = 1300
        case mhz1400 = 1400
        case mhz1500 = 1500
        case mhz1850 = 1850
        case mhz2160 = 2160
        case mhz2240 = 2240
        case mhz2340 = 2340
        case mhz2390 = 2390
        case mhz2490 = 2490
        case mhz2500 = 2500
        case mhz2650 = 2650
        
        public var ghz: Float {
            return Float(rawValue) / 1000
        }
        
        public var stringValue: String {
            return rawValue >= 1000 ? "\(ghz) GHz" : "\(rawValue) MHz"
        }
    }
}

extension CPUInfo: Comparable {
    static public func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.version < rhs.version
    }

    static public func <= (lhs: Self, rhs: Self) -> Bool {
        return lhs.version <= rhs.version
    }
    
    static public func >= (lhs: Self, rhs: Self) -> Bool {
        return lhs.version >= rhs.version
    }

    static public func > (lhs: Self, rhs: Self) -> Bool {
        return lhs.version > rhs.version
    }
}
