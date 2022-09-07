# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Pokedex' do
  # Comment the next line if you don't want to use dynamic frameworks
  source 'https://github.com/CocoaPods/Specs.git'
  platform :ios, '10.0'
  use_frameworks!

  pod "SnapKit", '~> 5.6.0'
  pod 'RxSwift', '6.5.0'
  pod 'RxCocoa', '6.5.0'
  pod 'ReactorKit'
  pod 'Moya', '~> 15.0'
  pod 'Moya/RxSwift', '~> 15.0'

  # Pods for Pokedex

  target 'PokedexTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxBlocking', '6.5.0'
    pod 'RxTest', '6.5.0'
  end

  target 'PokedexUITests' do
    # Pods for testing
  end

end
