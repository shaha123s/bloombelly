import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'choseservices_widget.dart' show ChoseservicesWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChoseservicesModel extends FlutterFlowModel<ChoseservicesWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
