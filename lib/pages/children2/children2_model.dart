import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'children2_widget.dart' show Children2Widget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Children2Model extends FlutterFlowModel<Children2Widget> {
  ///  Local state fields for this page.

  String? height;

  String? weight;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightTextController;
  String? Function(BuildContext, String?)? heightTextControllerValidator;
  String? _heightTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v0ioi3jx' /* Field is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'fw0r6h2v' /* القيمة خاطئة */,
      );
    }
    if (val.length > 3) {
      return FFLocalizations.of(context).getText(
        'bc41rib7' /* القيمة خاطئة */,
      );
    }

    return null;
  }

  // State field(s) for wieght widget.
  FocusNode? wieghtFocusNode;
  TextEditingController? wieghtTextController;
  String? Function(BuildContext, String?)? wieghtTextControllerValidator;
  String? _wieghtTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bbnyt90j' /* Field is required */,
      );
    }

    if (val.length < 1) {
      return FFLocalizations.of(context).getText(
        'fn3f8i37' /* القيمة خاطئة */,
      );
    }
    if (val.length > 3) {
      return FFLocalizations.of(context).getText(
        'gz8y23t9' /* القيمة خاطئة */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    heightTextControllerValidator = _heightTextControllerValidator;
    wieghtTextControllerValidator = _wieghtTextControllerValidator;
  }

  @override
  void dispose() {
    heightFocusNode?.dispose();
    heightTextController?.dispose();

    wieghtFocusNode?.dispose();
    wieghtTextController?.dispose();
  }
}
