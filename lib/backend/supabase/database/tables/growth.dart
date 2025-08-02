import '../database.dart';

class GrowthTable extends SupabaseTable<GrowthRow> {
  @override
  String get tableName => 'growth';

  @override
  GrowthRow createRow(Map<String, dynamic> data) => GrowthRow(data);
}

class GrowthRow extends SupabaseDataRow {
  GrowthRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GrowthTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get childId => getField<String>('child_id')!;
  set childId(String value) => setField<String>('child_id', value);

  DateTime get recordDate => getField<DateTime>('record_date')!;
  set recordDate(DateTime value) => setField<DateTime>('record_date', value);

  double? get weightKg => getField<double>('weight_kg');
  set weightKg(double? value) => setField<double>('weight_kg', value);

  double? get heightCm => getField<double>('height_cm');
  set heightCm(double? value) => setField<double>('height_cm', value);

  double? get headCircCm => getField<double>('head_circ_cm');
  set headCircCm(double? value) => setField<double>('head_circ_cm', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
