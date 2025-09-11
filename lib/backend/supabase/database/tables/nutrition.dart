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

  String? get foodName => getField<String>('food_name');
  set foodName(String? value) => setField<String>('food_name', value);

  double? get fatG => getField<double>('fat_g');
  set fatG(double? value) => setField<double>('fat_g', value);

  double? get sugarG => getField<double>('sugar_g');
  set sugarG(double? value) => setField<double>('sugar_g', value);

  double? get fiberG => getField<double>('fiber_g');
  set fiberG(double? value) => setField<double>('fiber_g', value);

  double? get sodiumMg => getField<double>('sodium_mg');
  set sodiumMg(double? value) => setField<double>('sodium_mg', value);

  double? get folateUg => getField<double>('folate_ug');
  set folateUg(double? value) => setField<double>('folate_ug', value);

  double? get calciumMg => getField<double>('calcium_mg');
  set calciumMg(double? value) => setField<double>('calcium_mg', value);

  double? get caffeineMg => getField<double>('caffeine_mg');
  set caffeineMg(double? value) => setField<double>('caffeine_mg', value);

  double? get alcoholG => getField<double>('alcohol_g');
  set alcoholG(double? value) => setField<double>('alcohol_g', value);

  double? get carbG => getField<double>('carb_g');
  set carbG(double? value) => setField<double>('carb_g', value);
}
