#
# Be sure to run `pod lib lint ClifeRepo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'libwebp'
  s.version          = '1.2.0'
  s.summary          = 'A short description of ClifeRepo.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/wang68543/ClifeRepo'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  # s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wang68543' => 'wang68543@163.com' }
  s.source           = { :git => 'https://github.com/wang68543/libwebp.git'  } 

  s.ios.deployment_target = '9.0'
  s.pod_target_xcconfig  = { 'USER_HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/libwebp/ ${PODS_TARGET_SRCROOT}/' }
  s.preserve_paths = "src"
  s.default_subspecs =  "webp", "demux", "mux"
  s.prepare_command =  "sed -i.bak 's/<inttypes.h>/<stdint.h>/g' './src/webp/types.h'" 
   s.subspec 'webp' do |ss|
      ss.source_files = "src/webp/decode.h", "src/webp/encode.h", "src/webp/types.h", "src/webp/mux_types.h", "src/webp/format_constants.h", "src/utils/*.{h,c}", "src/dsp/*.{h,c}", "src/dec/*.{h,c}", "src/enc/*.{h,c}"
      ss.public_header_files = "src/webp/decode.h", "src/webp/encode.h", "src/webp/types.h", "src/webp/mux_types.h", "src/webp/format_constants.h" 
  end

  s.subspec 'demux' do |ss|
      ss.dependency  'libwebp/webp'
      ss.source_files = "src/demux/*.{h,c}"
      ss.public_header_files = "src/webp/demux.h" 
  end
  s.subspec 'mux' do |ss|
      ss.dependency  'libwebp/demux'
      ss.source_files = "src/mux/*.{h,c}", "src/webp/mux.h"
      ss.public_header_files = "src/webp/mux.h" 
  end 
end
