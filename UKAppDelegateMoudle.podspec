#
# Be sure to run `pod lib lint UKAppDelegateMoudle.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UKAppDelegateMoudle'
  s.version          = '0.1.0'
  s.summary          = 'AppDelegate三方库逻辑封装'

  s.description      = <<-DESC
处理AppDelegate里各种三方库冗余混乱问题
新建三方库管理类，封装遵循协议的类，可以在类里单独处理各自的逻辑
                       DESC

  s.homepage         = 'https://github.com/xuchuandong/UKAppDelegateMoudle'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chardxu' => '1007034110@qq.com' }
  s.source           = { :git => 'https://github.com/xuchuandong/UKAppDelegateMoudle.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  s.ios.deployment_target = '10.0'
  s.source_files = 'UKAppDelegateMoudle/Classes/*'
  #s.public_header_files = 'UKAppDelegateMoudle/Classes/*.swift'
  
  s.dependency 'UKThreadSafeObjc' #, '~> 0.1.0'
end
