import Flutter
import UIKit
import UMengAnalyticsFramework

public class SwiftFlutterUmengPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_umeng", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterUmengPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = call.method
        let arguments = call.arguments as! [String: String]
        
        if method == "init" {
            self.initUmeng(key: arguments["key"]!)
        } else if method == "beginPageView" {
            MobClick.beginLogPageView(arguments["pageName"])
        } else if method == "endPageView" {
            MobClick.endLogPageView(arguments["pageName"])
        } else if method == "event" {
            MobClick.event(arguments["eventId"])
        }
    }
    
    private func initUmeng(key: String) {
        UMConfigure.initWithAppkey(key, channel: "App Store")
        MobClick.setScenarioType(eScenarioType.E_UM_NORMAL)
    }
}
