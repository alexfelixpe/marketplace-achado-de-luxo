import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start MegaApi Group Code

class MegaApiGroup {
  static String baseUrl = 'http://api2.megaapi.com.br:15638';
  static Map<String, String> headers = {};
  static EnviarMensagemCall enviarMensagemCall = EnviarMensagemCall();
}

class EnviarMensagemCall {
  Future<ApiCallResponse> call({
    String? jid = '5511964591802@s.whatsapp.net',
    String? msg = 'Teste que deu certo',
  }) {
    final body = '''
{
  "jid": "${jid}",
  "body": "${msg}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EnviarMensagem',
      apiUrl: '${MegaApiGroup.baseUrl}/sendmessage?token=M_FvNkmxpbQGfi8',
      callType: ApiCallType.POST,
      headers: {
        ...MegaApiGroup.headers,
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

/// End MegaApi Group Code

/// Start FollowUnfollow Group Code

class FollowUnfollowGroup {
  static String baseUrl = 'https://achadodeluxo.com.br/api/1.1/wf/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer 4d01049ceef6c90c1b68270781d35e20',
  };
  static FollowCall followCall = FollowCall();
  static FollowersCall followersCall = FollowersCall();
  static FollowersCountCall followersCountCall = FollowersCountCall();
}

class FollowCall {
  Future<ApiCallResponse> call({
    String? vendedorID = '',
    String? seguidorID = '',
  }) {
    final body = '''
{
  "vendedorID": "${vendedorID}",
  "seguidorID": "${seguidorID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Follow',
      apiUrl: '${FollowUnfollowGroup.baseUrl}/follow',
      callType: ApiCallType.POST,
      headers: {
        ...FollowUnfollowGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class FollowersCall {
  Future<ApiCallResponse> call({
    String? vendedorID = '',
    String? clienteID = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Followers',
      apiUrl: '${FollowUnfollowGroup.baseUrl}/followers',
      callType: ApiCallType.GET,
      headers: {
        ...FollowUnfollowGroup.headers,
      },
      params: {
        'clienteID': clienteID,
        'vendedorID': vendedorID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  dynamic seguidor(dynamic response) => getJsonField(
        response,
        r'''$.response.seguidor''',
      );
}

class FollowersCountCall {
  Future<ApiCallResponse> call({
    String? vendedorID = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Followers Count',
      apiUrl: '${FollowUnfollowGroup.baseUrl}/followers_count',
      callType: ApiCallType.GET,
      headers: {
        ...FollowUnfollowGroup.headers,
      },
      params: {
        'vendedorID': vendedorID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: true,
    );
  }

  dynamic qtdSeguidores(dynamic response) => getJsonField(
        response,
        r'''$.response.seguidores''',
      );
}

/// End FollowUnfollow Group Code

/// Start Chat Group Code

class ChatGroup {
  static String baseUrl = 'https://achadodeluxo.com.br/api/1.1/wf';
  static Map<String, String> headers = {
    'Authorization': 'Bearer 4d01049ceef6c90c1b68270781d35e20',
  };
  static EnviarChatCall enviarChatCall = EnviarChatCall();
  static ListaDeChatsVendedorCall listaDeChatsVendedorCall =
      ListaDeChatsVendedorCall();
  static ListaDeMensagensCall listaDeMensagensCall = ListaDeMensagensCall();
  static ListaDeChatsClienteCall listaDeChatsClienteCall =
      ListaDeChatsClienteCall();
}

class EnviarChatCall {
  Future<ApiCallResponse> call({
    String? vendedorID = '',
    String? clienteID = '',
    String? mensagem = '',
    String? imagem = '',
    String? from = '',
    String? to = '',
  }) {
    final body = '''
{
"vendedorID":"${vendedorID}",
"clienteID":"${clienteID}",
"mensagem":"${mensagem}",
"imagem":"${imagem}",
"from":"${from}",
"to":"${to}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Enviar Chat',
      apiUrl: '${ChatGroup.baseUrl}/chat',
      callType: ApiCallType.POST,
      headers: {
        ...ChatGroup.headers,
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

class ListaDeChatsVendedorCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Lista de Chats Vendedor',
      apiUrl: '${ChatGroup.baseUrl}/chat_list_vendedor',
      callType: ApiCallType.GET,
      headers: {
        ...ChatGroup.headers,
      },
      params: {
        'userID': userID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  dynamic cliente(dynamic response) => getJsonField(
        response,
        r'''$.response.chatlist[:].Cliente''',
        true,
      );
  dynamic vendedor(dynamic response) => getJsonField(
        response,
        r'''$.response.chatlist[:].Vendedor''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.response.chatlist[:]._id''',
        true,
      );
  dynamic chatList(dynamic response) => getJsonField(
        response,
        r'''$.response.chatlist''',
        true,
      );
}

class ListaDeMensagensCall {
  Future<ApiCallResponse> call({
    String? vendedorID = '',
    String? clienteID = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Lista de Mensagens',
      apiUrl: '${ChatGroup.baseUrl}/chat_list_msg',
      callType: ApiCallType.GET,
      headers: {
        ...ChatGroup.headers,
      },
      params: {
        'vendedorID': vendedorID,
        'clienteID': clienteID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic msg(dynamic response) => getJsonField(
        response,
        r'''$.response.chatlist[:].Mensagem''',
        true,
      );
  dynamic to(dynamic response) => getJsonField(
        response,
        r'''$.response.chatlist[:].To''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.response.chatlist[:]._id''',
        true,
      );
  dynamic chat(dynamic response) => getJsonField(
        response,
        r'''$.response.chatlist[:].Chat''',
        true,
      );
  dynamic from(dynamic response) => getJsonField(
        response,
        r'''$.response.chatlist[:].From''',
        true,
      );
  dynamic response(dynamic response) => getJsonField(
        response,
        r'''$.response''',
      );
  dynamic chatList(dynamic response) => getJsonField(
        response,
        r'''$.response.chatlist[:]''',
        true,
      );
}

class ListaDeChatsClienteCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Lista de Chats Cliente',
      apiUrl: '${ChatGroup.baseUrl}/chat_list_cliente',
      callType: ApiCallType.GET,
      headers: {
        ...ChatGroup.headers,
      },
      params: {
        'userID': userID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  dynamic cliente(dynamic response) => getJsonField(
        response,
        r'''$.response.chatlist[:].Cliente''',
        true,
      );
  dynamic vendedor(dynamic response) => getJsonField(
        response,
        r'''$.response.chatlist[:].Vendedor''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.response.chatlist[:]._id''',
        true,
      );
  dynamic chatList(dynamic response) => getJsonField(
        response,
        r'''$.response.chatlist''',
        true,
      );
}

/// End Chat Group Code

/// Start Img Group Code

class ImgGroup {
  static String baseUrl = 'https://achadodeluxo.com.br/version-test/api/1.1/wf';
  static Map<String, String> headers = {
    'Authorization': 'Bearer 4d01049ceef6c90c1b68270781d35e20',
  };
  static ImageUploadCall imageUploadCall = ImageUploadCall();
}

class ImageUploadCall {
  Future<ApiCallResponse> call({
    String? image = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ImageUpload',
      apiUrl: '${ImgGroup.baseUrl}/image_upload',
      callType: ApiCallType.POST,
      headers: {
        ...ImgGroup.headers,
      },
      params: {
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  dynamic imgUrl(dynamic response) => getJsonField(
        response,
        r'''$.response.imageUrl''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic response(dynamic response) => getJsonField(
        response,
        r'''$.response''',
      );
}

/// End Img Group Code

/// Start User Group Code

class UserGroup {
  static String baseUrl = 'https://achadodeluxo.com.br/api/1.1/wf';
  static Map<String, String> headers = {
    'Authorization': 'Bearer 4d01049ceef6c90c1b68270781d35e20',
  };
  static UserImgProfileCall userImgProfileCall = UserImgProfileCall();
}

class UserImgProfileCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? image = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'UserImgProfile',
      apiUrl: '${UserGroup.baseUrl}/userimage',
      callType: ApiCallType.POST,
      headers: {
        ...UserGroup.headers,
      },
      params: {
        'image': image,
        'id': id,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End User Group Code

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
      decodeUtf8: true,
      cache: true,
    );
  }

  static dynamic foto(dynamic response) => getJsonField(
        response,
        r'''$.response.Foto''',
      );
  static dynamic whatsApp(dynamic response) => getJsonField(
        response,
        r'''$.response.WhatsApp''',
      );
  static dynamic slug(dynamic response) => getJsonField(
        response,
        r'''$.response.Slug''',
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.response.authentication.email.email''',
      );
  static dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.response.Nome''',
      );
  static dynamic response(dynamic response) => getJsonField(
        response,
        r'''$.response''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.response._id''',
      );
  static dynamic likes(dynamic response) => getJsonField(
        response,
        r'''$.response.LikesProdutos''',
        true,
      );
  static dynamic cpf(dynamic response) => getJsonField(
        response,
        r'''$.response.CPF''',
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
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic produto(dynamic response) => getJsonField(
        response,
        r'''$.response.produto''',
      );
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

  static dynamic produto(dynamic response) => getJsonField(
        response,
        r'''$.response.produto''',
      );
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
      decodeUtf8: true,
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
      decodeUtf8: true,
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
  static dynamic imagens(dynamic response) => getJsonField(
        response,
        r'''$.response.Imagem''',
        true,
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
      decodeUtf8: true,
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
      decodeUtf8: true,
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
      decodeUtf8: true,
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
      decodeUtf8: true,
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
      decodeUtf8: true,
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
      decodeUtf8: true,
      cache: true,
    );
  }

  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response.results''',
        true,
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:]._id''',
        true,
      );
  static dynamic vendedor(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].Vendedor''',
        true,
      );
  static dynamic imagens(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].ImagemRemota''',
        true,
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
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response.results''',
      );
}

class ProdutosNovidadesPorVendedorCall {
  static Future<ApiCallResponse> call({
    String? sortField = 'created%20date',
    bool? descending = true,
    String? apiToken = '4d01049ceef6c90c1b68270781d35e20',
    String? constraints =
        '%5B%7B%22key%22%3A%22is_marketplace%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%22true%22%7D%2C%7B%22key%22%3A%22Status%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%221638810592650x910538349165423400%22%7D%2C%7B%22key%22%3A%22Quantidade%22%2C%22constraint_type%22%3A%22greater%20than%22%2C%22value%22%3A%220%22%7D%2C%7B%22key%22%3A%22is_featured%22%2C%22constraint_type%22%3A%22equals%22%2C%22value%22%3A%22true%22%7D%5D',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Produtos Novidades por Vendedor',
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
      cache: true,
    );
  }

  static dynamic allFields(dynamic response) => getJsonField(
        response,
        r'''$.response.results''',
        true,
      );
  static dynamic response(dynamic response) => getJsonField(
        response,
        r'''$.response''',
      );
  static dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].Nome''',
        true,
      );
  static dynamic quantidade(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].Quantidade''',
        true,
      );
  static dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].Preco''',
        true,
      );
  static dynamic slug(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].Slug''',
        true,
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].Descricao''',
        true,
      );
  static dynamic vendedor(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].Vendedor''',
        true,
      );
  static dynamic cor(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].Cor''',
        true,
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].Status''',
        true,
      );
  static dynamic marca(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].Marca''',
        true,
      );
  static dynamic consdicao(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].Condicao''',
        true,
      );
  static dynamic vires(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].Visualizacoes''',
        true,
      );
  static dynamic viewer(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].Visualizadores''',
        true,
      );
  static dynamic imagens(dynamic response) => getJsonField(
        response,
        r'''$.response.results[:].ImagemRemota''',
        true,
      );
  static dynamic qtd1(dynamic response) => getJsonField(
        response,
        r'''$.response.count''',
      );
  static dynamic qtd2(dynamic response) => getJsonField(
        response,
        r'''$.response.remaining''',
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
