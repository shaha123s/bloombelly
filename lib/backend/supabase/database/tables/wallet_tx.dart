import '../database.dart';

class WalletTxTable extends SupabaseTable<WalletTxRow> {
  @override
  String get tableName => 'wallet_tx';

  @override
  WalletTxRow createRow(Map<String, dynamic> data) => WalletTxRow(data);
}

class WalletTxRow extends SupabaseDataRow {
  WalletTxRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WalletTxTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  List<String> get service => getListField<String>('service');
  set service(List<String>? value) => setListField<String>('service', value);

  String? get walletId => getField<String>('wallet_id');
  set walletId(String? value) => setField<String>('wallet_id', value);
}
