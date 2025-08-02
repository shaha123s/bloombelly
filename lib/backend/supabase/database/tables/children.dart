import '../database.dart';

class ChildrenTable extends SupabaseTable<ChildrenRow> {
  @override
  String get tableName => 'children';

  @override
  ChildrenRow createRow(Map<String, dynamic> data) => ChildrenRow(data);
}

class ChildrenRow extends SupabaseDataRow {
  ChildrenRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChildrenTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get motherId => getField<String>('mother_id')!;
  set motherId(String value) => setField<String>('mother_id', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  DateTime get birthDate => getField<DateTime>('birth_date')!;
  set birthDate(DateTime value) => setField<DateTime>('birth_date', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
