import 'package:flutter/material.dart';

class DatePicker {
  static Future<DateTime> show(BuildContext context, DateTime initialDate,
      DateTime firstDate, DateTime lastDate) async {
    DateTime dtFinal;
    await showDatePicker(
        context: context,
        locale: Locale("es", "PY"),
        firstDate: (firstDate == null ? DateTime.now() : firstDate),
        initialDate: (initialDate == null ? DateTime.now() : initialDate),
        lastDate: (lastDate == null
            ? DateTime.now().add(Duration(days: 365))
            : lastDate),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData().copyWith(
              colorScheme: ColorScheme.light(
                  primary: Color.fromRGBO(57, 151, 114, 1),
                  onPrimary: Colors.white,
                  surface: Color.fromRGBO(57, 151, 114, 1),
                  onSurface: Color.fromRGBO(57, 151, 114, 1),
                  secondary: Color.fromRGBO(57, 151, 114, 1),
                  background: Color.fromRGBO(57, 151, 114, 1)),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
            ),
            child: child,
          );
        }).then((value) {
      dtFinal = value;
    });
    return dtFinal;
  }

  static Future<DateTime> showBasic(
      BuildContext context, ThemeData theme) async {
    DateTime dtFinal;
    await showDatePicker(
      context: context,
      locale: Locale("es", "PY"),
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: theme.copyWith(
            colorScheme: ColorScheme.light(
                primary: Color.fromRGBO(57, 151, 114, 1),
                onPrimary: Colors.white,
                surface: Color.fromRGBO(57, 151, 114, 1),
                onSurface: Color.fromRGBO(57, 151, 114, 1),
                secondary: Color.fromRGBO(57, 151, 114, 1),
                background: Color.fromRGBO(57, 151, 114, 1)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
          ),
          child: child,
        );
      },
    );
    return dtFinal;
  }
}
