#
# Be sure to run `pod lib lint NMMultiUnitRuler.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NMMultiUnitRuler'
  s.version          = '0.1.1'
  s.summary          = 'Simple customizable ruler control that supports multiple units'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A simple customizable ruler control that support multiple units. The control supports these features:

- Customizable interface
- Compatible with iOS 11.0 NSUnit Framework
- Supports multiple units
- Customize marker colors based on type or their value
- Customize the width, length and number of markers of the ruler
- Customize the unit formatter
                       DESC

  s.homepage         = 'https://github.com/namshi/NMMultiUnitRuler'
  s.screenshots     = 'https://raw.githubusercontent.com/namshi/NMMultiUnitRuler/master/Screenshots/NMMultiUnitRuler.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NAMSHI MOBILE TEAM' => 'mobile-dev@namshi.com' }
  s.source           = { :git => 'https://github.com/namshi/NMMultiUnitRuler.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.source_files = 'NMMultiUnitRuler/Classes/**/*'
  s.frameworks = 'UIKit'
end
