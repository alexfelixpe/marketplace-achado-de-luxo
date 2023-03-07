import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for inputMsg widget.
  TextEditingController? inputMsgController;
  String? Function(BuildContext, String?)? inputMsgControllerValidator;
  // Stores action output result for [Backend Call - API (Enviar Chat)] action in IconButton widget.
  ApiCallResponse? apiResult960;
  Completer<ApiCallResponse>? apiRequestCompleter;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputMsgController?.dispose();
  }

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleter({
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
