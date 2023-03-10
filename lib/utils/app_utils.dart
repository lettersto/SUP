class AppUtils {
  static String dateFormatter([DateTime? date]) {
    DateTime curDateTime = date ?? DateTime.now();
    var year = curDateTime.year.toString();
    var month = curDateTime.month.toString();
    var day = curDateTime.day.toString();

    return '$year.${month.length == 1 ? '0$month' : month}.${day.length == 1 ? '0$day' : day}';
  }
}
