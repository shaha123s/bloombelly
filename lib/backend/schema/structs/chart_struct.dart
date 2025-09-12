// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChartStruct extends BaseStruct {
  ChartStruct({
    int? age,
    double? boyTall,
    double? boyWie,
    double? girlTall,
    double? girlWieght,
  })  : _age = age,
        _boyTall = boyTall,
        _boyWie = boyWie,
        _girlTall = girlTall,
        _girlWieght = girlWieght;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;

  void incrementAge(int amount) => age = age + amount;

  bool hasAge() => _age != null;

  // "boyTall" field.
  double? _boyTall;
  double get boyTall => _boyTall ?? 0.0;
  set boyTall(double? val) => _boyTall = val;

  void incrementBoyTall(double amount) => boyTall = boyTall + amount;

  bool hasBoyTall() => _boyTall != null;

  // "boyWie" field.
  double? _boyWie;
  double get boyWie => _boyWie ?? 0.0;
  set boyWie(double? val) => _boyWie = val;

  void incrementBoyWie(double amount) => boyWie = boyWie + amount;

  bool hasBoyWie() => _boyWie != null;

  // "girlTall" field.
  double? _girlTall;
  double get girlTall => _girlTall ?? 0.0;
  set girlTall(double? val) => _girlTall = val;

  void incrementGirlTall(double amount) => girlTall = girlTall + amount;

  bool hasGirlTall() => _girlTall != null;

  // "girlWieght" field.
  double? _girlWieght;
  double get girlWieght => _girlWieght ?? 0.0;
  set girlWieght(double? val) => _girlWieght = val;

  void incrementGirlWieght(double amount) => girlWieght = girlWieght + amount;

  bool hasGirlWieght() => _girlWieght != null;

  static ChartStruct fromMap(Map<String, dynamic> data) => ChartStruct(
        age: castToType<int>(data['age']),
        boyTall: castToType<double>(data['boyTall']),
        boyWie: castToType<double>(data['boyWie']),
        girlTall: castToType<double>(data['girlTall']),
        girlWieght: castToType<double>(data['girlWieght']),
      );

  static ChartStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChartStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'age': _age,
        'boyTall': _boyTall,
        'boyWie': _boyWie,
        'girlTall': _girlTall,
        'girlWieght': _girlWieght,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'boyTall': serializeParam(
          _boyTall,
          ParamType.double,
        ),
        'boyWie': serializeParam(
          _boyWie,
          ParamType.double,
        ),
        'girlTall': serializeParam(
          _girlTall,
          ParamType.double,
        ),
        'girlWieght': serializeParam(
          _girlWieght,
          ParamType.double,
        ),
      }.withoutNulls;

  static ChartStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChartStruct(
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        boyTall: deserializeParam(
          data['boyTall'],
          ParamType.double,
          false,
        ),
        boyWie: deserializeParam(
          data['boyWie'],
          ParamType.double,
          false,
        ),
        girlTall: deserializeParam(
          data['girlTall'],
          ParamType.double,
          false,
        ),
        girlWieght: deserializeParam(
          data['girlWieght'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ChartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChartStruct &&
        age == other.age &&
        boyTall == other.boyTall &&
        boyWie == other.boyWie &&
        girlTall == other.girlTall &&
        girlWieght == other.girlWieght;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([age, boyTall, boyWie, girlTall, girlWieght]);
}

ChartStruct createChartStruct({
  int? age,
  double? boyTall,
  double? boyWie,
  double? girlTall,
  double? girlWieght,
}) =>
    ChartStruct(
      age: age,
      boyTall: boyTall,
      boyWie: boyWie,
      girlTall: girlTall,
      girlWieght: girlWieght,
    );
