import 'package:dio/dio.dart';
import 'package:grandatma_mobile/common/exception.dart';

import '../../models/reservation/add_reservation_model.dart';

abstract class ReservationRemoteDataSource {
  Future<AddReservationModel> addReservation(
      int idKamar,
      String tanggalCheckin,
      String tanggalCheckout,
      int jumlahDewasa,
      int jumlahAnak,
      String nomorRekening,
      String pilihanKasur);
}

class ReservationRemoteDataSourceImpl implements ReservationRemoteDataSource {
  final Dio dio;

  ReservationRemoteDataSourceImpl({required this.dio});

  @override
  Future<AddReservationModel> addReservation(
      int idKamar,
      String tanggalCheckin,
      String tanggalCheckout,
      int jumlahDewasa,
      int jumlahAnak,
      String nomorRekening,
      String pilihanKasur) async {
    final response = await dio.post("personal/reservasi", data: {
      "id_kamar": idKamar,
      "tanggal_checkin": tanggalCheckin,
      "tanggal_checkout": tanggalCheckout,
      "jumlah_dewasa": jumlahDewasa,
      "jumlah_anak": jumlahAnak,
      "nomor_rekening": nomorRekening,
      "pilihan_kasur": pilihanKasur
    });

    if (response.statusCode == 200) {
      return AddReservationResponseModel.fromJson(response.data).data;
    } else {
      throw ServerException(response.data['message']);
    }
  }
}
