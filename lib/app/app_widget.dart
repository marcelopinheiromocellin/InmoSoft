import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
        child: GetMaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 5,
          color: Color.fromRGBO(28, 90, 92, 1),
        ),
        textTheme: TextTheme(
          bodyText1: GoogleFonts.montserrat(),
          bodyText2: GoogleFonts.montserrat(),
        ),
        primaryColor: Color.fromRGBO(28, 90, 92, 1),
        accentColor: Color.fromRGBO(28, 90, 92, 1),
        backgroundColor: Color.fromRGBO(28, 90, 92, 1),
        colorScheme: ColorScheme.light(
          primary: Color.fromRGBO(28, 90, 92, 1),
          onPrimary: Colors.white,
          surface: Color.fromRGBO(28, 90, 92, 1),
          secondary: Color.fromRGBO(28, 90, 92, 1),
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es', 'PY'), // English, no country code
      ],
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    ));
  }
}
