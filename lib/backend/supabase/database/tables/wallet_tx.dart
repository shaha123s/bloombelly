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

  String get walletId => getField<String>('wallet_id')!;
  set walletId(String value) => setField<String>('wallet_id', value);

  String get txType => getField<String>('tx_type')!;
  set txType(String value) => setField<String>('tx_type', value);

  double get amount => getField<double>('amount')!;
  set amount(double value) => setField<double>('amount', value);

  String? get managerId => getField<String>('manager_id');
  set managerId(String? value) => setField<String>('manager_id', value);

  String? get service => getField<String>('service');
  set service(String? value) => setField<String>('service', value);

  DateTime get txTime => getField<DateTime>('tx_time')!;
  set txTime(DateTime value) => setField<DateTime>('tx_time', value);
}
