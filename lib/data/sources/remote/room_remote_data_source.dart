import 'package:dio/dio.dart';
import 'package:grandatma_mobile/common/exception.dart';
import 'package:grandatma_mobile/data/models/room/check_available_room_model.dart';

import '../../models/room/room_detail_model.dart';

abstract class RoomRemoteDataSource{
  Future<List<RoomModel>> getAvailableRoom(String startDate, String endDate);
  Future<RoomDetailModel> getRoomDetail(int id);
}

class RoomRemoteDataSourceImpl implements RoomRemoteDataSource {
  
  final Dio dio;

  RoomRemoteDataSourceImpl({required this.dio});
  
  @override
  Future<List<RoomModel>> getAvailableRoom(String startDate, String endDate) async {
    final response = await dio.get("kamar/avail", queryParameters: {
      "tanggal_mulai": startDate,
      "tanggal_selesai": endDate
    });

    if(response.statusCode == 200) {
      return AvailRoomResponseModel.fromJson(response.data).data;
    } else {
      throw ServerException(response.data['message']);
    }
  }

  @override
  Future<RoomDetailModel> getRoomDetail(int id) async {
    final response = await dio.get("tipekamar/$id" );

    if(response.statusCode == 200) {
      return RoomDetailResponseModel.fromJson(response.data).data;
    } else {
      throw ServerException(response.data['message']);
    }
  }
}