import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_media.dart';
import '/pages/produto/produto_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductEditModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  Completer<ApiCallResponse>? apiRequestCompleter;
  bool isMediaUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Backend Call - API (Image Delete)] action in IconButton widget.
  ApiCallResponse? apiResultmkj;
  bool isMediaUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for nomeProd widget.
  TextEditingController? nomeProdController;
  String? Function(BuildContext, String?)? nomeProdControllerValidator;
  String? _nomeProdControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for descProd widget.
  TextEditingController? descProdController;
  String? Function(BuildContext, String?)? descProdControllerValidator;
  String? _descProdControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for quantidade widget.
  TextEditingController? quantidadeController;
  String? Function(BuildContext, String?)? quantidadeControllerValidator;
  String? _quantidadeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for precoProd widget.
  TextEditingController? precoProdController;
  String? Function(BuildContext, String?)? precoProdControllerValidator;
  String? _precoProdControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for marcaProd widget.
  TextEditingController? marcaProdController;
  String? Function(BuildContext, String?)? marcaProdControllerValidator;
  String? _marcaProdControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for categoriaProd widget.
  String? categoriaProdValue;
  FormFieldController<String>? categoriaProdController;
  // State field(s) for corProd widget.
  String? corProdValue;
  FormFieldController<String>? corProdController;
  // State field(s) for tamanhoProd widget.
  String? tamanhoProdValue;
  FormFieldController<String>? tamanhoProdController;
  // Stores action output result for [Backend Call - API (Update)] action in Button widget.
  ApiCallResponse? apiResultProdUpdate;
  // Stores action output result for [Backend Call - API (Produtos By Id)] action in Button widget.
  ApiCallResponse? apiResultUpdatedProd;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nomeProdControllerValidator = _nomeProdControllerValidator;
    descProdControllerValidator = _descProdControllerValidator;
    quantidadeControllerValidator = _quantidadeControllerValidator;
    precoProdControllerValidator = _precoProdControllerValidator;
    marcaProdControllerValidator = _marcaProdControllerValidator;
  }

  void dispose() {
    nomeProdController?.dispose();
    descProdController?.dispose();
    quantidadeController?.dispose();
    precoProdController?.dispose();
    marcaProdController?.dispose();
  }

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
