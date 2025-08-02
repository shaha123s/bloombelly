import '../database.dart';

class SleepFeedTable extends SupabaseTable<SleepFeedRow> {
  @override
  String get tableName => 'sleep_feed';

  @override
  SleepFeedRow createRow(Map<String, dynamic> data) => SleepFeedRow(data);
}

class SleepFeedRow extends SupabaseDataRow {
  SleepFeedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SleepFeedTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get childId => getField<String>('child_id')!;
  set childId(String value) => setField<String>('child_id', value);

  DateTime get recordDate => getField<DateTime>('record_date')!;
  set recordDate(DateTime value) => setField<DateTime>('record_date', value);

  PostgresTime? get sleepStart => getField<PostgresTime>('sleep_start');
  set sleepStart(PostgresTime? value) =>
      setField<PostgresTime>('sleep_start', value);

  PostgresTime? get sleepEnd => getField<PostgresTime>('sleep_end');
  set sleepEnd(PostgresTime? value) =>
      setField<PostgresTime>('sleep_end', value);

  String? get feedType => getField<String>('feed_type');
  set feedType(String? value) => setField<String>('feed_type', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
