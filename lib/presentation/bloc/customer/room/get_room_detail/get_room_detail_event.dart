part of 'get_room_detail_bloc.dart';

abstract class GetRoomDetailEvent extends Equatable {
  const GetRoomDetailEvent();
}

class GetRoomDetail extends GetRoomDetailEvent{
  final int id;
  GetRoomDetail({required this.id});
  @override
  List<Object?> get props => [id];
}