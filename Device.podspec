Pod::Spec.new do |s|
  s.name         = "Device"
  s.version      = "3.2.1"
  s.summary      = "Light weight tool for detecting the current device and screen size written in swift."

  s.description  = "Swift library for detecting the running device's model and screen size. With the newer  devices, developers have more work to do. This library simplifies their job by allowing them to get information about the running device and easily target the ones they want."

  s.homepage     = "https://github.com/Ekhoo/Device"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Lucas Ortis" => "me@lucas-ortis.com" }
  s.source       = { :git => "https://github.com/Ekhoo/Device.git", :tag => s.version.to_s }

  s.ios.deployment_target   = '8.0'
  s.osx.deployment_target   = '10.10'

  s.requires_arc            = true
  s.source_files            = "Source/*.swift"
  s.ios.source_files        = "Source/iOS/*.swift"
  s.osx.source_files        = "Source/macOS/*.swift"

  s.swift_version = '5.0' 
end
