import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/genero/genero_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/pages/produto/produto_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ImagensModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  bool isMediaUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Backend Call - API (ImageUpload)] action in IconButton widget.
  ApiCallResponse? apiImageUploadResult2;
  bool isMediaUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - API (ImageUpload)] action in IconButton widget.
  ApiCallResponse? apiImageUploadResult3;
  bool isMediaUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Stores action output result for [Backend Call - API (ImageUpload)] action in IconButton widget.
  ApiCallResponse? apiImageUploadResult4;
  bool isMediaUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // Stores action output result for [Backend Call - API (ImageUpload)] action in IconButton widget.
  ApiCallResponse? apiImageUploadResult5;
  // Stores action output result for [Backend Call - API (CriarProduto)] action in Button widget.
  ApiCallResponse? produtoCadastrado;
  // Stores action output result for [Backend Call - API (Produtos By Id)] action in Button widget.
  ApiCallResponse? produto;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
