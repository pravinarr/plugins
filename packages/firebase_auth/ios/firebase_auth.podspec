#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

require 'yaml'
pubspec = YAML.load_file(File.join('..', 'pubspec.yaml'))
libraryVersion = pubspec['version'].gsub('+', '-')

Pod::Spec.new do |s|
  s.name             = 'firebase_auth'
  s.version          = '0.0.1'
  s.summary          = 'Firebase Auth plugin for Flutter.'
  s.description      = <<-DESC
Firebase Auth plugin for Flutter.
                       DESC
  s.homepage         = 'https://github.com/flutter/plugins/tree/master/packages/firebase_auth'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Flutter Team' => 'flutter-dev@googlegroups.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.ios.deployment_target = '8.0'
  s.dependency 'Flutter'
  s.dependency 'FirebaseAuth'
  s.dependency 'Firebase/Core'
  s.static_framework = true

  s.subspec 'FirebaseAuth' do |ss|
    ss.source_files = '../../firebase-ios-auth/iOS/FirebaseAuth/Firebase/Auth/Source/**/*.{h,m}'
  end

  s.prepare_command = <<-CMD
      echo // Generated file, do not edit > Classes/UserAgent.h
      echo "#define LIBRARY_VERSION @\\"#{libraryVersion}\\"" >> Classes/UserAgent.h
      echo "#define LIBRARY_NAME @\\"flutter-fire-auth\\"" >> Classes/UserAgent.h
    CMD
end
