import '../database.dart';

class VaccineTable extends SupabaseTable<VaccineRow> {
  @override
  String get tableName => 'vaccine';

  @override
  VaccineRow createRow(Map<String, dynamic> data) => VaccineRow(data);
}

class VaccineRow extends SupabaseDataRow {
  VaccineRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VaccineTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get vaccineName => getField<String>('vaccine_name');
  set vaccineName(String? value) => setField<String>('vaccine_name', value);

  String? get ageFrom => getField<String>('age_from');
  set ageFrom(String? value) => setField<String>('age_from', value);

  String? get ageTo => getField<String>('age_to');
  set ageTo(String? value) => setField<String>('age_to', value);

  String? get dueDate => getField<String>('due_date');
  set dueDate(String? value) => setField<String>('due_date', value);

  String? get nextDueDate => getField<String>('next_due_date');
  set nextDueDate(String? value) => setField<String>('next_due_date', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get age => getField<String>('age');
  set age(String? value) => setField<String>('age', value);

  String? get sideEffect => getField<String>('side_effect');
  set sideEffect(String? value) => setField<String>('side_effect', value);

  String? get preventiveMeasures => getField<String>('Preventive_Measures');
  set preventiveMeasures(String? value) =>
      setField<String>('Preventive_Measures', value);

  String? get vaccineNameEn => getField<String>('vaccine_name_en');
  set vaccineNameEn(String? value) =>
      setField<String>('vaccine_name_en', value);

  String? get notesEn => getField<String>('notes_en');
  set notesEn(String? value) => setField<String>('notes_en', value);

  String? get ageEn => getField<String>('age_en');
  set ageEn(String? value) => setField<String>('age_en', value);

  String? get sideEffectEn => getField<String>('side_effect_en');
  set sideEffectEn(String? value) => setField<String>('side_effect_en', value);

  String? get preventiveMeasuresEn =>
      getField<String>('preventive_measures_en');
  set preventiveMeasuresEn(String? value) =>
      setField<String>('preventive_measures_en', value);
}
