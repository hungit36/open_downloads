import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'open_downloads_method_channel.dart';

abstract class OpenDownloadsPlatform extends PlatformInterface {
  /// Constructs a OpenDownloadsPlatform.
  OpenDownloadsPlatform() : super(token: _token);

  static final Object _token = Object();

  static OpenDownloadsPlatform _instance = MethodChannelOpenDownloads();

  /// The default instance of [OpenDownloadsPlatform] to use.
  ///
  /// Defaults to [MethodChannelOpenDownloads].
  static OpenDownloadsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OpenDownloadsPlatform] when
  /// they register themselves.
  static set instance(OpenDownloadsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> openDownloads() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
