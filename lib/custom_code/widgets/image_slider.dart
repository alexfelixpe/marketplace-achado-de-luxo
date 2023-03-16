// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
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
  late final List<ImageProvider> _imageProviders;

  @override
  void initState() {
    super.initState();
    _imageProviders = widget.imageUrls.map((url) {
      return NetworkImage(
        "https://d1muf25xaso8hp.cloudfront.net/$url",
      );
    }).toList();
  }

  Future<void> _precacheImages() async {
    for (final provider in _imageProviders) {
      await precacheImage(provider, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _precacheImages();
    });

    return Stack(
      children: [
        ImageSlideshow(
          width: widget.width ?? 300,
          height: widget.height ?? 200,
          initialPage: 0,
          indicatorColor: Colors.blue,
          indicatorBackgroundColor: Colors.grey,
          children: [
            for (final provider in _imageProviders)
              Image(image: provider, fit: BoxFit.cover),
          ],
          onPageChanged: (value) {
            print('Page changed: $value');
          },
          autoPlayInterval: 0,
          isLoop: true,
        ),
      ],
    );
  }
}
