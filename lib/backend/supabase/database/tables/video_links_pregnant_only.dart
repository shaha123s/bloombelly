import '../database.dart';

class VideoLinksPregnantOnlyTable
    extends SupabaseTable<VideoLinksPregnantOnlyRow> {
  @override
  String get tableName => 'video_links_pregnant_only';

  @override
  VideoLinksPregnantOnlyRow createRow(Map<String, dynamic> data) =>
      VideoLinksPregnantOnlyRow(data);
}

class VideoLinksPregnantOnlyRow extends SupabaseDataRow {
  VideoLinksPregnantOnlyRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VideoLinksPregnantOnlyTable();

  int? get weekNo => getField<int>('week_no');
  set weekNo(int? value) => setField<int>('week_no', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);
}
