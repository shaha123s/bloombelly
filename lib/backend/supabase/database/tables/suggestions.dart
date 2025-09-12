import '../database.dart';

class SuggestionsTable extends SupabaseTable<SuggestionsRow> {
  @override
  String get tableName => 'suggestions';

  @override
  SuggestionsRow createRow(Map<String, dynamic> data) => SuggestionsRow(data);
}

class SuggestionsRow extends SupabaseDataRow {
  SuggestionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SuggestionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  int? get weekNo => getField<int>('week_no');
  set weekNo(int? value) => setField<int>('week_no', value);
}
