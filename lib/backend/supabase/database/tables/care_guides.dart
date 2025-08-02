import '../database.dart';

class CareGuidesTable extends SupabaseTable<CareGuidesRow> {
  @override
  String get tableName => 'care_guides';

  @override
  CareGuidesRow createRow(Map<String, dynamic> data) => CareGuidesRow(data);
}

class CareGuidesRow extends SupabaseDataRow {
  CareGuidesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CareGuidesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get timing => getField<String>('timing');
  set timing(String? value) => setField<String>('timing', value);

  String? get warningSigns => getField<String>('warning_signs');
  set warningSigns(String? value) => setField<String>('warning_signs', value);

  String? get firstAid => getField<String>('first_aid');
  set firstAid(String? value) => setField<String>('first_aid', value);
}
