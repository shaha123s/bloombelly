import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _week = prefs.getInt('ff_week') ?? _week;
    });
    _safeInit(() {
      _role = prefs.getString('ff_role') ?? _role;
    });
    _safeInit(() {
      _charti = prefs
              .getStringList('ff_charti')
              ?.map((x) {
                try {
                  return ChartStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _charti;
    });
    _safeInit(() {
      _gender = prefs.getString('ff_gender') ?? _gender;
    });
    _safeInit(() {
      _dateOfBirth = prefs.containsKey('ff_dateOfBirth')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_dateOfBirth')!)
          : _dateOfBirth;
    });
    _safeInit(() {
      _chatt = prefs
              .getStringList('ff_chatt')
              ?.map((x) {
                try {
                  return ChatStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _chatt;
    });
    _safeInit(() {
      _weeks = prefs.getInt('ff_weeks') ?? _weeks;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _week = 5;
  int get week => _week;
  set week(int value) {
    _week = value;
    prefs.setInt('ff_week', value);
  }

  String _role = 'null';
  String get role => _role;
  set role(String value) {
    _role = value;
    prefs.setString('ff_role', value);
  }

  List<ChartStruct> _charti = [
    ChartStruct.fromSerializableMap(jsonDecode(
        '{\"age\":\"0\",\"boyTall\":\"50\",\"boyWie\":\"3\",\"girlTall\":\"48\",\"girlWieght\":\"3\"}')),
    ChartStruct.fromSerializableMap(jsonDecode(
        '{\"age\":\"1\",\"boyTall\":\"75\",\"boyWie\":\"10\",\"girlTall\":\"74\",\"girlWieght\":\"9\"}')),
    ChartStruct.fromSerializableMap(jsonDecode(
        '{\"age\":\"2\",\"boyTall\":\"86\",\"boyWie\":\"12\",\"girlTall\":\"85\",\"girlWieght\":\"12\"}')),
    ChartStruct.fromSerializableMap(jsonDecode(
        '{\"age\":\"3\",\"boyTall\":\"95\",\"boyWie\":\"15\",\"girlTall\":\"94\",\"girlWieght\":\"14\"}')),
    ChartStruct.fromSerializableMap(jsonDecode(
        '{\"age\":\"4\",\"boyTall\":\"102\",\"boyWie\":\"17\",\"girlTall\":\"100\",\"girlWieght\":\"15\"}')),
    ChartStruct.fromSerializableMap(jsonDecode(
        '{\"age\":\"5\",\"boyTall\":\"109\",\"boyWie\":\"19\",\"girlTall\":\"108\",\"girlWieght\":\"18\"}')),
    ChartStruct.fromSerializableMap(jsonDecode(
        '{\"age\":\"6\",\"boyTall\":\"115\",\"boyWie\":\"21\",\"girlTall\":\"114\",\"girlWieght\":\"20\"}')),
    ChartStruct.fromSerializableMap(jsonDecode(
        '{\"age\":\"7\",\"boyTall\":\"122\",\"boyWie\":\"23\",\"girlTall\":\"121\",\"girlWieght\":\"22\"}')),
    ChartStruct.fromSerializableMap(jsonDecode(
        '{\"age\":\"8\",\"boyTall\":\"128\",\"boyWie\":\"25\",\"girlTall\":\"127\",\"girlWieght\":\"25\"}')),
    ChartStruct.fromSerializableMap(jsonDecode(
        '{\"age\":\"9\",\"boyTall\":\"133\",\"boyWie\":\"28\",\"girlTall\":\"133\",\"girlWieght\":\"28\"}')),
    ChartStruct.fromSerializableMap(jsonDecode(
        '{\"age\":\"10\",\"boyTall\":\"138\",\"boyWie\":\"31\",\"girlTall\":\"138\",\"girlWieght\":\"31\"}'))
  ];
  List<ChartStruct> get charti => _charti;
  set charti(List<ChartStruct> value) {
    _charti = value;
    prefs.setStringList('ff_charti', value.map((x) => x.serialize()).toList());
  }

  void addToCharti(ChartStruct value) {
    charti.add(value);
    prefs.setStringList(
        'ff_charti', _charti.map((x) => x.serialize()).toList());
  }

  void removeFromCharti(ChartStruct value) {
    charti.remove(value);
    prefs.setStringList(
        'ff_charti', _charti.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCharti(int index) {
    charti.removeAt(index);
    prefs.setStringList(
        'ff_charti', _charti.map((x) => x.serialize()).toList());
  }

  void updateChartiAtIndex(
    int index,
    ChartStruct Function(ChartStruct) updateFn,
  ) {
    charti[index] = updateFn(_charti[index]);
    prefs.setStringList(
        'ff_charti', _charti.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCharti(int index, ChartStruct value) {
    charti.insert(index, value);
    prefs.setStringList(
        'ff_charti', _charti.map((x) => x.serialize()).toList());
  }

  List<VacineStruct> _Vcine = [];
  List<VacineStruct> get Vcine => _Vcine;
  set Vcine(List<VacineStruct> value) {
    _Vcine = value;
  }

  void addToVcine(VacineStruct value) {
    Vcine.add(value);
  }

  void removeFromVcine(VacineStruct value) {
    Vcine.remove(value);
  }

  void removeAtIndexFromVcine(int index) {
    Vcine.removeAt(index);
  }

  void updateVcineAtIndex(
    int index,
    VacineStruct Function(VacineStruct) updateFn,
  ) {
    Vcine[index] = updateFn(_Vcine[index]);
  }

  void insertAtIndexInVcine(int index, VacineStruct value) {
    Vcine.insert(index, value);
  }

  String _langua = 'eng';
  String get langua => _langua;
  set langua(String value) {
    _langua = value;
  }

  String _gender = '';
  String get gender => _gender;
  set gender(String value) {
    _gender = value;
    prefs.setString('ff_gender', value);
  }

  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  set dateOfBirth(DateTime? value) {
    _dateOfBirth = value;
    value != null
        ? prefs.setInt('ff_dateOfBirth', value.millisecondsSinceEpoch)
        : prefs.remove('ff_dateOfBirth');
  }

  List<ChatStruct> _chatt = [
    ChatStruct.fromSerializableMap(
        jsonDecode('{\"ques\":\"Hi Ai\",\"responde\":\"Hi human\"}'))
  ];
  List<ChatStruct> get chatt => _chatt;
  set chatt(List<ChatStruct> value) {
    _chatt = value;
    prefs.setStringList('ff_chatt', value.map((x) => x.serialize()).toList());
  }

  void addToChatt(ChatStruct value) {
    chatt.add(value);
    prefs.setStringList('ff_chatt', _chatt.map((x) => x.serialize()).toList());
  }

  void removeFromChatt(ChatStruct value) {
    chatt.remove(value);
    prefs.setStringList('ff_chatt', _chatt.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromChatt(int index) {
    chatt.removeAt(index);
    prefs.setStringList('ff_chatt', _chatt.map((x) => x.serialize()).toList());
  }

  void updateChattAtIndex(
    int index,
    ChatStruct Function(ChatStruct) updateFn,
  ) {
    chatt[index] = updateFn(_chatt[index]);
    prefs.setStringList('ff_chatt', _chatt.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInChatt(int index, ChatStruct value) {
    chatt.insert(index, value);
    prefs.setStringList('ff_chatt', _chatt.map((x) => x.serialize()).toList());
  }

  int _weeks = 2;
  int get weeks => _weeks;
  set weeks(int value) {
    _weeks = value;
    prefs.setInt('ff_weeks', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
