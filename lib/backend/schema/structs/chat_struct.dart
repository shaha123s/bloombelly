// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatStruct extends BaseStruct {
  ChatStruct({
    String? ques,
    String? responde,
  })  : _ques = ques,
        _responde = responde;

  // "ques" field.
  String? _ques;
  String get ques => _ques ?? '';
  set ques(String? val) => _ques = val;

  bool hasQues() => _ques != null;

  // "responde" field.
  String? _responde;
  String get responde => _responde ?? '';
  set responde(String? val) => _responde = val;

  bool hasResponde() => _responde != null;

  static ChatStruct fromMap(Map<String, dynamic> data) => ChatStruct(
        ques: data['ques'] as String?,
        responde: data['responde'] as String?,
      );

  static ChatStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ques': _ques,
        'responde': _responde,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ques': serializeParam(
          _ques,
          ParamType.String,
        ),
        'responde': serializeParam(
          _responde,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatStruct(
        ques: deserializeParam(
          data['ques'],
          ParamType.String,
          false,
        ),
        responde: deserializeParam(
          data['responde'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatStruct &&
        ques == other.ques &&
        responde == other.responde;
  }

  @override
  int get hashCode => const ListEquality().hash([ques, responde]);
}

ChatStruct createChatStruct({
  String? ques,
  String? responde,
}) =>
    ChatStruct(
      ques: ques,
      responde: responde,
    );
