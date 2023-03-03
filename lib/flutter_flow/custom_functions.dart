import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../../auth/auth_util.dart';
import 'package:http/http.dart' as http;

String imageCompress(String? url) {
  // Add your function code here!

  return "https://d1muf25xaso8hp.cloudfront.net/" +
      (url ?? "") +
      "?w=220&h=220&auto=compress,enhance,&q=100&dpr=2&fit=max";
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

Future<String?> circleImage(String? imageUrl) async {

  if (imageUrl == null || imageUrl.isEmpty || !imageUrl.startsWith("//")) {
    return "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y"; // Insira aqui a URL da imagem genérica que deseja exibir
  } else {
    final response = await http.get(Uri.parse('https:' + imageUrl));
    if (response.statusCode == 200) {
      return 'https:' + imageUrl;
    } else {
      return "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y";
    }
  }

}
