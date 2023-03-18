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

class ProfileEditModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for arrobaloja widget.
  TextEditingController? arrobalojaController;
  String? Function(BuildContext, String?)? arrobalojaControllerValidator;
  String? _arrobalojaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 5) {
      return 'Mínimo de  caracteres';
    }
    if (val.length > 20) {
      return 'Máximo de 20 caracteres';
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Nome de loja inválido';
    }
    return null;
  }

  // State field(s) for yourName widget.
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  String? _yourNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 4) {
      return 'O nome deve ter pelo menos 4 letras.';
    }
    if (val.length > 50) {
      return 'Número máximo de caracteres permitidos: 50';
    }

    return null;
  }

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  String? _emailAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email inválido';
    }
    return null;
  }

  // State field(s) for whatsapp widget.
  TextEditingController? whatsappController;
  String? Function(BuildContext, String?)? whatsappControllerValidator;
  String? _whatsappControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^\\d{11}\$').hasMatch(val)) {
      return 'Número de telefone inválido';
    }
    return null;
  }

  // State field(s) for myBio widget.
  TextEditingController? myBioController;
  String? Function(BuildContext, String?)? myBioControllerValidator;
  String? _myBioControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (User Update)] action in Button widget.
  ApiCallResponse? apiResult3uo;
  // Stores action output result for [Backend Call - API (Users By Id)] action in Button widget.
  ApiCallResponse? updatedUser;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    arrobalojaControllerValidator = _arrobalojaControllerValidator;
    yourNameControllerValidator = _yourNameControllerValidator;
    emailAddressControllerValidator = _emailAddressControllerValidator;
    whatsappControllerValidator = _whatsappControllerValidator;
    myBioControllerValidator = _myBioControllerValidator;
  }

  void dispose() {
    arrobalojaController?.dispose();
    yourNameController?.dispose();
    emailAddressController?.dispose();
    whatsappController?.dispose();
    myBioController?.dispose();
  }

  /// Additional helper methods are added here.

}
