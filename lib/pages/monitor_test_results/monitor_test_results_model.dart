import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'monitor_test_results_widget.dart' show MonitorTestResultsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MonitorTestResultsModel
    extends FlutterFlowModel<MonitorTestResultsWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataNuu = false;
  FFUploadedFile uploadedLocalFile_uploadDataNuu =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Gemini - Text From Image] action in Button widget.
  String? geminires;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
