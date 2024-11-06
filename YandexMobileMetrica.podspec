Pod::Spec.new do |spec|
    spec.name             = 'YandexMobileMetrica'
    spec.version          = '4.5.2'
    spec.license          = { :type => 'PROPRIETARY', :file => 'LICENSE.md' }
    spec.homepage         = 'https://appmetrica.yandex.com/'
    spec.authors          = { 'Yandex LLC' => 'appmetrica@yandex-team.com' }
    spec.summary          = 'This library is designed to be a part of mobile apps and provide app usage stats to Yandex AppMetrica'
    spec.source           = { :http => 'https://iha.justmoby.com/files/YandexMobileMetrica-4.5.2-ios-d70f8cb3-2746-4c3d-aa5f-dcd6acaaa5d8.zip' }
    spec.ios.deployment_target = '9.0'
    spec.libraries        = 'c++', 'z', 'sqlite3'
    spec.frameworks       = 'UIKit', 'Foundation', 'CoreLocation', 'CoreGraphics', 'AdSupport', 'SystemConfiguration'
    spec.ios.frameworks   = 'CoreTelephony', 'WebKit'
    spec.default_subspecs = 'Static'
    spec.requires_arc     = true

    spec.subspec 'Static' do |static|
        static.name     = 'Static'
        
        static.subspec 'Core' do |stcore|
            stcore.name = 'Core'
            stcore.preserve_paths = 'static/YandexMobileMetrica.xcframework'
            stcore.vendored_frameworks = 'static/YandexMobileMetrica.xcframework'
            stcore.source_files = 'static/YandexMobileMetrica.xcframework/**/YandexMobileMetrica.framework/Versions/A/Headers/*.h'
            stcore.public_header_files = 'static/YandexMobileMetrica.xcframework/**/YandexMobileMetrica.framework/Versions/A/Headers/*.h'
        end
        
        static.subspec 'Crashes' do |stcrashes|
            stcrashes.name = 'Crashes'
            stcrashes.preserve_paths = 'static/YandexMobileMetricaCrashes.xcframework', 'helper'
            stcrashes.vendored_frameworks = 'static/YandexMobileMetricaCrashes.xcframework'
            stcrashes.source_files = 'static/YandexMobileMetricaCrashes.xcframework/**/YandexMobileMetricaCrashes.framework/Versions/A/Headers/*.h'
            stcrashes.public_header_files = 'static/YandexMobileMetricaCrashes.xcframework/**/YandexMobileMetricaCrashes.framework/Versions/A/Headers/*.h'
            stcrashes.dependency 'YandexMobileMetrica/Static/Core'
        end
        
    end
    
        spec.subspec 'Dynamic' do |dynamic|
        dynamic.name     = 'Dynamic'
        
        dynamic.subspec 'Core' do |dycore|
            dycore.name = 'Core'
            dycore.preserve_paths = 'dynamic/YandexMobileMetrica.xcframework'
            dycore.vendored_frameworks = 'dynamic/YandexMobileMetrica.xcframework'
            dycore.source_files = 'dynamic/YandexMobileMetrica.xcframework/**/YandexMobileMetrica.framework/Headers/*.h'
            dycore.public_header_files = 'dynamic/YandexMobileMetrica.xcframework/**/YandexMobileMetrica.framework/Headers/*.h'
        end
        
        dynamic.subspec 'Crashes' do |dycrashes|
            dycrashes.name = 'Crashes'
            dycrashes.preserve_paths = 'dynamic/YandexMobileMetricaCrashes.xcframework', 'helper'
            dycrashes.vendored_frameworks = 'dynamic/YandexMobileMetricaCrashes.xcframework'
            dycrashes.source_files = 'dynamic/YandexMobileMetricaCrashes.xcframework/**/YandexMobileMetricaCrashes.framework/Headers/*.h'
            dycrashes.public_header_files = 'dynamic/YandexMobileMetricaCrashes.xcframework/**/YandexMobileMetricaCrashes.framework/Headers/*.h'
            dycrashes.dependency 'YandexMobileMetrica/Dynamic/Core'
        end
        
    end
end
