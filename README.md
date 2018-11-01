![Device](https://github.com/Ekhoo/Device/blob/master/Source/Asset/device.png)

[![Version](https://img.shields.io/cocoapods/v/Device.svg?style=flat)](http://cocoapods.org/pods/Device)
[![License](https://img.shields.io/cocoapods/l/Device.svg?style=flat)](http://cocoapods.org/pods/Device)
[![Platform](https://img.shields.io/cocoapods/p/Device.svg?style=flat)](http://cocoapods.org/pods/Device)
![](https://img.shields.io/badge/Supported-iOS8%20%7C%20OSX%2010.10-4BC51D.svg?style=flat-square)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)
[![Twitter](https://img.shields.io/badge/Twitter-@LucasEkhoo-blue.svg?style=flat)](http://twitter.com/LucasEkhoo)

Device detect the current  device model and screen size.

# Installation
## CocoaPods
Device is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Device", '~> 3.1.2'
```

## Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Device into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Ekhoo/Device" ~> 3.1.2
```

Run `carthage update` to build the framework and drag the built `Device.framework` into your Xcode project.

# Usage
## iOS
### Device version
```swift
func myFunc() {
        /*** Display the device version ***/
        switch Device.version() {
            /*** iPhone ***/
            case .iPhone4:       print("It's an iPhone 4")
            case .iPhone4S:      print("It's an iPhone 4S")
            case .iPhone5:       print("It's an iPhone 5")
            case .iPhone5C:      print("It's an iPhone 5C")
            case .iPhone5S:      print("It's an iPhone 5S")
            case .iPhone6:       print("It's an iPhone 6")
            case .iPhone6S:      print("It's an iPhone 6S")
            case .iPhone6Plus:   print("It's an iPhone 6 Plus")
            case .iPhone6SPlus:  print("It's an iPhone 6 S Plus")
            case .iPhoneSE:      print("It's an iPhone SE")
            case .iPhone7:       print("It's an iPhone 7")
            case .iPhone7Plus:   print("It's an iPhone 7 Plus")
            case .iPhone8:       print("It's an iPhone 8")
            case .iPhone8Plus:   print("It's an iPhone 8 Plus")
            case .iPhoneX:       print("It's an iPhone X")
            case .iPhoneXS:      print("It's an iPhone Xs")
            case .iPhoneXS_Max:  print("It's an iPhone Xs Max")
            case .iPhoneXR:      print("It's an iPhone Xr")

            /*** iPad ***/
            case .iPad1:           print("It's an iPad 1")
            case .iPad2:           print("It's an iPad 2")
            case .iPad3:           print("It's an iPad 3")
            case .iPad4:           print("It's an iPad 4")
            case .iPad5:           print("It's an iPad 5")
            case .iPad6:           print("It's an iPad 6")
            case .iPadAir:         print("It's an iPad Air")
            case .iPadAir2:        print("It's an iPad Air 2")
            case .iPadMini:        print("It's an iPad Mini")
            case .iPadMini2:       print("It's an iPad Mini 2")
            case .iPadMini3:       print("It's an iPad Mini 3")
            case .iPadMini4:       print("It's an iPad Mini 4")
            case .iPadPro9_7Inch:  print("It's an iPad Pro 9.7 Inch")
            case .iPadPro10_5Inch: print("It's an iPad Pro 10.5 Inch")
            case .iPadPro12_9Inch: print("It's an iPad Pro 12.9 Inch")

            /*** iPod ***/
            case .iPodTouch1Gen: print("It's a iPod touch generation 1")
            case .iPodTouch2Gen: print("It's a iPod touch generation 2")
            case .iPodTouch3Gen: print("It's a iPod touch generation 3")
            case .iPodTouch4Gen: print("It's a iPod touch generation 4")
            case .iPodTouch5Gen: print("It's a iPod touch generation 5")
            case .iPodTouch6Gen: print("It's a iPod touch generation 6")

            /*** Simulator ***/
            case .Simulator:    print("It's a Simulator")

            /*** Unknown ***/
            default:            print("It's an unknown device")
        }
    }
```

## Device screen size
```swift
func myFunc() {
        /*** Display the device screen size ***/
        switch Device.size() {
            case .screen3_5Inch:  print("It's a 3.5 inch screen")
            case .screen4Inch:    print("It's a 4 inch screen")
            case .screen4_7Inch:  print("It's a 4.7 inch screen")
            case .screen5_5Inch:  print("It's a 5.5 inch screen")
            case .screen5_8Inch:  print("It's a 5.8 inch screen")
            case .screen6_1Inch:  print("It's a 6.1 inch screen")
            case .screen6_5Inch:  print("It's a 6.8 inch screen")
            case .screen7_9Inch:  print("It's a 7.9 inch screen")
            case .screen9_7Inch:  print("It's a 9.7 inch screen")
            case .screen10_5Inch: print("It's a 10.5 inch screen")
            case .screen12_9Inch: print("It's a 12.9 inch screen")
            default:              print("Unknown size")
        }
}
```

## Device type
```swift
func myFunc() {
        /*** Display the device type ***/
        switch Device.type() {
            case .iPod:         print("It's an iPod")
            case .iPhone:       print("It's an iPhone")
            case .iPad:         print("It's an iPad")
            case .Simulator:    print("It's a Simulated device")
            default:            print("Unknown device type")
        }
}

```

or 

```swift
func myFunc() {
        /*** Display the device type ***/
        if (Device.isPad()){
            print("It's an iPad")
        }
        else if (Device.isPhone()){
            print("It's an iPhone")
        }
        else if (Device.isPod()){
            print("It's an iPod")
        }
        else if (Device.isSimulator()){
            print("It's a Simulated device")
        }
}

```

## Mac
### Mac version
```swift
func myFunc() {
        /*** Display the mac version ***/
        switch Device.type() {
            case .iMac:         print("It's an iMac")
            case .macBook:      print("It's a MacBook")
            case .macBookAir:   print("It's a MacBook Air")
            case .macBookPro:   print("It's a MacBook Pro")
            default:            print("Unknown device type")
        }
    }
```

## Mac screen size
```swift
func myFunc() {
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
}
```

## Helpers
```swift
func myFunc() {
        /*** Helpers ***/
        if Device.size() == Size.screen4Inch {
            print("It's a 4 inch screen")
        }

        if Device.size() > Size.screen4_7Inch {
            print("Your device screen is larger than 4.7 inch")
        }

        if Device.size() < Size.screen4_7Inch {
            print("Your device screen is smaller than 4.7 inch")
        }

        if Device.size() == Size.screen27Inch {
            print("It's a 27 inch screen")
        }
        
        if Device.size() > Size.screen15Inch {
            print("Your mac screen is larger than 15 inch")
        }
        
        if Device.size() < Size.screen15Inch {
            print("Your mac screen is smaller than 15 inch")
        }

        if Device.isRetina() {
            print("It's a retina display")
        }
        
}
```

# Author
Lucas Ortis:
- me@lucas-ortis.com
- [@LucasEkhoo](https://twitter.com/LucasEkhoo)
- [Linkedin](https://fr.linkedin.com/in/lucasortis)

# License

Device is available under the MIT license. See the LICENSE file for more info.
