import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/mudar_foto/mudar_foto_widget.dart';
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
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductEditModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  Completer<ApiCallResponse>? apiRequestCompleter;
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (Image Delete)] action in IconButton widget.
  ApiCallResponse? apiResultmkj;
  // State field(s) for nomeProd widget.
  TextEditingController? nomeProdController;
  String? Function(BuildContext, String?)? nomeProdControllerValidator;
  // State field(s) for descProd widget.
  TextEditingController? descProdController;
  String? Function(BuildContext, String?)? descProdControllerValidator;
  // State field(s) for quantidade widget.
  TextEditingController? quantidadeController;
  String? Function(BuildContext, String?)? quantidadeControllerValidator;
  // State field(s) for precoProd widget.
  TextEditingController? precoProdController;
  String? Function(BuildContext, String?)? precoProdControllerValidator;
  // State field(s) for marcaProd widget.
  TextEditingController? marcaProdController;
  String? Function(BuildContext, String?)? marcaProdControllerValidator;
  // State field(s) for categoriaProd widget.
  String? categoriaProdValue;
  FormFieldController<String>? categoriaProdController;
  // State field(s) for corProd widget.
  TextEditingController? corProdController;
  String? Function(BuildContext, String?)? corProdControllerValidator;
  // State field(s) for tamanhoProd widget.
  String? tamanhoProdValue;
  FormFieldController<String>? tamanhoProdController;
  // Stores action output result for [Backend Call - API (Update)] action in Button widget.
  ApiCallResponse? apiResultProdUpdate;
  // Stores action output result for [Backend Call - API (Produtos By Id)] action in Button widget.
  ApiCallResponse? apiResultUpdatedProd;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nomeProdController?.dispose();
    descProdController?.dispose();
    quantidadeController?.dispose();
    precoProdController?.dispose();
    marcaProdController?.dispose();
    corProdController?.dispose();
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
