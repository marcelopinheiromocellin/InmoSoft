import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String label;
  final Color color;
  final Function onPressed;
  final double width;
  final double height;
  final double fontSize;
  final double elevation;
  final Icon icon;
  final bool isEnabled;
  const Button(this.label,
      {Key key,
      this.color,
      @required this.onPressed,
      this.height,
      this.width,
      this.fontSize,
      this.icon,
      this.isEnabled = false,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: elevation,
        minWidth: width,
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon != null ? icon : Container(),
            Text(label,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        color: Color.fromRGBO(28, 90, 92, 1),
        disabledColor: Color.fromRGBO(28, 90, 92, 1),
        disabledElevation: 0,
        onPressed: isEnabled ? onPressed : null,
      ),
    );
  }
}
