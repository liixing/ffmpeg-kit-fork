require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package["name"]
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platform          = :ios
  s.requires_arc      = true
  s.static_framework  = true

  s.subspec 'ffmpeg-kit-ios-custom' do |ss|
    ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h', 'bundle-apple-xcframework-ios/**/*.{h,m,swift}'
    ss.vendored_frameworks = 'bundle-apple-xcframework-ios/ffmpegkit.xcframework',
                            'bundle-apple-xcframework-ios/libavcodec.xcframework',
                            'bundle-apple-xcframework-ios/libavdevice.xcframework',
                            'bundle-apple-xcframework-ios/libavfilter.xcframework',
                            'bundle-apple-xcframework-ios/libavformat.xcframework',
                            'bundle-apple-xcframework-ios/libavutil.xcframework',
                            'bundle-apple-xcframework-ios/libswresample.xcframework',
                            'bundle-apple-xcframework-ios/libswscale.xcframework'    
    ss.ios.deployment_target = '12.1'
  end

end
