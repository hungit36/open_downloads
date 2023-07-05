import Flutter
import UIKit

public class SwiftOpenDownloadsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "open_downloads", binaryMessenger: registrar.messenger())
        let instance = SwiftOpenDownloadsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard call.method == "openDownloads" else {
            result(FlutterMethodNotImplemented)
            return
        }
        let path = getDocumentsDirectory().absoluteString.replacingOccurrences(of: "file://", with: "shareddocuments://")
        let url = URL(string: path)!
        UIApplication.shared.open(url)
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}

