import Flutter
import UIKit
import workmanager

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }

    if(!UserDefaults.standard.bool(forKey: "Notification")) {
      UIApplication.shared.cancelAllLocalNotifications()
      UserDefaults.standard.set(true, forKey: "Notification")
    }

    // todo-00-init-02: setup ios capability on XCode
    // todo-00-init-02: setup ios on AppDelefatge.swift
    WorkmanagerPlugin.setPluginRegistrantCallback { registry in
        // Registry in this case is the FlutterEngine that is created in Workmanager's
        // performFetchWithCompletionHandler or BGAppRefreshTask.
        // This will make other plugins available during a background operation.
        GeneratedPluginRegistrant.register(with: registry)
    }

    // In AppDelegate.application method
    WorkmanagerPlugin.registerBGProcessingTask(withIdentifier: "task-identifier")

    // Register a periodic task in iOS 13+
    WorkmanagerPlugin.registerPeriodicTask(withIdentifier: "com.dicoding.notificationApp", frequency: NSNumber(value: 16 * 60))

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
