import '../database.dart';

class MedicalTestsTable extends SupabaseTable<MedicalTestsRow> {
  @override
  String get tableName => 'medical_tests';

  @override
  MedicalTestsRow createRow(Map<String, dynamic> data) => MedicalTestsRow(data);
}

class MedicalTestsRow extends SupabaseDataRow {
  MedicalTestsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MedicalTestsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get testType => getField<String>('test_type')!;
  set testType(String value) => setField<String>('test_type', value);

  DateTime get testDate => getField<DateTime>('test_date')!;
  set testDate(DateTime value) => setField<DateTime>('test_date', value);

  String? get botResult => getField<String>('bot_result');
  set botResult(String? value) => setField<String>('bot_result', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get media => getField<String>('media');
  set media(String? value) => setField<String>('media', value);
}
