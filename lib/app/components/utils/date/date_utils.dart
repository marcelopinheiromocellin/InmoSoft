import 'package:intl/intl.dart';

class DateUtils {
  static DateTime toDate(String date) {
    if (date == null || date.isEmpty) {
      return null;
    }
    return DateTime.parse(date);
  }

  static String format(DateTime date) {
    if (date == null) {
      return null;
    }
    final f = new DateFormat('dd/MM/yyyy HH:mm');
    return f.format(date);
  }

  static String formatDateTime(String date) {
    if (date == null || date.isEmpty) {
      return null;
    }
    final f = new DateFormat('dd/MM/yyyy HH:mm');
    DateTime dt = toDate(date);
    return f.format(dt);
  }

  static String formatDate(String date) {
    if (date == null || date.isEmpty) {
      return null;
    }
    final f = new DateFormat('dd/MM/yyyy');
    DateTime dt = toDate(date);
    print(f.format(dt));
    return f.format(dt);
  }

  static String formatDateVenta(String date) {
    if (date == null || date.isEmpty) {
      return null;
    }
    final f = new DateFormat('yyyy-MM-dd');
    DateTime dt = toDate(date);
    print(f.format(dt));
    return f.format(dt);
  }

  static String javaFormat(DateTime date) {
    if (date == null) {
      return null;
    }
    final f = new DateFormat('yyyy-MM-ddTHH:mm');
    return f.format(date);
  }
}
