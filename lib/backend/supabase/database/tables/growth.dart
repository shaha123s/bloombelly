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

  String get motherId => getField<String>('mother_id')!;
  set motherId(String value) => setField<String>('mother_id', value);

  double? get weightKg => getField<double>('weight_kg');
  set weightKg(double? value) => setField<double>('weight_kg', value);

  double? get heightCm => getField<double>('height_cm');
  set heightCm(double? value) => setField<double>('height_cm', value);

  double? get headCircCm => getField<double>('head_circ_cm');
  set headCircCm(double? value) => setField<double>('head_circ_cm', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get wNote => getField<String>('w_note');
  set wNote(String? value) => setField<String>('w_note', value);

  String? get hNote => getField<String>('h_note');
  set hNote(String? value) => setField<String>('h_note', value);

  String? get headNote => getField<String>('head_note');
  set headNote(String? value) => setField<String>('head_note', value);
}
