import '../database.dart';

class UserAppointmentsTable extends SupabaseTable<UserAppointmentsRow> {
  @override
  String get tableName => 'user_appointments';

  @override
  UserAppointmentsRow createRow(Map<String, dynamic> data) =>
      UserAppointmentsRow(data);
}

class UserAppointmentsRow extends SupabaseDataRow {
  UserAppointmentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserAppointmentsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  bool? get isDone => getField<bool>('is_done');
  set isDone(bool? value) => setField<bool>('is_done', value);

  int? get weekNo => getField<int>('week_no');
  set weekNo(int? value) => setField<int>('week_no', value);
}
