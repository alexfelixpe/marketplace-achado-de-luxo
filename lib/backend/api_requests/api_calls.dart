import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AuthCall {
  static Future<ApiCallResponse> call({
    String? user = '11964591802',
    String? pass = 't~#b93EU',
  }) {
    final body = '''
{
  "user": "${user}",
  "pass": "${pass}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Auth',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/wf/auth',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SignUpCall {
  static Future<ApiCallResponse> call({
    String? user = '11964591802',
    String? pass = 't~#b93EU',
    String? pass2 = '',
    String? nome = '',
  }) {
    final body = '''
{
  "user": "${user}",
  "pass": "${pass}",
  "pass2":"${pass2}",
  "nome": "${nome}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignUp',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/wf/signup',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RecuperarSenhaCall {
  static Future<ApiCallResponse> call({
    String? user = '11964591802',
  }) {
    final body = '''
{
  "user": "${user}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Recuperar Senha',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/wf/recuperarsenha',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UsersByIdCall {
  static Future<ApiCallResponse> call({
    String? id = '1629160184464x401863667371507900',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Users By Id',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/obj/User/${id}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic foto(dynamic response) => getJsonField(
        response,
        r'''$.response.Foto''',
      );
  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response.WhatsApp''',
      );
  static dynamic whatsApp(dynamic response) => getJsonField(
        response,
        r'''$.response.WhatsApp''',
      );
}

class DoLikeCall {
  static Future<ApiCallResponse> call({
    String? produtoId = '1632006887399x950499796758326700',
    String? userId = '1647898108614x612485062341748900',
  }) {
    final body = '''
{
  "produto_id": "${produtoId}",
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DoLike',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/wf/dolike',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer 4d01049ceef6c90c1b68270781d35e20',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DislikeCall {
  static Future<ApiCallResponse> call({
    String? produtoId = '1632006887399x950499796758326700',
    String? userId = '1647898108614x612485062341748900',
  }) {
    final body = '''
{
  "produto_id": "${produtoId}",
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Dislike',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/wf/dislike',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer 4d01049ceef6c90c1b68270781d35e20',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CategoriasCall {
  static Future<ApiCallResponse> call({
    String? sortField = 'Categoria',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Categorias',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/obj/Categoria',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'sort_field': sortField,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.response.results..Categoria''',
      );
  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response.results''',
      );
}

class ProdutosByIdCall {
  static Future<ApiCallResponse> call({
    String? id = '1629160184464x401863667371507900',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Produtos By Id',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/obj/Produto/${id}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic preco(dynamic response) => getJsonField(
        response,
        r'''$.response.Preco''',
      );
  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response''',
      );
}

class AddToCartCall {
  static Future<ApiCallResponse> call({
    String? produtoId = '1632006887399x950499796758326700',
    String? userId = '1647898108614x612485062341748900',
    int? qtd = 1,
  }) {
    final body = '''
{
  "produto_id": "${produtoId}",
  "user_id": "${userId}",
  "qtd": ${qtd}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddToCart',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/wf/addtocart',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer 4d01049ceef6c90c1b68270781d35e20',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CarrinhoCall {
  static Future<ApiCallResponse> call({
    String? constraints =
        '%5B%7B%22key%22%3A%22Cliente%22%2C%22constraint_type%22%3A%22equals%22%2C%20%22value%22%3A%221629941839334x700143847442231700%22%7D%2C%7B%22key%22%3A%22is_pago%22%2C%22constraint_type%22%3A%22equals%22%2C%22false%22%3A%221638810592650x910538349165423400%22%7D%5D',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Carrinho',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/obj/Carrinho',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      params: {
        'constraints': constraints,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response.results''',
      );
}

class GeneroCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Genero',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/obj/Genero',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.response.results..Categoria''',
      );
  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response.results''',
      );
}

class TamanhoCall {
  static Future<ApiCallResponse> call({
    String? sortField = 'Nome',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Tamanho',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/obj/Tamanho',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'sort_field': sortField,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.response.results..Nome''',
      );
  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response.results''',
      );
}

class CorCall {
  static Future<ApiCallResponse> call({
    String? sortField = 'Nome',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Cor',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/obj/Cor',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'sort_field': sortField,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.response.results..Nome''',
      );
  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response.results''',
      );
}

class MarcasCall {
  static Future<ApiCallResponse> call({
    String? sortField = 'Nome',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Marcas',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/obj/Marcas',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'sort_field': sortField,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.response.results..Nome''',
      );
  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response.results''',
      );
}

class CriarProdutoCall {
  static Future<ApiCallResponse> call({
    String? nome = '1632006887399x950499796758326700',
    String? descricao = '1647898108614x612485062341748900',
    int? quantidade = 1,
    double? preco = 20.00,
    String? categoria = 'Categoria',
    String? tamanho = 'Tamanho',
    String? genero = 'Feminino',
    String? marca = 'Marca',
    String? vendedorId = '1656535918618x317617639591572860',
    String? condicao = 'Novo',
    String? cor = 'Amarelo',
    String? imagem1 = '',
    String? imagem2 = '',
    String? imagem3 = '',
    String? imagem4 = '',
    String? imagem5 = '',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "descricao": "${descricao}",
  "preco": ${preco},
  "quantidade": ${quantidade},
  "categoria": "${categoria}",
  "tamanho": "${tamanho}",
  "genero": "${genero}",
  "marca": "${marca}",
  "vendedor_id": "${vendedorId}",
  "condicao": "${condicao}",
  "cor": "${cor}",
  "imagem1": "${imagem1}",
  "imagem2": "${imagem2}",
  "imagem3": "${imagem3}",
  "imagem4": "${imagem4}",
  "imagem5": "${imagem5}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CriarProduto',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/wf/criarproduto',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer 4d01049ceef6c90c1b68270781d35e20',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.response..prod_id''',
      );
}

class UploadImageCall {
  static Future<ApiCallResponse> call({
    String? key = 'a45f6a3877004f8f65b9c36dec39919d',
    String? image = 'https://i.ibb.co/3NMtq69/Logo-Horizontal.jpg',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'UploadImage',
      apiUrl: 'https://api.imgbb.com/1/upload?key=${key}&image=${image}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.data.image..url''',
      );
  static dynamic thumb(dynamic response) => getJsonField(
        response,
        r'''$.data.thumb.url''',
      );
}

class ProdutosNovidadesCall {
  static Future<ApiCallResponse> call({
    String? sortField = 'created%20date',
    bool? descending = true,
    String? apiToken = '4d01049ceef6c90c1b68270781d35e20',
    String? constraints =
        '%5B%7B%22key%22%3A%22is_marketplace%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%22true%22%7D%2C%7B%22key%22%3A%22Status%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%221638810592650x910538349165423400%22%7D%2C%7B%22key%22%3A%22Quantidade%22%2C%22constraint_type%22%3A%22greater%20than%22%2C%22value%22%3A%220%22%7D%2C%7B%22key%22%3A%22is_featured%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%22true%22%7D%5D',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Produtos Novidades',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/obj/produto',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json;charset=utf-8',
      },
      params: {
        'sort_field': sortField,
        'descending': descending,
        'api_token': apiToken,
        'constraints': constraints,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response.results''',
      );
}

class ProdutosBuscaCall {
  static Future<ApiCallResponse> call({
    String? sortField = 'created%20date',
    bool? descending = true,
    String? apiToken = '4d01049ceef6c90c1b68270781d35e20',
    String? constraints =
        '%5B%7B%22key%22%3A%22is_marketplace%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%22true%22%7D%2C%7B%22key%22%3A%22Status%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%221638810592650x910538349165423400%22%7D%2C%7B%22key%22%3A%22Quantidade%22%2C%22constraint_type%22%3A%22greater%20than%22%2C%22value%22%3A%220%22%7D%2C%7B%22key%22%3A%22is_featured%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%22true%22%7D%2C%7B%22key%22%3A%22Nome%22%2C%22constraint_type%22%3A%22text%20contains%22%2C%20%22value%22%3A%22%22%7D%2C%7B%22key%22%3A%22Cor%22%2C%22constraint_type%22%3A%22text%20contains%22%2C%20%22value%22%3A%22%22%7D%2C%7B%22key%22%3A%22Marca%22%2C%22constraint_type%22%3A%22text%20contains%22%2C%20%22value%22%3A%22%22%7D%5D',
    int? cursor = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Produtos Busca',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/obj/produto',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Access-Control-Allow-Origin': '*',
      },
      params: {
        'sort_field': sortField,
        'descending': descending,
        'api_token': apiToken,
        'constraints': constraints,
        'cursor': cursor,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response.results''',
      );
}

class ProdutosNovidadesCopyCall {
  static Future<ApiCallResponse> call({
    String? sortField = 'created%20date',
    bool? descending = true,
    String? apiToken = '4d01049ceef6c90c1b68270781d35e20',
    String? constraints =
        '%5B%7B%22key%22%3A%22is_marketplace%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%22true%22%7D%2C%7B%22key%22%3A%22Status%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%221638810592650x910538349165423400%22%7D%2C%7B%22key%22%3A%22Quantidade%22%2C%22constraint_type%22%3A%22greater%20than%22%2C%22value%22%3A%220%22%7D%2C%7B%22key%22%3A%22is_featured%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%22true%22%7D%5D',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Produtos Novidades Copy',
      apiUrl: 'https://achadodeluxo.com.br/api/1.1/obj/produto',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json;charset=utf-8',
      },
      params: {
        'sort_field': sortField,
        'descending': descending,
        'api_token': apiToken,
        'constraints': constraints,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response.results''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
