

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grandatma_mobile/common/interceptors.dart';
import 'package:grandatma_mobile/data/repositories/auth_repository_impl.dart';
import 'package:grandatma_mobile/data/repositories/jaminan_repository_impl.dart';
import 'package:grandatma_mobile/data/repositories/paid_repository_impl.dart';
import 'package:grandatma_mobile/data/repositories/reservation_repository_impl.dart';
import 'package:grandatma_mobile/data/repositories/room_repository_impl.dart';
import 'package:grandatma_mobile/data/repositories/transaction_repository_impl.dart';
import 'package:grandatma_mobile/data/repositories/user_repository_impl.dart';
import 'package:grandatma_mobile/data/sources/remote/auth_remote_data_source.dart';
import 'package:grandatma_mobile/data/sources/remote/jaminan_remote_data_source.dart';
import 'package:grandatma_mobile/data/sources/remote/paid_facilities_remote_data_source.dart';
import 'package:grandatma_mobile/data/sources/remote/reservation_remote_data_source.dart';
import 'package:grandatma_mobile/data/sources/remote/room_remote_data_source.dart';
import 'package:grandatma_mobile/data/sources/remote/transaction_remote_data_source.dart';
import 'package:grandatma_mobile/data/sources/remote/user_remote_data_source.dart';
import 'package:grandatma_mobile/domain/repositories/jaminan_respotory.dart';
import 'package:grandatma_mobile/domain/repositories/paid_facilities_repository.dart';
import 'package:grandatma_mobile/domain/repositories/reservation_repository.dart';
import 'package:grandatma_mobile/domain/repositories/room_repository.dart';
import 'package:grandatma_mobile/domain/repositories/transaction_repository.dart';
import 'package:grandatma_mobile/domain/repositories/user_repository.dart';
import 'package:grandatma_mobile/presentation/bloc/auth/changepass/change_password_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/auth/signin/signin_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/auth/signup/signup_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/jaminan/get_jaminan/get_jaminan_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/jaminan/pay_jaminan/pay_jaminan_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/paid_facilities/get_paid_facilities/get_paid_facilities_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/paid_facilities/reserve_paid_facilities/reserve_paid_facilities_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/profile/edit_profile/edit_profile_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/profile/profile_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/reservation/add_reservation/add_reservation_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/room/get_available_room/get_available_room_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/room/get_room_detail/get_room_detail_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/detail/transaction_detail_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/do_cancel_transaction/do_cancel_transaction_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/get_transaction_can_cancel/get_transaction_can_cancel_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/history/transaction_history_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/search_transaction_can_cancel/search_transaction_can_cancel_bloc.dart';

import 'domain/repositories/auth_repository.dart';

final locator= GetIt.instance;

void initializeDependencies(){

  //dio //singleton
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.18.14:8080/api/',
    ),
  );

  dio.interceptors.add(LoggingInterceptor());

  locator.registerLazySingleton<Dio>(() => dio);

  //datasource //singleton
  locator.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(dio: locator()));
  locator.registerLazySingleton<JaminanRemoteDataSource>(() => JaminanRemoteDataSourceImpl(dio: locator()));
  locator.registerLazySingleton<PaidFacilitiesRemoteDataSource>(() => PaidFacilitiesRemoteDataSourceImpl(dio: locator()));
  locator.registerLazySingleton<ReservationRemoteDataSource>(() => ReservationRemoteDataSourceImpl(dio: locator()));
  locator.registerLazySingleton<RoomRemoteDataSource>(() => RoomRemoteDataSourceImpl(dio: locator()));
  locator.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(dio: locator()));
  locator.registerLazySingleton<TransactionRemoteDataSource>(() => TransactionRemoteDataSourceImpl(dio: locator()));

  //repository //singleton
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: locator()));
  locator.registerLazySingleton<JaminanRepository>(() => JaminanRepositoryImpl(jaminanRemoteDataSource: locator()));
  locator.registerLazySingleton<PaidFacilitiesRepository>(() => PaidFacilitiesRepositoryImpl(paidFacilitiesRemoteDataSource: locator()));
  locator.registerLazySingleton<ReservationRepository>(() => ReservationRepositoryImpl(reservationRemoteDataSource: locator()));
  locator.registerLazySingleton<RoomRepository>(() => RoomRepositoryImpl(roomRemoteDataSource: locator()));
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userRemoteDataSource: locator()));
  locator.registerLazySingleton<TransactionRepository>(() => TransactionRepositoryImpl(transactionRemoteDataSource: locator()));

  //bloc //factory
  //auth
  locator.registerFactory<SigninBloc>(() => SigninBloc(locator()));
  locator.registerFactory<SignupBloc>(() => SignupBloc(locator()));
  locator.registerFactory<ChangePasswordBloc>(() => ChangePasswordBloc(locator()));

  //jaminan
  locator.registerFactory<GetJaminanBloc>(() => GetJaminanBloc(locator()));
  locator.registerFactory<PayJaminanBloc>(() => PayJaminanBloc(locator()));

  //paid facilities
  locator.registerFactory<GetPaidFacilitiesBloc>(() => GetPaidFacilitiesBloc(locator()));
  locator.registerFactory<ReservePaidFacilitiesBloc>(() => ReservePaidFacilitiesBloc(locator()));

  //reservation
  locator.registerFactory<AddReservationBloc>(() => AddReservationBloc(locator()));

  //room
  locator.registerFactory<GetAvailableRoomBloc>(() => GetAvailableRoomBloc(locator()));
  locator.registerFactory<GetRoomDetailBloc>(() => GetRoomDetailBloc(locator()));

  //user
  locator.registerFactory<ProfileBloc>(() => ProfileBloc(locator()));
  locator.registerFactory<EditProfileBloc>(() => EditProfileBloc(locator()));

  //transaction
  locator.registerFactory<TransactionDetailBloc>(() => TransactionDetailBloc(locator()));
  locator.registerFactory<DoCancelTransactionBloc>(() => DoCancelTransactionBloc(locator()));
  locator.registerFactory<GetTransactionCanCancelBloc>(() => GetTransactionCanCancelBloc(locator()));
  locator.registerFactory<TransactionHistoryBloc>(() => TransactionHistoryBloc(locator()));
  locator.registerFactory<SearchTransactionCanCancelBloc>(() => SearchTransactionCanCancelBloc(locator()));


}