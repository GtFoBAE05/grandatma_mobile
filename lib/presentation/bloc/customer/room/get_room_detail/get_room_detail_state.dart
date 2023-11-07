part of 'get_room_detail_bloc.dart';

abstract class GetRoomDetailState extends Equatable {
  const GetRoomDetailState();


  @override
  List<Object> get props => [];
}

class GetRoomDetailInitial extends GetRoomDetailState {}
class GetRoomDetailLoading extends GetRoomDetailState {}
class GetRoomDetailSuccess extends GetRoomDetailState {
  final RoomDetail roomDetail;

  GetRoomDetailSuccess({required this.roomDetail});
}
class GetRoomDetailError extends GetRoomDetailState {
  final String message;

  GetRoomDetailError({required this.message});

}
