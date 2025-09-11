import '../database.dart';

class UserTasksTable extends SupabaseTable<UserTasksRow> {
  @override
  String get tableName => 'user_tasks';

  @override
  UserTasksRow createRow(Map<String, dynamic> data) => UserTasksRow(data);
}

class UserTasksRow extends SupabaseDataRow {
  UserTasksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTasksTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get weekNo => getField<int>('week_no')!;
  set weekNo(int value) => setField<int>('week_no', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  bool get isDone => getField<bool>('is_done')!;
  set isDone(bool value) => setField<bool>('is_done', value);

  String? get suggestionId => getField<String>('suggestion_id');
  set suggestionId(String? value) => setField<String>('suggestion_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
