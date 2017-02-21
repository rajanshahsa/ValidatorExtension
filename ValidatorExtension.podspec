#
# Be sure to run `pod lib lint ValidatorExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ValidatorExtension'
  s.version          = '0.1.0'
  s.summary          = 'ValidatorExtension is extension of String & Date class.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
ValidatorExtension is extension of String & Date. Which used to validate Email id, Trim the string, & finding difference between to date in terms of Seconds, Minute, Hours, Days, Weeks, Months & Years.
                       DESC

  s.homepage         = 'https://github.com/rajanshahsa/ValidatorExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rajanshahsa' => 'rajan.shah@solutionanalysts.com' }
  s.source           = { :git => 'https://github.com/rajanshahsa/ValidatorExtension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ValidatorExtension/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ValidatorExtension' => ['ValidatorExtension/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
