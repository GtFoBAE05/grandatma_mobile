part of 'pay_jaminan_bloc.dart';

abstract class PayJaminanEvent extends Equatable {
  const PayJaminanEvent();
}

class DoPayJaminan extends PayJaminanEvent {
  final String id;
  final int nominal;

  DoPayJaminan(this.id, this.nominal);

  @override
  List<Object?> get props => [id, nominal];
}
