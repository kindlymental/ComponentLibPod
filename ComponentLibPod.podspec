#
# Be sure to run `pod lib lint ComponentLibPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ComponentLibPod'
  s.version          = '0.1.0'
  s.summary          = 'ComponentLibPod 封装的私有库.'
# 项目中使用了swift4，必须指定一下
  s.swift_version    = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/kindlymental/ComponentLibPod'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kindlymental' => '2995293916@qq.com' }
  s.source           = { :git => 'https://github.com/kindlymental/ComponentLibPod.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ComponentLibPod/Classes/*.swift'
  
  # s.subspec "Category" do |ss|
  #     ss.source_files = "ComponentLibPod/Classes/Category/*.swift"
  # end

  # s.resource_bundles = {
  #   'ComponentLibPod' => ['ComponentLibPod/Assets/*.png']
  # }

  # s.public_header_files = 'ComponentLibPod/Classes/*'
  
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
s.dependency 'SnapKit', '~> 4.0.1'
s.dependency 'Kingfisher', '~> 4.10.1'
s.dependency 'Toast-Swift', '~> 4.0.0'
s.dependency 'ObjectMapper', '~> 3.4'

end
