//
//  ViewController.swift
//  Example-tvOS
//
//  Created by toshi0383 on 5/19/16.
//  Copyright © 2016 Ekhoo. All rights reserved.
//

import UIKit
import Device

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Device.type())
        print(Device.version())
        print(Device.size())
    }

}

