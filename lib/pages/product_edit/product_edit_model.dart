import '/backend/api_requests/api_calls.dart';
import '/components/mudar_foto/mudar_foto_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/profile/profile_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductEditModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for arrobaloja widget.
  TextEditingController? arrobalojaController;
  String? Function(BuildContext, String?)? arrobalojaControllerValidator;
  // State field(s) for yourName widget.
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for whatsapp widget.
  TextEditingController? whatsappController;
  String? Function(BuildContext, String?)? whatsappControllerValidator;
  // State field(s) for myBio widget.
  TextEditingController? myBioController;
  String? Function(BuildContext, String?)? myBioControllerValidator;
  // Stores action output result for [Backend Call - API (User Update)] action in Button widget.
  ApiCallResponse? apiResult3uo;
  // Stores action output result for [Backend Call - API (Users By Id)] action in Button widget.
  ApiCallResponse? updatedUser;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    arrobalojaController?.dispose();
    yourNameController?.dispose();
    emailAddressController?.dispose();
    whatsappController?.dispose();
    myBioController?.dispose();
  }

  /// Additional helper methods are added here.

}
