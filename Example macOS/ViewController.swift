//
//  ViewController.swift
//  Example macOS
//
//  Created by Tom Baranes on 16/08/16.
//  Copyright © 2016 Ekhoo. All rights reserved.
//

import Cocoa
import Device

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        switch Device.type() {
        case .iMac:         print("It's an iMac")
        case .macBook:      print("It's a MacBook")
        case .macBookAir:   print("It's a MacBook Air")
        case .macBookPro:   print("It's a MacBook Pro")
        default:            print("Unknown device type")
        }

        /*** Display the device screen size ***/
        switch Device.size() {
        case .screen11Inch:     print("It's a 11 inch screen")
        case .screen12Inch:     print("It's a 12 inch screen")
        case .screen13Inch:     print("It's a 13 inch screen")
        case .screen15Inch:     print("It's a 15 inch screen")
        case .screen17Inch:     print("It's a 17 inch screen")
        case .screen21_5Inch:   print("It's a 21.5 inch screen")
        default:                print("Unknown size")
        }
    }

}

