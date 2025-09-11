import '../database.dart';

class PregnancyfatherVideosTable
    extends SupabaseTable<PregnancyfatherVideosRow> {
  @override
  String get tableName => 'pregnancyfather_videos';

  @override
  PregnancyfatherVideosRow createRow(Map<String, dynamic> data) =>
      PregnancyfatherVideosRow(data);
}

class PregnancyfatherVideosRow extends SupabaseDataRow {
  PregnancyfatherVideosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PregnancyfatherVideosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String get url => getField<String>('url')!;
  set url(String value) => setField<String>('url', value);
}
