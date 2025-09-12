import '../database.dart';

class VTransactionWithUserTable extends SupabaseTable<VTransactionWithUserRow> {
  @override
  String get tableName => 'v_transaction_with_user';

  @override
  VTransactionWithUserRow createRow(Map<String, dynamic> data) =>
      VTransactionWithUserRow(data);
}

class VTransactionWithUserRow extends SupabaseDataRow {
  VTransactionWithUserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VTransactionWithUserTable();

  String? get transid => getField<String>('transid');
  set transid(String? value) => setField<String>('transid', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get amount => getField<int>('amount');
  set amount(int? value) => setField<int>('amount', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);
}
