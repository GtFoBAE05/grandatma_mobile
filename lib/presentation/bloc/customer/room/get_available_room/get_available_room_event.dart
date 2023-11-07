part of 'get_available_room_bloc.dart';

abstract class GetAvailableRoomEvent extends Equatable {
  const GetAvailableRoomEvent();
}

class SearchAvailableRoom extends GetAvailableRoomEvent{
  final String startDate;
  final String endDate;

  SearchAvailableRoom({required this.startDate, required this.endDate});

  @override
  // TODO: implement props
  List<Object?> get props => [startDate, endDate];

}