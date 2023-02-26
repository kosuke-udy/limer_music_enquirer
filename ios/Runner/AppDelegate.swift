import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Related to Flutter
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    AmNativeApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: AmSwiftApi())

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
