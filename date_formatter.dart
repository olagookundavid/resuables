import 'package:intl/intl.dart';

class DateFormatter {
  static String? format(DateTime date) {
    var newDate = DateFormat("yyyy-MM-dd").format(date);
    return newDate;
  }
}
