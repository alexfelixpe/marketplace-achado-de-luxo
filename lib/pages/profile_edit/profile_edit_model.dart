import '/components/mudar_foto/mudar_foto_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileEditModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for yourName widget.
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for myBio widget.
  TextEditingController? myBioController1;
  String? Function(BuildContext, String?)? myBioController1Validator;
  // State field(s) for myBio widget.
  TextEditingController? myBioController2;
  String? Function(BuildContext, String?)? myBioController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    yourNameController?.dispose();
    emailAddressController?.dispose();
    myBioController1?.dispose();
    myBioController2?.dispose();
  }

  /// Additional helper methods are added here.

}
