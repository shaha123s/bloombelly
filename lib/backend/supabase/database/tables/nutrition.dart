import '../database.dart';

class NutritionTable extends SupabaseTable<NutritionRow> {
  @override
  String get tableName => 'nutrition';

  @override
  NutritionRow createRow(Map<String, dynamic> data) => NutritionRow(data);
}

class NutritionRow extends SupabaseDataRow {
  NutritionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NutritionTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime get recordDate => getField<DateTime>('record_date')!;
  set recordDate(DateTime value) => setField<DateTime>('record_date', value);

  double? get calories => getField<double>('calories');
  set calories(double? value) => setField<double>('calories', value);

  double? get proteinG => getField<double>('protein_g');
  set proteinG(double? value) => setField<double>('protein_g', value);

  double? get ironMg => getField<double>('iron_mg');
  set ironMg(double? value) => setField<double>('iron_mg', value);

  bool? get approved => getField<bool>('approved');
  set approved(bool? value) => setField<bool>('approved', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
