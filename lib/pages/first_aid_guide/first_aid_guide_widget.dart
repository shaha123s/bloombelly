import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'first_aid_guide_model.dart';
export 'first_aid_guide_model.dart';

/// Create the Page & AppBar
/// Add a new page and set its background to your pink‐watercolor image.
///
/// Drag in an AppBar at the top.
/// In the AppBar properties, enable the Back Button.
/// Set the Title to “First Aid Guide” and choose your dark sans-serif font.
/// Center the Band-Aid Icon
/// Below the AppBar, drop in an Image (or Icon) widget and upload your
/// crossed band-aids graphic.
/// Center it horizontally and give it some top margin so it sits comfortably
/// below the status bar.
/// Add a Scrollable List
/// Under the icon, insert a ListView (or a Column inside a
/// SingleChildScrollView).
/// This makes the list of topics scrollable.
/// Design One Topic Row
/// Inside your ListView’s Item Builder, add a Container.
/// Set its Width to fill parent, Height to a fixed value (e.g. 60-70px), and
/// Corner Radius to about 16 for a pill shape.
/// Give it a very light pastel fill (almost-white).
/// Add Vertical Margin (~8px) so rows stack with space between them.
/// Inside that Container, place a Row with three children:
/// Icon Placeholder: a small square Container (30×30px) on the left, tinted a
/// muted pastel.
/// Topic Text: a Text widget in the middle reading “pregnancy contractions”
/// (bind this dynamically if you like).
/// Step Badge: a small Container on the right with pink background, rounded
/// corners, containing the step number in white text.
/// Populate All Steps
/// In your ListView settings, set the Item Count to however many first-aid
/// steps you have (e.g. 7).
/// Bind each row’s text and badge number to the item index or to a list from
/// your Firestore/Local List.
/// Tidy Up & Interactions
/// Ensure the entire ListView has left/right padding so rows don’t touch the
/// screen edge.
/// Optionally add a Tap Action on each Container to navigate to a detail page
/// for that topic.
/// Preview on a device to check spacing—adjust container height, padding, and
/// margins until it feels roomy.
class FirstAidGuideWidget extends StatefulWidget {
  const FirstAidGuideWidget({
    super.key,
    required this.titlee,
  });

  final String? titlee;

  static String routeName = 'FirstAidGuide';
  static String routePath = '/firstAidGuide';

  @override
  State<FirstAidGuideWidget> createState() => _FirstAidGuideWidgetState();
}

class _FirstAidGuideWidgetState extends State<FirstAidGuideWidget> {
  late FirstAidGuideModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FirstAidGuideModel());
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: true,
          title: Text(
            'First Aid Guide',
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
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/photo_2025-05-01_11-13-50.jpg',
                ).image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/3363193_1.png',
                      width: MediaQuery.sizeOf(context).width * 0.344,
                      height: MediaQuery.sizeOf(context).height * 0.16,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                    child: FutureBuilder<List<CareGuidesRow>>(
                      future: CareGuidesTable().queryRows(
                        queryFn: (q) => q,
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
                        List<CareGuidesRow> listViewCareGuidesRowList =
                            snapshot.data!;

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewCareGuidesRowList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 10.0),
                          itemBuilder: (context, listViewIndex) {
                            final listViewCareGuidesRow =
                                listViewCareGuidesRowList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.1,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE6E9ED),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDFDBDB),
                                          ),
                                          child: Icon(
                                            Icons.bloodtype_sharp,
                                            color: Color(0xFFDF0E11),
                                            size: 24.0,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Text(
                                                listViewCareGuidesRow.title,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
