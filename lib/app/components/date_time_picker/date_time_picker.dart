import 'package:flutter/material.dart';

class DateTimePicker {

  static Future<DateTime> show(BuildContext context, ThemeData theme) async {
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
              primary: theme.primaryColor,
              onPrimary: Colors.white,
              surface: theme.primaryColor,
              onSurface: theme.primaryColor,
              secondary: theme.primaryColor,
            ),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
          ),
          child: child,
        );
      },
    ).then((date) async {
      if (date == null) {
        return null;
      }

      

      TimeOfDay time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (BuildContext context, Widget child) {
            return Theme(
              data: theme.copyWith(
                colorScheme: ColorScheme.light(
                  primary: theme.primaryColor,
                  onPrimary: Colors.white,
                  onSurface: theme.primaryColor,
                  secondary: theme.primaryColor,
                ),
                buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                  colorScheme: ColorScheme.light(
                    primary: theme.primaryColor,
                    secondary: theme
                        .primaryColor, // Color you want for action buttons (CANCEL and OK)
                  ),
                ),
              ),
              child: child,
            );
          });
      if (time == null) {
        return null;
      }
       dtFinal =
          DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });

    return dtFinal;
  }
}
