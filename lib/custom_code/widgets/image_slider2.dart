// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

class ImageSlider2 extends StatefulWidget {
  const ImageSlider2({
    Key? key,
    this.width,
    this.height,
    this.images,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String>? images;

  @override
  _ImageSlider2State createState() => _ImageSlider2State();
}

class _ImageSlider2State extends State<ImageSlider2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 100,
            ),
            FanCarouselImageSlider(
              imagesLink: widget.images ?? [],
              isAssets: false,
              autoPlay: true,
            ),
          ],
        ),
      ),
    );
  }
}
