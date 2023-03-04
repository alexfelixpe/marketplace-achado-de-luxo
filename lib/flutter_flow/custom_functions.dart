import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../../auth/auth_util.dart';

String? imageCompress(String? url) {
  // Add your function code here!

  //return "https://d1muf25xaso8hp.cloudfront.net/" +
  //    (url ?? "") +
  //    "?w=220&h=220&auto=compress,enhance,&q=100&dpr=2&fit=max";

  return "https://d1muf25xaso8hp.cloudfront.net/" + (url ?? "");
}

String? transformString(String inputString) {
  String outputString = inputString.replaceAll(".", ",");
  if (!outputString.contains(",")) {
    outputString += ",00";
  } else if (outputString.split(",")[1].length == 1) {
    outputString += "0";
  }
  return outputString;
}

String? circleImage(String? imageUrl) {
  if (imageUrl == null || !imageUrl.startsWith('//')) {
    return 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y';
  } else {
    return 'https:' + imageUrl;
  }
}

String urlEncoder(String input) {
  return Uri.encodeFull(input);
}
