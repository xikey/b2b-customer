
import 'dart:ui';

import 'package:flutter/material.dart';

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    // Customize the appearance of the scrollbar
    return super.buildScrollbar(context, child, details);
  }

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };

  @override
  TargetPlatform getPlatform(BuildContext context) {
    // Customize the scroll behavior based on the platform
    return super.getPlatform(context);
  }
}