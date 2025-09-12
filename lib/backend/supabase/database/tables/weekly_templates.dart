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

  String? get sizeMedia => getField<String>('size_media');
  set sizeMedia(String? value) => setField<String>('size_media', value);

  String? get nameSize => getField<String>('name_size');
  set nameSize(String? value) => setField<String>('name_size', value);

  String? get text => getField<String>('text');
  set text(String? value) => setField<String>('text', value);

  String? get bodyChangesEn => getField<String>('body_changes_en');
  set bodyChangesEn(String? value) =>
      setField<String>('body_changes_en', value);

  String? get psychChangesEn => getField<String>('psych_changes_en');
  set psychChangesEn(String? value) =>
      setField<String>('psych_changes_en', value);

  String? get developmentDescriptionEn =>
      getField<String>('development_description_en');
  set developmentDescriptionEn(String? value) =>
      setField<String>('development_description_en', value);

  String? get tipsFtmEn => getField<String>('tips_ftm_en');
  set tipsFtmEn(String? value) => setField<String>('tips_ftm_en', value);

  String? get tipsMwcEn => getField<String>('tips_mwc_en');
  set tipsMwcEn(String? value) => setField<String>('tips_mwc_en', value);

  String? get writingPromptEn => getField<String>('writing_prompt_en');
  set writingPromptEn(String? value) =>
      setField<String>('writing_prompt_en', value);

  String? get nameSizeEn => getField<String>('name_size_en');
  set nameSizeEn(String? value) => setField<String>('name_size_en', value);

  String? get textEn => getField<String>('text_en');
  set textEn(String? value) => setField<String>('text_en', value);
}
