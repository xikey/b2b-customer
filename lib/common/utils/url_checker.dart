import 'package:path/path.dart' as p;

class UrlChecker {
  static bool isImageUrl(String url) {
    final fileExtension = p.extension(url).toLowerCase();
    final hasValidProtocol = url.startsWith('http://') || url.startsWith('https://');
    return hasValidProtocol && (fileExtension == '.jpg' || fileExtension == '.jpeg' || fileExtension == '.png');
  }
}