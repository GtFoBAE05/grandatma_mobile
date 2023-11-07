part of 'get_jaminan_bloc.dart';

abstract class GetJaminanState extends Equatable {
  const GetJaminanState();
  @override
  List<Object> get props => [];
}

class GetJaminanInitial extends GetJaminanState {}
class GetJaminanLoading extends GetJaminanState {}
class GetJaminanSuccess extends GetJaminanState {
  final List<Jaminan> listJaminan;
  GetJaminanSuccess({required this.listJaminan});
}
class GetJaminanError extends GetJaminanState {
  final String message;
  GetJaminanError({required this.message});
}
