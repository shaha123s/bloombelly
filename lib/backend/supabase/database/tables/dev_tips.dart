import '../database.dart';

class DevTipsTable extends SupabaseTable<DevTipsRow> {
  @override
  String get tableName => 'dev_tips';

  @override
  DevTipsRow createRow(Map<String, dynamic> data) => DevTipsRow(data);
}

class DevTipsRow extends SupabaseDataRow {
  DevTipsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DevTipsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get ageGroup => getField<String>('age_group')!;
  set ageGroup(String value) => setField<String>('age_group', value);

  String get info => getField<String>('info')!;
  set info(String value) => setField<String>('info', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
