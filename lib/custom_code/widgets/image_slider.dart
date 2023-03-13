// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    Key? key,
    this.width,
    this.height,
    required this.imageUrls,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String> imageUrls;

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      /// Width of the [ImageSlideshow].
      width: widget.width ?? double.infinity,

      /// Height of the [ImageSlideshow].
      height: widget.height ?? 200,

      /// The page to show when first creating the [ImageSlideshow].
      initialPage: 0,

      /// The color to paint the indicator.
      indicatorColor: Colors.blue,

      /// The color to paint behind th indicator.
      indicatorBackgroundColor: Colors.grey,

      /// The widgets to display in the [ImageSlideshow].
      children: [
        for (final url in widget.imageUrls)
          Image.network(
            url,
            fit: BoxFit.cover,
          ),
      ],

      /// Called whenever the page in the center of the viewport changes.
      onPageChanged: (value) {
        print('Page changed: $value');
      },

      /// Auto scroll interval.
      /// Do not auto scroll with null or 0.
      autoPlayInterval: 3000,

      /// Loops back to first slide.
      isLoop: true,
    );
  }
}
