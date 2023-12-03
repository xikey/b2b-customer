import 'package:b2b_customer/common/utils/logger.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../common/widgets/zikey_image_view.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key, required this.hegiht});

  @override
  _ImageSliderState createState() => _ImageSliderState();
  final double hegiht;
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  List<String> _images = [
    'https://dkstatics-public.digikala.com/digikala-adservice-banners/0bcc9eb9cfad4667b64b12a52e4e0e145c9cc162_1701239185.jpg?x-oss-process=image/quality,q_95/format,webp',
    'https://dkstatics-public.digikala.com/digikala-adservice-banners/16b98592c28b78718abd8d6554cffc5fa265c8eb_1701418129.jpg?x-oss-process=image/quality,q_95/format,webp',
    'https://dkstatics-public.digikala.com/digikala-adservice-banners/a61e7f6c3c5a9c5047aac446c6b6c29dd0dec02c_1701245239.jpg?x-oss-process=image/quality,q_95/format,webp',
    'https://dkstatics-public.digikala.com/ddservice-banners/a61e7f6c3c5a9c5047aac446c6b6c29dd0dec02c_1701245239.jpg?x-oss-process=image/quality,q_95/format,webp',
  ];

  late CarouselController _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _pageController = PageController(initialPage: _currentIndex);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: widget.hegiht, // Set the desired height here
          child: CarouselSlider(
            carouselController: _carouselController,
            items: _images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    child: ZikeyImageView(
                      imageUrl: image,
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });

                // Manually update the page controller
                if (_pageController.hasClients) {
                  _pageController.jumpToPage(index);
                }
              },
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _images.length,
              effect: ExpandingDotsEffect(
                  dotWidth: 5, dotHeight: 5, activeDotColor: Colors.white),
              // Choose the desired effect here
              onDotClicked: (index) {
                _carouselController.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
            ),
          ),
        ),
      ],
    );
  }
}
