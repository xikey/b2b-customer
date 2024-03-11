import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../common/model/image_slider_item.dart';
import '../../../../../../common/widgets/zikey_image_view.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key, required this.hegiht, required this.items, required this.width});

  final List<ImageSliderItem> items;

  @override
  _ImageSliderState createState() => _ImageSliderState();
  final double hegiht;
  final double width;
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;

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
            items: widget.items.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    child: ZikeyImageView(
                      imageUrl: item.imageUrl, width: widget.width, height: widget.hegiht,
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
              count: widget.items.length,
              effect: const ExpandingDotsEffect(
                  dotWidth: 5, dotHeight: 5, activeDotColor: Colors.white),
              // Choose the desired effect here
              onDotClicked: (index) {
                _carouselController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
            ),
          ),
        ),
      ],
    );
  }
}
