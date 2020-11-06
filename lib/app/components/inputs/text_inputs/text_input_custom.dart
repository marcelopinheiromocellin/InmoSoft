// import 'package:flutter/material.dart';

// class TextFieldCustom extends TextField {
//   TextFieldCustom({
//     ValueChanged<String> onChanged,
//     ValueChanged<String> onSubmited,
//     @required String labelText,
//     String errorText,
//     bool obscureText,
//     double borderRadius,
//     double fontSize,
//     EdgeInsets padding,
//     TextEditingController controller,
//     FocusNode focusNode,
//     bool enabled,
//     ThemeData themeData,
//     Color fontColor,
//   }) : super(
//           focusNode: focusNode,
//           controller: controller,
//           enabled: enabled ?? true,
//           style: themeData.textTheme.headline1.copyWith(color: fontColor),
//           decoration: InputDecoration(
//             labelText: labelText,
//             errorText: errorText,
//           ),
//           onSubmitted: onSubmited,
//           onChanged: onChanged,
//         );
// }

import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  final String text;
  final String labelText;
  final Color fontColor;
  final bool enabled;
  final Function onSubmited;
  final Function onChanged;
  final String errorText;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final Color borderSideColor;

  const TextFieldCustom(
      {Key key,
      @required this.text,
      this.fontColor,
      this.enabled,
      this.onSubmited,
      this.onChanged,
      this.errorText,
      this.focusNode,
      this.labelText,
      this.keyboardType,
      this.borderSideColor})
      : super(key: key);

  @override
  _TextFieldCustomState createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    if (widget.text == null || widget.text.isEmpty) {
      controller.text = "";
    } else {
      if (widget.text == 'null') {
        controller.text = '';
      } else {
        controller.text = widget.text;
      }
    }

    super.initState();
  }

  @override
  void didUpdateWidget(TextFieldCustom oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.text == null || widget.text.isEmpty || widget.text == 'null') {
      controller.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        controller: controller,
        enabled: widget.enabled ?? true,
        decoration: InputDecoration(
          labelText: widget.labelText,
          errorText: widget.errorText,
          enabledBorder: widget.borderSideColor != null
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: widget.borderSideColor),
                )
              : null,
        ),
        onSubmitted: widget.onSubmited,
        onChanged: widget.onChanged,
        textDirection: TextDirection.ltr,
        maxLines: null,
        textInputAction: TextInputAction
            .go, // In case you want the "ENTER" key to close the Keyboard
        minLines: 1,
      ),
    );
  }
}
