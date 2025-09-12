import '../database.dart';

class PregnancyJournalTable extends SupabaseTable<PregnancyJournalRow> {
  @override
  String get tableName => 'Pregnancy Journal';

  @override
  PregnancyJournalRow createRow(Map<String, dynamic> data) =>
      PregnancyJournalRow(data);
}

class PregnancyJournalRow extends SupabaseDataRow {
  PregnancyJournalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PregnancyJournalTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get weekNo => getField<int>('week_no');
  set weekNo(int? value) => setField<int>('week_no', value);

  String? get feeling => getField<String>('feeling');
  set feeling(String? value) => setField<String>('feeling', value);
}
