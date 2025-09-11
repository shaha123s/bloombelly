import '../database.dart';

class PregnanciesTable extends SupabaseTable<PregnanciesRow> {
  @override
  String get tableName => 'pregnancies';

  @override
  PregnanciesRow createRow(Map<String, dynamic> data) => PregnanciesRow(data);
}

class PregnanciesRow extends SupabaseDataRow {
  PregnanciesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PregnanciesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get dueDate => getField<String>('due_date');
  set dueDate(String? value) => setField<String>('due_date', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get lastPeriod => getField<String>('last_period');
  set lastPeriod(String? value) => setField<String>('last_period', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get weekno => getField<int>('weekno');
  set weekno(int? value) => setField<int>('weekno', value);
}
