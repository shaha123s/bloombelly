import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'paid_widget.dart' show PaidWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaidModel extends FlutterFlowModel<PaidWidget> {
  ///  Local state fields for this page.

  double? cost = 0.0;

  List<String> service = [];
  void addToService(String item) => service.add(item);
  void removeFromService(String item) => service.remove(item);
  void removeAtIndexFromService(int index) => service.removeAt(index);
  void insertAtIndexInService(int index, String item) =>
      service.insert(index, item);
  void updateServiceAtIndex(int index, Function(String) updateFn) =>
      service[index] = updateFn(service[index]);

  double? total;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - totalllbalance] action in Button widget.
  double? newbalance;
  Completer<List<WalletsRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
