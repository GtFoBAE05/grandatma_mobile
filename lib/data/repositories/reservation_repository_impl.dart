import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:grandatma_mobile/common/failure.dart';

import 'package:grandatma_mobile/domain/entities/reservation/add_reservation.dart';

import '../../common/exception.dart';
import '../../domain/repositories/reservation_repository.dart';
import '../sources/remote/reservation_remote_data_source.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationRemoteDataSource reservationRemoteDataSource;

  ReservationRepositoryImpl({required this.reservationRemoteDataSource});

  @override
  Future<Either<Failure, AddReservation>> addReservation(
      int idKamar,
      String tanggalCheckin,
      String tanggalCheckout,
      int jumlahDewasa,
      int jumlahAnak,
      String nomorRekening,
      String pilihanKasur) async {
    try {
      final response = await reservationRemoteDataSource.addReservation(
          idKamar,
          tanggalCheckin,
          tanggalCheckout,
          jumlahDewasa,
          jumlahAnak,
          nomorRekening,
          pilihanKasur);
      return Right(response.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['message']));
    }
  }
}
