import '/backend/api_requests/api_calls.dart';
import '/components/mudar_foto/mudar_foto_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductEditModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Image Delete)] action in IconButton widget.
  ApiCallResponse? apiResultmkj;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (Image Delete)] action in IconButton widget.
  ApiCallResponse? apiResultmkj5;
  // Stores action output result for [Backend Call - API (Image Delete)] action in IconButton widget.
  ApiCallResponse? apiResultmkj4;
  // Stores action output result for [Backend Call - API (Image Delete)] action in IconButton widget.
  ApiCallResponse? apiResultmkj3;
  // Stores action output result for [Backend Call - API (Image Delete)] action in IconButton widget.
  ApiCallResponse? apiResultmkj2;
  // Stores action output result for [Backend Call - API (Image Delete)] action in IconButton widget.
  ApiCallResponse? apiResultmkj1;
  // State field(s) for arrobaloja widget.
  TextEditingController? arrobalojaController;
  String? Function(BuildContext, String?)? arrobalojaControllerValidator;
  // State field(s) for yourName widget.
  TextEditingController? yourNameController1;
  String? Function(BuildContext, String?)? yourNameController1Validator;
  // State field(s) for yourName widget.
  TextEditingController? yourNameController2;
  String? Function(BuildContext, String?)? yourNameController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownController;
  // State field(s) for myBio widget.
  TextEditingController? myBioController;
  String? Function(BuildContext, String?)? myBioControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    arrobalojaController?.dispose();
    yourNameController1?.dispose();
    yourNameController2?.dispose();
    myBioController?.dispose();
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
