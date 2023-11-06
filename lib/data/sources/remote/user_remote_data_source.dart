

import 'package:dio/dio.dart';
import 'package:grandatma_mobile/data/models/auth/user_change_password.dart';

import '../../../common/exception.dart';
import '../../models/user/user_detail_model.dart';
import '../../models/user/user_edit_profile.dart';

abstract class UserRemoteDataSource {
  Future<bool> checkAccessToken();
  Future<UserDetailModel> getUserDetail();
  Future<UserEditProfileModel> editProfile(String name, String email, String username, String notelp);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource{
  final Dio dio;
  
  UserRemoteDataSourceImpl({required this.dio});
  
  @override
  Future<bool> checkAccessToken() async {
    
    final response = await dio.post("pong");
    
    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
    
  }

  @override
  Future<UserDetailModel> getUserDetail() async {
    
    final response = await dio.get("user/bytoken");

    if(response.statusCode == 200) {
      return UserDetailModel.fromJson(response.data);
    } else {
      throw ServerException(response.data['message']);
    }
  }

  @override
  Future<UserEditProfileModel> editProfile(String name, String email, String username, String notelp) async {
    final response = await dio.put("user/update", data: {
      "nama": name,
      "email": email,
      "username": username,
      "notelp": notelp,
    });

    if(response.statusCode == 200) {
      return UserEditProfileModel.fromJson(response.data);
    } else {
      throw ServerException(response.data['message']);
    }
  }


  
}