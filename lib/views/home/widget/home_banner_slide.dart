import 'package:flutter/material.dart';
import 'package:swift_rides/views/home/widget/home_banner.dart';
import 'package:swift_rides/widgets/custom_page_indicator.dart';

class HomeBannerSlide extends StatefulWidget {
  const HomeBannerSlide({
    super.key,
    required this.images,
  });

  final List images;

  @override
  State<HomeBannerSlide> createState() => _HomeBannerSlideState();
}

class _HomeBannerSlideState extends State<HomeBannerSlide> {
  int intialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.81,
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                intialIndex = value;
              });
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) =>
                HomeBanner(image: widget.images[index]),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: CustomPageIndicator(
              pageLength: widget.images.length,
              currentIndexPage: intialIndex,
            ),
          )
        ],
      ),
    );
  }
}
