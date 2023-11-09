
import 'package:dio/dio.dart';
import 'package:grandatma_mobile/data/models/paid_facilities/add_paid_facilities_model.dart';
import 'package:grandatma_mobile/data/models/paid_facilities/get_paid_facilities_response_model.dart';

import '../../../common/exception.dart';
import '../../../domain/entities/paid_facilities/add_paid_facilities.dart';

abstract class PaidFacilitiesRemoteDataSource {
  Future<AddPaidFacilitiesResponseModel> addPaidFacilities(String id, int idFasilitas, int jumlahUnit);
  Future<List<PaidFacilitiesModel>> getPaidFacilities();
}

class PaidFacilitiesRemoteDataSourceImpl
    implements PaidFacilitiesRemoteDataSource {
  final Dio dio;

  PaidFacilitiesRemoteDataSourceImpl({required this.dio});

  @override
  Future<AddPaidFacilitiesResponseModel> addPaidFacilities(String id, int idFasilitas, int jumlahUnit) async {
    final response = await dio.post("fasilitasreservasi", data: {
      "id_reservasi": id,
      "id_fasilitas_berbayar" : idFasilitas,
      "jumlah_unit" : jumlahUnit
    });

    if (response.statusCode == 200) {
      return AddPaidFacilitiesResponseModel.fromJson(response.data);
    } else {
      print(response);
      throw ServerException(response.data['message']);
    }
  }

  @override
  Future<List<PaidFacilitiesModel>> getPaidFacilities() async {
    final response = await dio.get("fasilitasberbayar");

    if (response.statusCode == 200) {
      return PaidFacilitiesResponseModel.fromJson(response.data).data;
    } else {
      throw ServerException(response.data['message']);
    }
  }

  //get facility

}
