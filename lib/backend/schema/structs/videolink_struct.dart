// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideolinkStruct extends BaseStruct {
  VideolinkStruct({
    String? title,
  }) : _title = title;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  static VideolinkStruct fromMap(Map<String, dynamic> data) => VideolinkStruct(
        title: data['title'] as String?,
      );

  static VideolinkStruct? maybeFromMap(dynamic data) => data is Map
      ? VideolinkStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static VideolinkStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideolinkStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VideolinkStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VideolinkStruct && title == other.title;
  }

  @override
  int get hashCode => const ListEquality().hash([title]);
}

VideolinkStruct createVideolinkStruct({
  String? title,
}) =>
    VideolinkStruct(
      title: title,
    );
