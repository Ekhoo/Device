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
        case .MacBook:      print("It's a MacBook")
        case .MacBookAir:   print("It's a MacBook Air")
        case .MacBookPro:   print("It's a MacBook Pro")        
        default:            print("Unknown device type")
        }

        /*** Display the device screen size ***/
        switch Device.size() {
        case .Screen11Inch:     print("It's a 11 inch screen")
        case .Screen12Inch:     print("It's a 12 inch screen")
        case .Screen13Inch:     print("It's a 13 inch screen")
        case .Screen15Inch:     print("It's a 15 inch screen")
        case .Screen17Inch:     print("It's a 17 inch screen")
        case .Screen21_5Inch:   print("It's a 21.5 inch screen")
        default:                print("Unknown size")
        }
    }

}

