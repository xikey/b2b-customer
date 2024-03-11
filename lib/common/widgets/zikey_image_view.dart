import 'package:b2b_customer/common/utils/logger.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_network/image_network.dart';

import '../../config/colors.dart';
import 'dot_loading_widget.dart';

class ZikeyImageView extends StatelessWidget {
  const ZikeyImageView({
    Key? key,
    required this.imageUrl,
    this.borderRadius = 0,
    this.backgroundColor, required this.width, required this.height,
  }) : super(key: key);

  final String imageUrl;
  final double borderRadius;
  final Color? backgroundColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {

      // Use original approach for other platforms
      return _buildCachedNetworkImage();

  }

  Widget _buildCachedNetworkImage() {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            color: AppColors.appGrey,
            borderRadius: BorderRadius.circular(borderRadius),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => const DotLoadingWidget(size: 5),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.all(10),
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/img_yadegar_logo_gray_png.png',
            ),
          ),
        ),
      ),
    );
  }
}
