import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'children1_widget.dart' show Children1Widget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Children1Model extends FlutterFlowModel<Children1Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightTextController;
  String? Function(BuildContext, String?)? heightTextControllerValidator;
  // State field(s) for wieght widget.
  FocusNode? wieghtFocusNode;
  TextEditingController? wieghtTextController;
  String? Function(BuildContext, String?)? wieghtTextControllerValidator;
  // State field(s) for qua widget.
  String? quaValue;
  FormFieldController<String>? quaValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    heightFocusNode?.dispose();
    heightTextController?.dispose();

    wieghtFocusNode?.dispose();
    wieghtTextController?.dispose();
  }
}
