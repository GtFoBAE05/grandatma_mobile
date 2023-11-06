

import 'package:dio/dio.dart';
import 'package:grandatma_mobile/common/exception.dart';
import 'package:grandatma_mobile/data/models/auth/signin_model.dart';
import 'package:grandatma_mobile/data/models/auth/signup_model.dart';

import '../../models/auth/user_change_password.dart';

abstract class AuthRemoteDataSource {
  Future<SigninModel> login(String email, String password);
  Future<SignupModel> register(String nama, String email, String username,String phone,  String password);
  Future<UserChangePasswordModel> changeUserPassword(String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<SigninModel> login(String email, String password)  async {
    final response = await dio.post("auth/login", data: {
      'email': email,
      'password': password
    });


    if(response.statusCode == 200) {
      return SigninModel.fromJson(response.data);
    } else {
      throw ServerException(response.data['message']);
    }
  }

  @override
  Future<SignupModel> register(String nama, String email, String username, String phone, String password) async {
    final response = await dio.post("auth/signup", data: {
      'nama': nama,
      'email': email,
      'username': username,
      'notelp'  : phone,
      'password': password,
      'role' : 'customer'
    });

    if(response.statusCode == 200) {
      return SignupModel.fromJson(response.data);
    } else {
      throw ServerException(response.data['pesan']);
    }
  }
  @override
  Future<UserChangePasswordModel> changeUserPassword(String password) async {

    final response = await dio.post("auth/changepass", data: {
      "password": password
    }, );

    if(response.statusCode == 200) {
      return UserChangePasswordModel.fromJson(response.data);
    } else {
      throw ServerException(response.data['message']);
    }
  }
  
}

