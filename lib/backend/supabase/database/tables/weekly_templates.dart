import '../database.dart';

class WeeklyTemplatesTable extends SupabaseTable<WeeklyTemplatesRow> {
  @override
  String get tableName => 'weekly_templates';

  @override
  WeeklyTemplatesRow createRow(Map<String, dynamic> data) =>
      WeeklyTemplatesRow(data);
}

class WeeklyTemplatesRow extends SupabaseDataRow {
  WeeklyTemplatesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WeeklyTemplatesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get weekNo => getField<int>('week_no')!;
  set weekNo(int value) => setField<int>('week_no', value);

  String get bodyChanges => getField<String>('body_changes')!;
  set bodyChanges(String value) => setField<String>('body_changes', value);

  String get psychChanges => getField<String>('psych_changes')!;
  set psychChanges(String value) => setField<String>('psych_changes', value);

  String get developmentDescription =>
      getField<String>('development_description')!;
  set developmentDescription(String value) =>
      setField<String>('development_description', value);

  String get tipsFtm => getField<String>('tips_ftm')!;
  set tipsFtm(String value) => setField<String>('tips_ftm', value);

  String get tipsMwc => getField<String>('tips_mwc')!;
  set tipsMwc(String value) => setField<String>('tips_mwc', value);

  String get writingPrompt => getField<String>('writing_prompt')!;
  set writingPrompt(String value) => setField<String>('writing_prompt', value);

  String? get media => getField<String>('media');
  set media(String? value) => setField<String>('media', value);

  String? get fetusLengthCm => getField<String>('fetus_length_cm');
  set fetusLengthCm(String? value) =>
      setField<String>('fetus_length_cm', value);

  String? get fetusWeightG => getField<String>('fetus_weight_g');
  set fetusWeightG(String? value) => setField<String>('fetus_weight_g', value);

  dynamic? get educationPregnantOnly =>
      getField<dynamic>('education_pregnant_only');
  set educationPregnantOnly(dynamic? value) =>
      setField<dynamic>('education_pregnant_only', value);

  dynamic? get educationPregnantWithChild =>
      getField<dynamic>('education_pregnant_with_child');
  set educationPregnantWithChild(dynamic? value) =>
      setField<dynamic>('education_pregnant_with_child', value);
}
