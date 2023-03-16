// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> refreshPage(BuildContext context, String? pageName) async {
  // Add your function code here!
  await Future.delayed(Duration(seconds: 1));
  Navigator.pushReplacementNamed(context, pageName ?? '/');
}
