import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get fullName => getField<String>('full_name')!;
  set fullName(String value) => setField<String>('full_name', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String get passwordHash => getField<String>('password_hash')!;
  set passwordHash(String value) => setField<String>('password_hash', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  int? get pragnceWeek => getField<int>('pragnce_week');
  set pragnceWeek(int? value) => setField<int>('pragnce_week', value);

  String? get phonNumber => getField<String>('phon_number');
  set phonNumber(String? value) => setField<String>('phon_number', value);

  String? get balance => getField<String>('balance');
  set balance(String? value) => setField<String>('balance', value);
}
