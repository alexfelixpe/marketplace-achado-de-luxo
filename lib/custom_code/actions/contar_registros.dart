// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;

String? contarRegistros(String? apiURL) {
  // Faz a chamada à API
  http.get(Uri.parse(apiURL!)).then((response) {
    if (response.statusCode == 200) {
      // Converte a resposta para JSON
      final jsonResponse = jsonDecode(response.body);
      // Retorna o número de registros
      return jsonResponse.length.toString();
    } else {
      // Caso a chamada à API não seja bem sucedida, retorna null
      return null;
    }
  });
  return null;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
