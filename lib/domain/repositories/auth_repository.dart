
import 'package:dartz/dartz.dart';
import 'package:grandatma_mobile/domain/entities/auth/signin.dart';
import 'package:grandatma_mobile/domain/entities/auth/signup.dart';

import '../../common/failure.dart';
import '../entities/auth/user_change_password.dart';

abstract class AuthRepository {
  Future<Either<Failure, Signin>> login(String email, String password);
  Future<Either<Failure, Signup>> register(String nama, String email, String username, String phone, String password);
  Future<Either<Failure,UserChangePassword>> changeUserPassword(String password);
}
