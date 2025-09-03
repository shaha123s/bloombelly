import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'paid_model.dart';
export 'paid_model.dart';

class PaidWidget extends StatefulWidget {
  const PaidWidget({
    super.key,
    required this.cost,
    required this.balance,
    required this.list,
  });

  final double? cost;
  final double? balance;
  final List<String>? list;

  static String routeName = 'paid';
  static String routePath = '/paid';

  @override
  State<PaidWidget> createState() => _PaidWidgetState();
}

class _PaidWidgetState extends State<PaidWidget> {
  late PaidModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaidModel());
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
        backgroundColor: Color(0xFFF8F5F0),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: true,
          title: Text(
            FFLocalizations.of(context).getText(
              'p6yvvgd9' /* premium */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'play',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<WalletsRow>>(
            future: (_model.requestCompleter ??= Completer<List<WalletsRow>>()
                  ..complete(WalletsTable().querySingleRow(
                    queryFn: (q) => q.eqOrNull(
                      'user_id',
                      currentUserUid,
                    ),
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
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                );
              }
              List<WalletsRow> containerWalletsRowList = snapshot.data!;

              final containerWalletsRow = containerWalletsRowList.isNotEmpty
                  ? containerWalletsRowList.first
                  : null;

              return Container(
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
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.318,
                            height: MediaQuery.sizeOf(context).height * 0.125,
                            decoration: BoxDecoration(
                              color: Color(0x00EFE8E8),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/Cash_Payment-bro.png',
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            height: MediaQuery.sizeOf(context).height * 0.12,
                            decoration: BoxDecoration(
                              color: Color(0x254C4789),
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: Color(0x4C78607E),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/money.png',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '1lvurtz3' /* رصيدك  */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF333333),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          containerWalletsRow
                                                              ?.balance
                                                              ?.toString(),
                                                          '0',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineSmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8.0,
                                  color: Color(0x1A000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: Color(0x76795993),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Builder(
                                builder: (context) {
                                  final services =
                                      widget!.list!.toList().take(5).toList();

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(services.length,
                                        (servicesIndex) {
                                      final servicesItem =
                                          services[servicesIndex];
                                      return Text(
                                        servicesItem,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF333333),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      );
                                    }).divide(SizedBox(height: 12.0)),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.newbalance = await actions.totalllbalance(
                                containerWalletsRow?.balance,
                                widget!.cost,
                              );
                              if (_model.newbalance! < 0.0) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('تنبيه'),
                                      content: Text(
                                          'الرصيد غير كافي يرجى اعادة الشحن'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('حسنا'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                await WalletTxTable().update(
                                  data: {
                                    'amount': widget!.cost,
                                    'service': widget!.list,
                                    'tx_time': supaSerialize<DateTime>(
                                        getCurrentTimestamp),
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'user_id',
                                    currentUserUid,
                                  ),
                                );
                                await WalletsTable().update(
                                  data: {
                                    'balance': _model.newbalance,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'user_id',
                                    currentUserUid,
                                  ),
                                );
                              }

                              safeSetState(() {});
                              safeSetState(
                                  () => _model.requestCompleter = null);
                              await _model.waitForRequestCompleted();

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'o7s15exf' /*  Use Service */,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.85,
                              height: MediaQuery.sizeOf(context).height * 0.05,
                              padding: EdgeInsets.all(8.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFCABFDF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                              elevation: 4.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 24.0)),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
