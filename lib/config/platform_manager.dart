import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformManager {
  bool isWeb = false;
  bool isAndroid = false;
  bool isWindows = false;
  bool isIos = false;

  void setPlatform(BuildContext context) {
    final platform = Theme.of(context).platform;
    if (platform == TargetPlatform.windows) {
      isWindows = true;
      isWeb = false;
      isAndroid = false;
      isIos = false;
    }
    if (platform == TargetPlatform.android) {
      isWindows = false;
      isWeb = false;
      isAndroid = true;
      isIos = false;
    }
    if (platform == TargetPlatform.iOS) {
      isWindows = false;
      isWeb = false;
      isAndroid = false;
      isIos = true;
    }
    if (kIsWeb) {
      isWindows = false;
      isWeb = true;
      isAndroid = false;
      isIos = false;
    }
  }
}
