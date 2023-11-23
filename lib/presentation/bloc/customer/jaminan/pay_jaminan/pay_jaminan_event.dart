part of 'pay_jaminan_bloc.dart';

abstract class PayJaminanEvent extends Equatable {
  const PayJaminanEvent();
}

class DoPayJaminan extends PayJaminanEvent {
  final String id;
  final int nominal;
  final String nomorRekening;

  DoPayJaminan(this.id, this.nominal, this.nomorRekening);

  @override
  List<Object?> get props => [id, nominal, nomorRekening];
}
