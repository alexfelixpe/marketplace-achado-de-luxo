import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailLogin widget.
  TextEditingController? emailLoginController;
  String? Function(BuildContext, String?)? emailLoginControllerValidator;
  // State field(s) for passwordLobin widget.
  TextEditingController? passwordLobinController;
  late bool passwordLobinVisibility;
  String? Function(BuildContext, String?)? passwordLobinControllerValidator;
  // Stores action output result for [Backend Call - API (Auth)] action in Button-Login widget.
  ApiCallResponse? logado;
  // State field(s) for NomeSignup widget.
  TextEditingController? nomeSignupController;
  String? Function(BuildContext, String?)? nomeSignupControllerValidator;
  // State field(s) for emaWhatSappSignUp widget.
  TextEditingController? emaWhatSappSignUpController;
  String? Function(BuildContext, String?)? emaWhatSappSignUpControllerValidator;
  // State field(s) for passwordSignUp widget.
  TextEditingController? passwordSignUpController;
  late bool passwordSignUpVisibility;
  String? Function(BuildContext, String?)? passwordSignUpControllerValidator;
  // State field(s) for ppasswordSignUp2 widget.
  TextEditingController? ppasswordSignUp2Controller;
  late bool ppasswordSignUp2Visibility;
  String? Function(BuildContext, String?)? ppasswordSignUp2ControllerValidator;
  // Stores action output result for [Backend Call - API (SignUp)] action in Button-Login widget.
  ApiCallResponse? signedup;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordLobinVisibility = false;
    passwordSignUpVisibility = false;
    ppasswordSignUp2Visibility = false;
  }

  void dispose() {
    emailLoginController?.dispose();
    passwordLobinController?.dispose();
    nomeSignupController?.dispose();
    emaWhatSappSignUpController?.dispose();
    passwordSignUpController?.dispose();
    ppasswordSignUp2Controller?.dispose();
  }

  /// Additional helper methods are added here.

}
