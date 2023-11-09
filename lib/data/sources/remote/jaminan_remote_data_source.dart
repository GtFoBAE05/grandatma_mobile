
import 'package:dio/dio.dart';
import 'package:grandatma_mobile/data/models/jaminan/jaminan_model.dart';
import 'package:grandatma_mobile/data/models/jaminan/pay_jaminan_response_model.dart';
import 'package:grandatma_mobile/domain/entities/jaminan/pay_jaminan.dart';

import '../../../common/exception.dart';

abstract class JaminanRemoteDataSource {
  Future<List<JaminanModel>> getJaminan();
  Future<PayJaminanResponseModel> payJaminan(String id, int nominal);
}

class JaminanRemoteDataSourceImpl implements JaminanRemoteDataSource {
  final Dio dio;

  JaminanRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<JaminanModel>> getJaminan() async {
    final response = await dio.get("jaminan/my");

    if (response.statusCode == 200) {
      return JaminanResponseModel
          .fromJson(response.data)
          .data;
    } else {
      throw ServerException(response.data['message']);
    }
  }

  @override
  Future<PayJaminanResponseModel> payJaminan(String id, int nominal) async {
    final response = await dio.put("jaminan/$id", data: {
      "nominal": nominal
    });

    if (response.statusCode == 200) {
      return PayJaminanResponseModel
          .fromJson(response.data);
    } else {
      throw ServerException(response.data['message']);
    }
  }
}