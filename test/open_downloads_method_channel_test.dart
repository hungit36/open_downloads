import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_downloads/open_downloads_method_channel.dart';

void main() {
  MethodChannelOpenDownloads platform = MethodChannelOpenDownloads();
  const MethodChannel channel = MethodChannel('open_downloads');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.openDownloads(), '42');
  });
}
