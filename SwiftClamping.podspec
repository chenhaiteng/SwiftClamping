#
# Be sure to run `pod lib lint SwiftClamping.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftClamping'
  s.version          = '1.0.1'
  s.summary          = 'A property wrapper to limit input range.'
# s.swift_version:begin
  s.swift_version  = '5.9.0'
  # s.swift_version    = '${SWIFT_VERSION}'

# s.platform:begin
  s.platform = :osx, '10.13'
  s.osx.deployment_target = '10.13'
  s.platform = :ios, '12.0'
  s.ios.deployment_target = '12.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A property wrapper to limit input range with elegant way.'

  s.homepage         = 'https://github.com/chenhaiteng/SwiftClamping'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Chen-Hai Teng' => 'chenhaiteng@gmail.com' }
  s.source           = { :git => 'https://git@github.com/chenhaiteng/SwiftClamping.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.source_files = 'Sources/SwiftClamping/**/*.swift'

  # s.resource_bundles = {
  #   'SwiftClamping' => ['SwiftClamping/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'Cocoa'

  # s.dependency 'AFNetworking', '~> 2.3'
  # parse and add dependency here
  # s.dependency:begin

end
