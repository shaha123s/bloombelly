import '../database.dart';

class PregnancyWightTable extends SupabaseTable<PregnancyWightRow> {
  @override
  String get tableName => 'pregnancy_wight';

  @override
  PregnancyWightRow createRow(Map<String, dynamic> data) =>
      PregnancyWightRow(data);
}

class PregnancyWightRow extends SupabaseDataRow {
  PregnancyWightRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PregnancyWightTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  double? get height => getField<double>('height');
  set height(double? value) => setField<double>('height', value);

  int? get age => getField<int>('age');
  set age(int? value) => setField<int>('age', value);

  double? get prePregnancyWeight => getField<double>('pre_pregnancy_weight');
  set prePregnancyWeight(double? value) =>
      setField<double>('pre_pregnancy_weight', value);

  int? get pregnancyWeek => getField<int>('pregnancy_week');
  set pregnancyWeek(int? value) => setField<int>('pregnancy_week', value);

  double? get currentWeight => getField<double>('current_weight');
  set currentWeight(double? value) => setField<double>('current_weight', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get result => getField<String>('result');
  set result(String? value) => setField<String>('result', value);
}
