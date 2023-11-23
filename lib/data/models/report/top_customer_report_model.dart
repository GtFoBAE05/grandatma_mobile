import 'package:equatable/equatable.dart';
import 'package:grandatma_mobile/domain/entities/report/top_customer_report.dart';

class TopCustomerReportModel extends Equatable {
  TopCustomerReportModel({
    required this.data,
    required this.error,
    required this.message,
  });

  final List<TopCustomerReportDataModel> data;
  final bool? error;
  final String? message;

  factory TopCustomerReportModel.fromJson(Map<String, dynamic> json){
    return TopCustomerReportModel(
      data: json["data"] == null ? [] : List<TopCustomerReportDataModel>.from(json["data"]!.map((x) => TopCustomerReportDataModel.fromJson(x))),
      error: json["error"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data.map((x) => x?.toJson()).toList(),
    "error": error,
    "message": message,
  };

  @override
  List<Object?> get props => [
    data, error, message, ];

}

class TopCustomerReportDataModel extends Equatable {
  TopCustomerReportDataModel({
    required this.name,
    required this.reservationCount,
    required this.totalPayment,
  });

  final String? name;
  final String? reservationCount;
  final String? totalPayment;

  factory TopCustomerReportDataModel.fromJson(Map<String, dynamic> json){
    return TopCustomerReportDataModel(
      name: json["name"],
      reservationCount: json["reservation_count"],
      totalPayment: json["total_payment"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "reservation_count": reservationCount,
    "total_payment": totalPayment,
  };

  TopCustomerReportData toEntity(){
    return TopCustomerReportData(
      name: name,
      reservationCount: reservationCount,
      totalPayment: totalPayment,
    );
  }

  @override
  List<Object?> get props => [
    name, reservationCount, totalPayment, ];

}

/*
{
	"data": [
		{
			"name": "andis",
			"reservation_count": "7",
			"total_payment": "23450000"
		},
		{
			"name": "budiiii",
			"reservation_count": "4",
			"total_payment": "4250000"
		},
		{
			"name": "kelas",
			"reservation_count": "1",
			"total_payment": "1400000"
		}
	],
	"error": false,
	"message": "Success get new customer statistics"
}*/