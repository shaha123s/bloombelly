import '../database.dart';

class FetalMovesTable extends SupabaseTable<FetalMovesRow> {
  @override
  String get tableName => 'fetal_moves';

  @override
  FetalMovesRow createRow(Map<String, dynamic> data) => FetalMovesRow(data);
}

class FetalMovesRow extends SupabaseDataRow {
  FetalMovesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FetalMovesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get recordDate => getField<DateTime>('record_date')!;
  set recordDate(DateTime value) => setField<DateTime>('record_date', value);

  int get kickCount => getField<int>('kick_count')!;
  set kickCount(int value) => setField<int>('kick_count', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get num => getField<int>('num')!;
  set num(int value) => setField<int>('num', value);

  PostgresTime? get time => getField<PostgresTime>('time');
  set time(PostgresTime? value) => setField<PostgresTime>('time', value);
}
