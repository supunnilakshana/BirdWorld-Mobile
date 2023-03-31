import 'package:intl/intl.dart';

class DateTimeService {
  static String getStringdatenow() {
    var dateParse = DateTime.now();
    String date = "${dateParse.day}/${dateParse.month}/${dateParse.year}";
    return date;
  }

  static String getStringCollectiondatenow() {
    var dateParse = DateTime.now();
    String date = "${dateParse.day}/${dateParse.month}/${dateParse.year}";
    return date;
  }

  static String getStringdatetimenow() {
    String date = DateFormat.yMd().add_jm().format(DateTime.now()).toString();
    return date;
  }

  static String getStringdatetime(DateTime dateTime) {
    String date = DateFormat.yMd().add_jm().format(dateTime).toString();
    return date;
  }

  static DateTime convertDatetime(String date) {
    var datetime = DateFormat('d/M/yyyy').parse(date);
    print(datetime);
    return datetime;
  }

  static String getDateTimeId() {
    return DateTime.now()
        .toString()
        .replaceAll("-", "")
        .replaceAll(":", "")
        .replaceAll(" ", "")
        .replaceAll(".", "");
  }
}
