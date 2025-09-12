import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
<<<<<<< HEAD
<<<<<<< HEAD
=======
import '/flutter_flow/flutter_flow_icon_button.dart';
>>>>>>> 3ac7f09744bdf29c8737727cc4f8d276147c8253
=======
import '/flutter_flow/flutter_flow_icon_button.dart';
>>>>>>> 3ac7f09744bdf29c8737727cc4f8d276147c8253
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'to_do1_copy_widget.dart' show ToDo1CopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ToDo1CopyModel extends FlutterFlowModel<ToDo1CopyWidget> {
  ///  Local state fields for this page.

<<<<<<< HEAD
<<<<<<< HEAD
  int? week;
=======
  int? selectedWeek;
>>>>>>> 3ac7f09744bdf29c8737727cc4f8d276147c8253
=======
  int? selectedWeek;
>>>>>>> 3ac7f09744bdf29c8737727cc4f8d276147c8253

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
<<<<<<< HEAD
<<<<<<< HEAD
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Checkbox widget.
  Map<UserAppointmentsRow, bool> checkboxValueMap = {};
  List<UserAppointmentsRow> get checkboxCheckedItems =>
=======
  // State field(s) for Checkbox widget.
  Map<UserTasksRow, bool> checkboxValueMap = {};
  List<UserTasksRow> get checkboxCheckedItems =>
>>>>>>> 3ac7f09744bdf29c8737727cc4f8d276147c8253
=======
  // State field(s) for Checkbox widget.
  Map<UserTasksRow, bool> checkboxValueMap = {};
  List<UserTasksRow> get checkboxCheckedItems =>
>>>>>>> 3ac7f09744bdf29c8737727cc4f8d276147c8253
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
<<<<<<< HEAD
<<<<<<< HEAD
    textFieldFocusNode?.dispose();
    textController?.dispose();
=======
>>>>>>> 3ac7f09744bdf29c8737727cc4f8d276147c8253
=======
>>>>>>> 3ac7f09744bdf29c8737727cc4f8d276147c8253
  }
}
