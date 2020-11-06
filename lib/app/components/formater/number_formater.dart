import 'package:intl/intl.dart';

String formatNumber(double number, int idMoeda) {
  String vl = '';
  if (number <= 0) {
    if (idMoeda == 1 || idMoeda == 3) {
      return '0';
    } else {
      return '0,0';
    }
  } else {
    if (idMoeda == 1 || idMoeda == 3) {
      final numberFormat = NumberFormat("###,###", "es_PY");
      vl = numberFormat.format(number);
    } else {
      final numberFormat = NumberFormat("###,###.0#", "es_PY");
      vl = numberFormat.format(number);
    }
    return vl;
  }
}
