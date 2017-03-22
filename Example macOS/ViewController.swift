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
        
        /*** Display the mac version ***/
        switch Device.type() {
            case .iMac:         print("It's an iMac")
            case .macBook:      print("It's a MacBook")
            case .macBookAir:   print("It's a MacBook Air")
            case .macBookPro:   print("It's a MacBook Pro")
            default:            print("Unknown device type")
        }

        /*** Display the mac screen size ***/
        switch Device.size() {
            case .screen11Inch:     print("It's a 11 inch screen")
            case .screen12Inch:     print("It's a 12 inch screen")
            case .screen13Inch:     print("It's a 13 inch screen")
            case .screen15Inch:     print("It's a 15 inch screen")
            case .screen17Inch:     print("It's a 17 inch screen")
            case .screen21_5Inch:   print("It's a 21.5 inch screen")
            case .screen27Inch:     print("It's a 27 inch screen")
            default:                print("Unknown size")
        }
        
        /*** Helpers ***/
        if Device.size() == Size.screen27Inch {
            print("It's a 27 inch screen")
        }
        
        if Device.size() > Size.screen15Inch {
            print("Your mac screen is larger than 15 inch")
        }
        
        if Device.size() < Size.screen15Inch {
            print("Your mac screen is smaller than 15 inch")
        }
    }

}

