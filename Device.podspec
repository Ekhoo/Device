Pod::Spec.new do |s|
  s.name         = "Device"
  s.version      = "1.0.1"
  s.summary      = "Light weight tool for detecting the current device and screen size written in swift."

  s.description  = "Swift library for detecting the running device's model and screen size. With the newer  devices, developers have more work to do. This library simplifies their job by allowing them to get information about the running device and easily target the ones they want."

  s.homepage     = "https://github.com/Ekhoo/Device"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Lucas Ortis" => "me@lucas-ortis.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Ekhoo/Device.git", :tag => s.version.to_s }
  s.source_files = "Source/*.swift"
  s.requires_arc = true
end
