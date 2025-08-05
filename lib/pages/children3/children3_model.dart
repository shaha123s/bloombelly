import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'children3_widget.dart' show Children3Widget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Children3Model extends FlutterFlowModel<Children3Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for health widget.
  FocusNode? healthFocusNode;
  TextEditingController? healthTextController;
  String? Function(BuildContext, String?)? healthTextControllerValidator;
  String? _healthTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'الوصف قصير جدا';
    }

    return null;
  }

  // State field(s) for foodallergie widget.
  FocusNode? foodallergieFocusNode;
  TextEditingController? foodallergieTextController;
  String? Function(BuildContext, String?)? foodallergieTextControllerValidator;
  String? _foodallergieTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'الوصف قصيرا جدا';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    healthTextControllerValidator = _healthTextControllerValidator;
    foodallergieTextControllerValidator = _foodallergieTextControllerValidator;
  }

  @override
  void dispose() {
    healthFocusNode?.dispose();
    healthTextController?.dispose();

    foodallergieFocusNode?.dispose();
    foodallergieTextController?.dispose();
  }
}
