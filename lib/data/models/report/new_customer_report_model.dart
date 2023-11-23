import 'package:equatable/equatable.dart';

import '../../../domain/entities/report/new_customer_report.dart';

class NewCustomerReportModel extends Equatable {
  NewCustomerReportModel({
    required this.data,
    required this.error,
    required this.message,
  });

  final List<Map<String, int>> data;
  final bool? error;
  final String? message;

  factory NewCustomerReportModel.fromJson(Map<String, dynamic> json){
    return NewCustomerReportModel(
      data: json["data"] == null ? [] : List<Map<String, int>>.from(json["data"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, int>(k, v)))),
      error: json["error"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v))).toList(),
    "error": error,
    "message": message,
  };

  NewCustomerReport toEntity(){
    return NewCustomerReport(
      data: data,
      error: error,
      message: message,
    );
  }

  @override
  List<Object?> get props => [
    data, error, message, ];

}

/*
{
	"data": [
		{
			"january": 0,
			"february": 0,
			"march": 0,
			"april": 0,
			"may": 0,
			"june": 0,
			"july": 0,
			"august": 0,
			"september": 0,
			"october": 2,
			"november": 1,
			"december": 0,
			"total": 3
		}
	],
	"error": false,
	"message": "Success get new customer statistics"
}*/