#
# Be sure to run `pod lib lint MCUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MCUIKit'
  s.version          = '0.3.9'
  s.summary          = 'Additions for iOS UIKit.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
包含UIKit基础组件库、分类、扩展等
                       DESC

  s.homepage         = 'https://github.com/BinaryParadise/MCUIKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mylcode' => 'mylcode.ali@gmail.com' }
  s.source           = { :git => 'https://github.com/BinaryParadise/MCUIKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'MCUIKit/Classes/**/*'
  
  s.dependency  'SDWebImage'

end
