import 'package:intl/intl.dart';

class DateTimeHelper {
  static DateTime format() {
    final now = DateTime.now();
    final dateFormat = DateFormat('y/M/d');
    final timeSpecific = "07:00:00 PM";
    final todayDate = dateFormat.format(now);
    final completeDateAndTime = "$todayDate $timeSpecific";
    final completeFormat = DateFormat('y/M/d h:m:s a');
    var result = completeFormat.parseStrict(completeDateAndTime);
    return result;
  }
}
