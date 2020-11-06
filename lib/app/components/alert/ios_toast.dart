import 'package:flutter/material.dart';

import 'alert.dart';

class IosToast extends StatelessWidget {
  final String text;
  final int type;

  const IosToast({Key key, @required this.text, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    IconData icon;
    var color;

    if (type == Alert.SUCCESS) {
      style =
          Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white);
      icon = Icons.check;
      color = Colors.white;
    } else if (type == Alert.WARNING) {
      style =
          Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber);
      icon = Icons.warning;
      color = Colors.amber;
    } else {
      style = Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.red);
      icon = Icons.error_outline;
      color = Colors.red;
    }

    return SafeArea(
      child: DefaultTextStyle(
        style: style,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.black87,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[Icon(icon, color: color), Text(text)],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
