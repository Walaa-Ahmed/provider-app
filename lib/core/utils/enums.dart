

extension DateTimeExtension on DateTime {
  DateTime applied(String time) {
    return DateTime(year, month, day, int.parse(time.substring(0,2)), 0);
  }
}