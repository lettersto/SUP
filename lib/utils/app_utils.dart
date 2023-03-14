class AppUtils {
  static String dateFormatter(String date) {
    DateTime parsedTime = DateTime.parse(date);
    var year = parsedTime.year.toString();
    var month = parsedTime.month.toString();
    var day = parsedTime.day.toString();

    return '$year.${month.length == 1 ? '0$month' : month}.${day.length == 1 ? '0$day' : day}';
  }
}
