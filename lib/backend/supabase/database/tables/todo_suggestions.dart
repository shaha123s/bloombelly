import '../database.dart';

class TodoSuggestionsTable extends SupabaseTable<TodoSuggestionsRow> {
  @override
  String get tableName => 'todo_suggestions';

  @override
  TodoSuggestionsRow createRow(Map<String, dynamic> data) =>
      TodoSuggestionsRow(data);
}

class TodoSuggestionsRow extends SupabaseDataRow {
  TodoSuggestionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TodoSuggestionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int get weekNo => getField<int>('week_no')!;
  set weekNo(int value) => setField<int>('week_no', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
