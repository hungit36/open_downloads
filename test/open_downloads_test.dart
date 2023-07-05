import 'package:flutter_test/flutter_test.dart';
import 'package:open_downloads/open_downloads.dart';
import 'package:open_downloads/open_downloads_platform_interface.dart';
import 'package:open_downloads/open_downloads_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOpenDownloadsPlatform
    with MockPlatformInterfaceMixin
    implements OpenDownloadsPlatform {

  @override
  Future<bool> openDownloads() => Future.value(true);
}

void main() {
  final OpenDownloadsPlatform initialPlatform = OpenDownloadsPlatform.instance;

  test('$MethodChannelOpenDownloads is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOpenDownloads>());
  });

  test('getPlatformVersion', () async {
    MockOpenDownloadsPlatform fakePlatform = MockOpenDownloadsPlatform();
    OpenDownloadsPlatform.instance = fakePlatform;

    expect(await openDownloads(), true);
  });
}
