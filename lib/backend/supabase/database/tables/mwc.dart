import '../database.dart';

class MwcTable extends SupabaseTable<MwcRow> {
  @override
  String get tableName => 'mwc';

  @override
  MwcRow createRow(Map<String, dynamic> data) => MwcRow(data);
}

class MwcRow extends SupabaseDataRow {
  MwcRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MwcTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
