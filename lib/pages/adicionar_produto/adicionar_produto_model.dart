import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/categoria/categoria_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/main.dart';
import '/pages/login/login_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdicionarProdutoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Nomedoproduto widget.
  final nomedoprodutoKey = GlobalKey();
  TextEditingController? nomedoprodutoController;
  String? nomedoprodutoSelectedOption;
  String? Function(BuildContext, String?)? nomedoprodutoControllerValidator;
  // State field(s) for Descricao widget.
  TextEditingController? descricaoController;
  String? Function(BuildContext, String?)? descricaoControllerValidator;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for Preco widget.
  TextEditingController? precoController;
  String? Function(BuildContext, String?)? precoControllerValidator;
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (ImageUpload)] action in IconButton widget.
  ApiCallResponse? apiImageUploadResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    descricaoController?.dispose();
    precoController?.dispose();
  }

  /// Additional helper methods are added here.

}
