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

  DateTime get recordDate => getField<DateTime>('record_date')!;
  set recordDate(DateTime value) => setField<DateTime>('record_date', value);

  DateTime? get sleepStart => getField<DateTime>('sleep_start');
  set sleepStart(DateTime? value) => setField<DateTime>('sleep_start', value);

  DateTime? get sleepEnd => getField<DateTime>('sleep_end');
  set sleepEnd(DateTime? value) => setField<DateTime>('sleep_end', value);

  String? get feedType => getField<String>('feed_type');
  set feedType(String? value) => setField<String>('feed_type', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get motherId => getField<String>('mother_id');
  set motherId(String? value) => setField<String>('mother_id', value);
}
