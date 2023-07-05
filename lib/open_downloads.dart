
import 'open_downloads_platform_interface.dart';

Future<bool> openDownloads() {
  return OpenDownloadsPlatform.instance.openDownloads();
}