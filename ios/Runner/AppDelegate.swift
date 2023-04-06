import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Pigeon setup
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    AppleMusicNativeApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: AppleMusicNativeApiImpl())

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
