import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String label;
  final MaterialColor color;
  final Function onTap;
  final double width;
  final double height;

  const RoundButton(
      {Key key,
      @required this.label,
      @required this.color,
      @required this.onTap,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: color,
        onPressed: () {
          onTap();
        },
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
