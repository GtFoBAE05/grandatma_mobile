import 'package:intl/intl.dart';

String DateConverter(DateTime date){
    // final convertedDate = "${date.day} ${date.} ${date.year}, ${date.hour}:${date.minute}";
    final parsedDate = DateTime.parse(date.toIso8601String());
    final formatDate = DateFormat("dd MMMM yyyy, HH:mm");
    final convertedDate = formatDate.format(parsedDate);
    return convertedDate;
}