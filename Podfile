source 'https://github.com/CocoaPods/Specs.git'

APIKitGit = 'https://github.com/ishkawa/APIKit.git'
APIKitBranch = 'master'

HimotokiGit = 'https://github.com/ikesyo/Himotoki.git'
HimotokiBranch = 'swift2'

ResultGit = 'https://github.com/ishkawa/Result.git'
ResultBranch = 'master'

target :ESConoHaAPIKit_OSX do

	platform :osx, '10.9'
	use_frameworks!

	pod 'APIKit', :git => APIKitGit, :branch => APIKitBranch
	pod 'Himotoki', :git => HimotokiGit, :branch => HimotokiBranch

end

target :ESConoHaAPIKit_iOS do

	platform :ios, '8.0'
	use_frameworks!

	pod 'APIKit', :git => APIKitGit, :branch => APIKitBranch
	pod 'Himotoki', :git => HimotokiGit, :branch => HimotokiBranch

end

target :ESConoHaAPIKit_OSXTests do

	platform :osx, '10.10'
	use_frameworks!

	pod 'APIKit', :git => APIKitGit, :branch => APIKitBranch
	pod 'Himotoki', :git => HimotokiGit, :branch => HimotokiBranch
	pod 'Result'

end

target :ESConoHaAPIKit_iOSTests do

	platform :ios, '9.0'
	use_frameworks!

	pod 'APIKit', :git => APIKitGit, :branch => APIKitBranch
	pod 'Himotoki', :git => HimotokiGit, :branch => HimotokiBranch
	pod 'Result'

end
