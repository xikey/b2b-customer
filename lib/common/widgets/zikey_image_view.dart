import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'dot_loading_widget.dart';

class ZikeyImageView extends StatelessWidget {
  const ZikeyImageView({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white60,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => const DotLoadingWidget(size: 5),
        errorWidget: (context, url, error) => Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/images/img_yadegar_logo_gray_png.png')),
      ),
    );
  }
}
