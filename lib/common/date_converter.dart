import 'package:intl/intl.dart';

String DateConverter(DateTime date){
    // final convertedDate = "${date.day} ${date.} ${date.year}, ${date.hour}:${date.minute}";
    final parsedDate = DateTime.parse(date.toIso8601String());
    final formatDate = DateFormat("dd MMMM yyyy, HH:mm");
    final convertedDate = formatDate.format(parsedDate);
    return convertedDate;
}

String DateConverterWithoutTime(DateTime date){
    // final convertedDate = "${date.day} ${date.} ${date.year}, ${date.hour}:${date.minute}";
    final parsedDate = DateTime.parse(date.toIso8601String());
    final formatDate = DateFormat("dd MMMM yyyy");
    final convertedDate = formatDate.format(parsedDate);
    return convertedDate;
}

Duration calculateDateDifference(String dateString1, String dateString2) {
    DateTime date1 = DateTime.parse(dateString1);
    DateTime date2 = DateTime.parse(dateString2);

    return date2.difference(date1);
}
