import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey(Bundle.main.googleMapKey)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

extension Bundle {
    var googleMapKey: String {
        guard let file = self.path(forResource: "Keys", ofType: "plist") else {
            fatalError("Can't find Key File")
        }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["GoogleMapKey"] as? String else {
            fatalError("googleMapKey error")
        }

        return key
    }
}
