import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'trac_kicksintro_widget.dart' show TracKicksintroWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TracKicksintroModel extends FlutterFlowModel<TracKicksintroWidget> {
  ///  Local state fields for this page.

  int kickCount = 0;

  int? totalkick = 0;

  DateTime? todaystart;

  DateTime? tomorrowStart;

  /// to hide the report of kicks
  bool pressed = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getStartOfDay] action in TracKicksintro widget.
  DateTime? startday;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
