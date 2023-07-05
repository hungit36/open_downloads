import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'open_downloads_platform_interface.dart';

/// An implementation of [OpenDownloadsPlatform] that uses method channels.
class MethodChannelOpenDownloads extends OpenDownloadsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('open_downloads');

  @override
  Future<bool> openDownloads() async {
    final version = await methodChannel.invokeMethod<bool?>('openDownloads');
    return version ?? false;
  }
}
