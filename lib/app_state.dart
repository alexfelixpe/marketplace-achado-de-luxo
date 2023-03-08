import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _logged = prefs.getBool('ff_logged') ?? _logged;
    _userid = prefs.getString('ff_userid') ?? _userid;
    _token = prefs.getString('ff_token') ?? _token;
    _userWhats = prefs.getString('ff_userWhats') ?? _userWhats;
    _Feed = prefs.getStringList('ff_Feed')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _Feed;
    _prodMsg = prefs.getStringList('ff_prodMsg')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _prodMsg;
    _likedProds = prefs.getStringList('ff_likedProds') ?? _likedProds;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _logged = false;
  bool get logged => _logged;
  set logged(bool _value) {
    _logged = _value;
    prefs.setBool('ff_logged', _value);
  }

  String _userid = '';
  String get userid => _userid;
  set userid(String _value) {
    _userid = _value;
    prefs.setString('ff_userid', _value);
  }

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    prefs.setString('ff_token', _value);
  }

  String _userWhats = '';
  String get userWhats => _userWhats;
  set userWhats(String _value) {
    _userWhats = _value;
    prefs.setString('ff_userWhats', _value);
  }

  List<dynamic> _Feed = [];
  List<dynamic> get Feed => _Feed;
  set Feed(List<dynamic> _value) {
    _Feed = _value;
    prefs.setStringList('ff_Feed', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToFeed(dynamic _value) {
    _Feed.add(_value);
    prefs.setStringList('ff_Feed', _Feed.map((x) => jsonEncode(x)).toList());
  }

  void removeFromFeed(dynamic _value) {
    _Feed.remove(_value);
    prefs.setStringList('ff_Feed', _Feed.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromFeed(int _index) {
    _Feed.removeAt(_index);
    prefs.setStringList('ff_Feed', _Feed.map((x) => jsonEncode(x)).toList());
  }

  String _prodNome = '';
  String get prodNome => _prodNome;
  set prodNome(String _value) {
    _prodNome = _value;
  }

  String _prodDescricao = '';
  String get prodDescricao => _prodDescricao;
  set prodDescricao(String _value) {
    _prodDescricao = _value;
  }

  String _prodCategoria = '';
  String get prodCategoria => _prodCategoria;
  set prodCategoria(String _value) {
    _prodCategoria = _value;
  }

  String _prodTamanho = '';
  String get prodTamanho => _prodTamanho;
  set prodTamanho(String _value) {
    _prodTamanho = _value;
  }

  double _prodPreco = 0.0;
  double get prodPreco => _prodPreco;
  set prodPreco(double _value) {
    _prodPreco = _value;
  }

  String _prodCondicao = '';
  String get prodCondicao => _prodCondicao;
  set prodCondicao(String _value) {
    _prodCondicao = _value;
  }

  String _prodCor = '';
  String get prodCor => _prodCor;
  set prodCor(String _value) {
    _prodCor = _value;
  }

  String _prodMarca = '';
  String get prodMarca => _prodMarca;
  set prodMarca(String _value) {
    _prodMarca = _value;
  }

  String _prodGenero = '';
  String get prodGenero => _prodGenero;
  set prodGenero(String _value) {
    _prodGenero = _value;
  }

  int _prodQtd = 0;
  int get prodQtd => _prodQtd;
  set prodQtd(int _value) {
    _prodQtd = _value;
  }

  String _prodImg1 = '';
  String get prodImg1 => _prodImg1;
  set prodImg1(String _value) {
    _prodImg1 = _value;
  }

  List<dynamic> _prodMsg = [];
  List<dynamic> get prodMsg => _prodMsg;
  set prodMsg(List<dynamic> _value) {
    _prodMsg = _value;
    prefs.setStringList(
        'ff_prodMsg', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToProdMsg(dynamic _value) {
    _prodMsg.add(_value);
    prefs.setStringList(
        'ff_prodMsg', _prodMsg.map((x) => jsonEncode(x)).toList());
  }

  void removeFromProdMsg(dynamic _value) {
    _prodMsg.remove(_value);
    prefs.setStringList(
        'ff_prodMsg', _prodMsg.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromProdMsg(int _index) {
    _prodMsg.removeAt(_index);
    prefs.setStringList(
        'ff_prodMsg', _prodMsg.map((x) => jsonEncode(x)).toList());
  }

  List<String> _likedProds = [];
  List<String> get likedProds => _likedProds;
  set likedProds(List<String> _value) {
    _likedProds = _value;
    prefs.setStringList('ff_likedProds', _value);
  }

  void addToLikedProds(String _value) {
    _likedProds.add(_value);
    prefs.setStringList('ff_likedProds', _likedProds);
  }

  void removeFromLikedProds(String _value) {
    _likedProds.remove(_value);
    prefs.setStringList('ff_likedProds', _likedProds);
  }

  void removeAtIndexFromLikedProds(int _index) {
    _likedProds.removeAt(_index);
    prefs.setStringList('ff_likedProds', _likedProds);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
