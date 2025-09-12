import '../database.dart';

class WeeklyFatherGuidanceTable extends SupabaseTable<WeeklyFatherGuidanceRow> {
  @override
  String get tableName => 'weekly_father_guidance';

  @override
  WeeklyFatherGuidanceRow createRow(Map<String, dynamic> data) =>
      WeeklyFatherGuidanceRow(data);
}

class WeeklyFatherGuidanceRow extends SupabaseDataRow {
  WeeklyFatherGuidanceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WeeklyFatherGuidanceTable();

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

  dynamic get guidanceDetail => getField<dynamic>('guidance_detail')!;
  set guidanceDetail(dynamic value) =>
      setField<dynamic>('guidance_detail', value);

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

  dynamic? get guidanceDetailEn => getField<dynamic>('guidance_detail_en');
  set guidanceDetailEn(dynamic? value) =>
      setField<dynamic>('guidance_detail_en', value);
}
