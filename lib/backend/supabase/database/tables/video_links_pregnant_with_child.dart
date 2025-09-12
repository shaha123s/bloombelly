import '../database.dart';

class VideoLinksPregnantWithChildTable
    extends SupabaseTable<VideoLinksPregnantWithChildRow> {
  @override
  String get tableName => 'video_links_pregnant_with_child';

  @override
  VideoLinksPregnantWithChildRow createRow(Map<String, dynamic> data) =>
      VideoLinksPregnantWithChildRow(data);
}

class VideoLinksPregnantWithChildRow extends SupabaseDataRow {
  VideoLinksPregnantWithChildRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VideoLinksPregnantWithChildTable();

  int? get weekNo => getField<int>('week_no');
  set weekNo(int? value) => setField<int>('week_no', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);
}
