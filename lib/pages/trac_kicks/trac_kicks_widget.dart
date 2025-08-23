import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'trac_kicks_model.dart';
export 'trac_kicks_model.dart';

/// Full‑screen watercolor background
/// The same soft purple‑blue wash fills the canvas, keeping the look calm and
/// consistent.
///
/// Header bar
///
/// A back‑arrow icon in the top‑left lets the user go back.
///
/// Centered title reads “Track Baby’s Kicks” in a clean, dark sans‑serif
/// font.
///
/// Central icon
///
/// Below the header, a simple line‑art heart made of tiny baby footprints
/// sits centered.
///
/// “Add Kicks” control
///
/// A small label “Add Kicks” in purple appears beneath the icon.
///
/// Under that, a wide, rounded‑corner box tinted light pastel holds two
/// tappable “+” and “–” buttons on either side of a number (e.g. “15”).
///
/// This lets the user increment or decrement the count before saving.
///
/// Today’s total
///
/// Further down, the large number “12” in bold purple shows today’s kick
/// tally.
///
/// Directly below it, a subtext “Today’s Kicks” in medium weight.
///
/// History list
///
/// A simple vertical list of the past few days, each line showing a date
/// (e.g. “Apr. 28, 2025”) on the left and the kicks count (e.g. “8”) on the
/// right.
///
/// Use a regular font, aligned so dates and numbers sit at opposite ends.
///
/// Guidance note
///
/// At the very bottom, a two‑line advisory in small, muted text:
///
/// “The average kicks per day is between 10–15.”
///
/// “If you notice a significant decrease, consult your doctor.”
///
/// Layout & spacing
///
/// All elements are stacked vertically with ample space—nothing feels
/// cramped.
///
/// The Add Kicks box and Today’s total sit in the screen’s center region.
///
/// History and guidance text flow beneath, all inside a scrollable area if
/// needed.
class TracKicksWidget extends StatefulWidget {
  const TracKicksWidget({super.key});

  static String routeName = 'TracKicks';
  static String routePath = '/tracKicks';

  @override
  State<TracKicksWidget> createState() => _TracKicksWidgetState();
}

class _TracKicksWidgetState extends State<TracKicksWidget> {
  late TracKicksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TracKicksModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.startday = await actions.getStartOfDay(
        getCurrentTimestamp,
      );
      _model.todaystart = _model.startday;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<FetalMovesRow>>(
      future: FetalMovesTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'id',
              currentUserUid,
            )
            .eqOrNull(
              'created_at',
              supaSerialize<DateTime>(_model.todaystart),
            )
            .order('created_at'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<FetalMovesRow> tracKicksFetalMovesRowList = snapshot.data!;

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
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/photo_2025-05-01_11-13-50.jpg',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                  child: FutureBuilder<List<FetalMovesRow>>(
                    future: FetalMovesTable().querySingleRow(
                      queryFn: (q) => q
                          .eqOrNull(
                            'id',
                            currentUserUid,
                          )
                          .eqOrNull(
                            'created_at',
                            supaSerialize<DateTime>(_model.todaystart),
                          )
                          .order('created_at'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitRipple(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<FetalMovesRow> columnFetalMovesRowList =
                          snapshot.data!;

                      final columnFetalMovesRow =
                          columnFetalMovesRowList.isNotEmpty
                              ? columnFetalMovesRowList.first
                              : null;

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context.safePop();
                                  },
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'utn6s3mm' /* Track Baby's Kicks */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'play',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                Container(
                                  width: 40.0,
                                ),
                              ],
                            ),
                            Text(
                              valueOrDefault<String>(
                                _model.kickCount.toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'iaspws8n' /* ركلات اليوم */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.6,
                              height: MediaQuery.sizeOf(context).height * 0.08,
                              decoration: BoxDecoration(
                                color: Color(0x20A095E3),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 24.0,
                                      buttonSize: 48.0,
                                      fillColor: Color(0xAC7B6BCE),
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.kickCount =
                                            _model.kickCount + -1;
                                        safeSetState(() {});
                                      },
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Color(0x6D7B6BCE),
                                      size: 35.0,
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 24.0,
                                      buttonSize: 48.0,
                                      fillColor: Color(0xAC7B6BCE),
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.kickCount = _model.kickCount + 1;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ].divide(SizedBox(width: 30.0)),
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                await FetalMovesTable().insert({
                                  'kick_count': _model.kickCount,
                                  'created_at': supaSerialize<DateTime>(
                                      getCurrentTimestamp),
                                  'record_date': supaSerialize<DateTime>(
                                      getCurrentTimestamp),
                                  'id': currentUserUid,
                                  'time': supaSerialize<PostgresTime>(
                                      PostgresTime(getCurrentTimestamp)),
                                });
                                _model.kickCount = 0;
                                safeSetState(() {});
                                safeSetState(
                                    () => _model.requestCompleter = null);
                                await _model.waitForRequestCompleted(
                                    maxWait: 1);
                              },
                              text: FFLocalizations.of(context).getText(
                                'qzhxg7ta' /* حفظ الركلات */,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.6,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Mirza',
                                      color: Color(0xFF7B6BCE),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                _model.pressed = true;
                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '226yywu1' /* احسب جودة الركلات */,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.6,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Mirza',
                                      color: Color(0xFF7B6BCE),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: Color(0x20000000),
                              ),
                            ),
                            FutureBuilder<List<FetalMovesRow>>(
                              future: (_model.requestCompleter ??=
                                      Completer<List<FetalMovesRow>>()
                                        ..complete(FetalMovesTable().queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'id',
                                                currentUserUid,
                                              )
                                              .eqOrNull(
                                                'created_at',
                                                supaSerialize<DateTime>(
                                                    _model.todaystart),
                                              )
                                              .order('created_at'),
                                        )))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<FetalMovesRow> listViewFetalMovesRowList =
                                    snapshot.data!;

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewFetalMovesRowList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewFetalMovesRow =
                                        listViewFetalMovesRowList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            dateTimeFormat(
                                              "d/M h:mm a",
                                              listViewFetalMovesRow.time!.time,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            listViewFetalMovesRow.kickCount
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: MediaQuery.sizeOf(context).height * 0.1,
                                decoration: BoxDecoration(
                                  color: Color(0x15000000),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Visibility(
                                  visible: _model.pressed,
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        functions.fetalKickStatus(
                                            FFAppState().week,
                                            _model.kickCount,
                                            'day'),
                                        'press to cal',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 24.0)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
