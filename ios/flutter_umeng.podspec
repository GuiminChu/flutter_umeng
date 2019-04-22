#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_umeng'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin for UMeng.'
  s.description      = <<-DESC
A new Flutter plugin for UMeng.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'UMengAnalyticsFramework'

  s.ios.deployment_target = '9.0'
end
