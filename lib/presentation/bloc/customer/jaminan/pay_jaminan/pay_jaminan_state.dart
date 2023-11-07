part of 'pay_jaminan_bloc.dart';

abstract class PayJaminanState extends Equatable {
  const PayJaminanState();

  @override
  List<Object> get props => [];
}

class PayJaminanInitial extends PayJaminanState {}
class PayJaminanLoading extends PayJaminanState {}
class PayJaminanSuccess extends PayJaminanState {
  final String message;

  PayJaminanSuccess({required this.message});

}
class PayJaminanError extends PayJaminanState {
  final String message;

  PayJaminanError({required this.message});

}
