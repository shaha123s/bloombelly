import '../database.dart';

class ManagersTable extends SupabaseTable<ManagersRow> {
  @override
  String get tableName => 'managers';

  @override
  ManagersRow createRow(Map<String, dynamic> data) => ManagersRow(data);
}

class ManagersRow extends SupabaseDataRow {
  ManagersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ManagersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get fullName => getField<String>('full_name')!;
  set fullName(String value) => setField<String>('full_name', value);
}
