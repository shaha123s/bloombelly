import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dynamic_switch_model.dart';
export 'dynamic_switch_model.dart';

class DynamicSwitchWidget extends StatefulWidget {
  const DynamicSwitchWidget({super.key});

  @override
  State<DynamicSwitchWidget> createState() => _DynamicSwitchWidgetState();
}

class _DynamicSwitchWidgetState extends State<DynamicSwitchWidget> {
  late DynamicSwitchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DynamicSwitchModel());

    _model.switchValue = true;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Switch(
              value: _model.switchValue!,
              onChanged: (newValue) async {
                safeSetState(() => _model.switchValue = newValue!);
              },
              activeColor: FlutterFlowTheme.of(context).primary,
              activeTrackColor: FlutterFlowTheme.of(context).secondaryText,
              inactiveTrackColor: FlutterFlowTheme.of(context).secondaryText,
              inactiveThumbColor: FlutterFlowTheme.of(context).alternate,
            ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
