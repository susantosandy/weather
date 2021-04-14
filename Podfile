# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

def weather_pods
  pod 'Alamofire'
  pod 'AlamofireNetworkActivityLogger'
  pod 'SwiftyJSON'
  pod 'ReachabilitySwift', '~> 4.3.1'
end

target 'Weather' do
  # Comment the next line if you don't want to use dynamic frameworks
  weather_pods
end

target 'WeatherStaging' do
  # Comment the next line if you don't want to use dynamic frameworks
  weather_pods
end

target 'WeatherTests' do
  weather_pods
end

target 'WeatherStagingTests' do
  weather_pods
end
