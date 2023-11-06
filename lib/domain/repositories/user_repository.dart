
import 'package:dartz/dartz.dart';
import 'package:grandatma_mobile/common/failure.dart';
import 'package:grandatma_mobile/domain/entities/user/UserEditProfile.dart';
import 'package:grandatma_mobile/domain/entities/auth/user_change_password.dart';
import 'package:grandatma_mobile/domain/entities/user/UserDetail.dart';

abstract class UserRepository{
  Future<Either<Failure,bool>> checkAccessToken();

  Future<Either<Failure,UserDetail>> getUserDetail();

  Future<Either<Failure,UserEditProfile>> doEditProfile(String name, String email, String username, String notelp);
}