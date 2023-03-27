// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> getProdutosJson() async {
  var sortField = 'created date';
  var descending = true;
  var apiToken = '4d01049ceef6c90c1b68270781d35e20';
  var constraints = jsonEncode([
    {"key": "is_marketplace", "constraint_type": "equals", "value": "true"},
    {
      "key": "Status",
      "constraint_type": "equals",
      "value": "1638810592650x910538349165423400"
    },
    {"key": "Quantidade", "constraint_type": "greater than", "value": "0"},
    {"key": "is_featured", "constraint_type": "equals", "value": "true"}
  ]);

  var cursor = 0;
  var remaining = 1;
  var produtos = [];

  var appState = FFAppState();
  while (remaining > 0 && cursor < 10) {
    // Verifica se o valor de cursor é menor que 10
    var url = Uri.parse(
        'https://achadodeluxo.com.br/api/1.1/obj/produto?sort_field=$sortField&descending=$descending&api_token=$apiToken&constraints=$constraints&cursor=$cursor');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      produtos.addAll(jsonResponse['response']['results']);
      remaining = jsonResponse['response']['remaining'];
      cursor += 1;
      appState.produtosTemp = produtos;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      break;
    }
  }
}
