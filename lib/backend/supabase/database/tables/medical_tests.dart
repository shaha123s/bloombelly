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

  String get pregnancyId => getField<String>('pregnancy_id')!;
  set pregnancyId(String value) => setField<String>('pregnancy_id', value);

  String get testType => getField<String>('test_type')!;
  set testType(String value) => setField<String>('test_type', value);

  DateTime get testDate => getField<DateTime>('test_date')!;
  set testDate(DateTime value) => setField<DateTime>('test_date', value);

  dynamic? get botResult => getField<dynamic>('bot_result');
  set botResult(dynamic? value) => setField<dynamic>('bot_result', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
