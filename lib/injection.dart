

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grandatma_mobile/common/interceptors.dart';
import 'package:grandatma_mobile/data/repositories/auth_repository_impl.dart';
import 'package:grandatma_mobile/data/repositories/transaction_repository_impl.dart';
import 'package:grandatma_mobile/data/repositories/user_repository_impl.dart';
import 'package:grandatma_mobile/data/sources/remote/auth_remote_data_source.dart';
import 'package:grandatma_mobile/data/sources/remote/transaction_remote_data_source.dart';
import 'package:grandatma_mobile/data/sources/remote/user_remote_data_source.dart';
import 'package:grandatma_mobile/domain/repositories/transaction_repository.dart';
import 'package:grandatma_mobile/domain/repositories/user_repository.dart';
import 'package:grandatma_mobile/presentation/bloc/auth/changepass/change_password_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/auth/signin/signin_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/auth/signup/signup_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/profile/edit_profile/edit_profile_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/profile/profile_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/detail/transaction_detail_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/history/transaction_history_bloc.dart';

import 'domain/repositories/auth_repository.dart';

final locator= GetIt.instance;

void initializeDependencies(){

  //dio //singleton
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:3000/api/',
    ),
  );

  dio.interceptors.add(LoggingInterceptor());

  locator.registerLazySingleton<Dio>(() => dio);

  //datasource //singleton
  locator.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(dio: locator()));
  locator.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(dio: locator()));
  locator.registerLazySingleton<TransactionRemoteDataSource>(() => TransactionRemoteDataSourceImpl(dio: locator()));

  //repository //singleton
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: locator()));
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userRemoteDataSource: locator()));
  locator.registerLazySingleton<TransactionRepository>(() => TransactionRepositoryImpl(transactionRemoteDataSource: locator()));

  //bloc //factory
  //auth
  locator.registerFactory<SigninBloc>(() => SigninBloc(locator()));
  locator.registerFactory<SignupBloc>(() => SignupBloc(locator()));
  locator.registerFactory<ChangePasswordBloc>(() => ChangePasswordBloc(locator()));

  //user
  locator.registerFactory<ProfileBloc>(() => ProfileBloc(locator()));
  locator.registerFactory<EditProfileBloc>(() => EditProfileBloc(locator()));

  //transaction
  locator.registerFactory<TransactionHistoryBloc>(() => TransactionHistoryBloc(locator()));
   locator.registerFactory<TransactionDetailBloc>(() => TransactionDetailBloc(locator()));


}