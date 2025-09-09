import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'symptoms_model.dart';
export 'symptoms_model.dart';

class SymptomsWidget extends StatefulWidget {
  const SymptomsWidget({
    super.key,
    required this.symp,
  });

  final VaccineRow? symp;

  static String routeName = 'symptoms';
  static String routePath = '/symptoms';

  @override
  State<SymptomsWidget> createState() => _SymptomsWidgetState();
}

class _SymptomsWidgetState extends State<SymptomsWidget> {
  late SymptomsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SymptomsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/photo_2025-05-01_11-13-50.jpg',
                ).image,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0x41B9D8CE),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 5.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 10.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'l3xgkuf4' /* تتبع الأعراض */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'gulzar',
                                      color: Color(0xEE637D87),
                                      fontSize: 25.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Retroviruses-bro_(2).png',
                        width: 216.6,
                        height: 137.78,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'r6hcfh7a' /* أعراض ما بعد التطعيم */,
                        ),
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Amiri',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Container(
                      width: 367.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Color(0x30795993),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 20.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget!.symp?.sideEffect,
                              'side',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Amiri',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '37ocyfkc' /* الإجرائات الوقائية */,
                        ),
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Amiri',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Container(
                      width: 367.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Color(0x30795993),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget!.symp?.preventiveMeasures,
                            'prev',
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Amiri',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
