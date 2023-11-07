part of 'get_available_room_bloc.dart';

abstract class GetAvailableRoomState extends Equatable {
  const GetAvailableRoomState();

  @override
  List<Object> get props => [];
}

class GetAvailableRoomInitial extends GetAvailableRoomState {}
class GetAvailableRoomLoading extends GetAvailableRoomState {}
class GetAvailableRoomSuccess extends GetAvailableRoomState {
  final List<Room> roomList;

  GetAvailableRoomSuccess({required this.roomList});


}
class GetAvailableRoomError extends GetAvailableRoomState {
  final String message;

  GetAvailableRoomError({required this.message});
}
