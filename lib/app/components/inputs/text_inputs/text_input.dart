import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInput extends StatefulWidget {
  final String text;
  final String label;
  final String errorText;
  final ValueChanged<String> onChanged;
  final String hintText;
  final Widget icon;
  final int minLines;
  final int maxLines;
  final int maxLength;
  final bool enabled;
  final bool isPassword;
  final bool autoFocus;
  final FocusNode focusNode;
  final EdgeInsetsGeometry contentPadding;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final Function onSubmited;

  const TextInput({
    Key key,
    this.text,
    this.icon,
    this.autoFocus = false,
    this.isPassword = false,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.minLines = 1,
    this.maxLines = 1,
    this.enabled,
    this.contentPadding,
    this.maxLength,
    this.inputFormatters,
    this.errorText,
    @required this.label,
    this.onChanged,
    this.textInputAction,
    this.onSubmited,
    this.focusNode,
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool focado = false;

  @override
  void initState() {
    focado = widget.autoFocus;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            focado = hasFocus;
          });
        },
        child: TextField(
          style: GoogleFonts.montserrat(color: Colors.grey),
          onChanged: widget.onChanged,
          maxLength: widget.maxLength,
          minLines: widget.minLines, //Normal textInputField will be displayed
          maxLines: widget.maxLines, //
          enabled: widget.enabled, //
          obscureText: widget.isPassword,
          controller: widget.controller,
          autofocus: widget.autoFocus,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textAlign: TextAlign.start,
          textInputAction: widget.textInputAction,
          onSubmitted: widget.onSubmited,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              errorText: (this.widget.errorText == null
                  ? null
                  : this.widget.errorText),
              contentPadding: widget.contentPadding ??
                  EdgeInsets.only(left: 20.0, right: 10),
              border: new OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF052744), width: 1.0),
              ),
              hintStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF052744)),
              hintText: widget.hintText,
              filled: true,
              labelText: widget.label,
              labelStyle: GoogleFonts.montserrat(
                  fontSize: 15.0,
                  color: (focado ? Color(0xFF052744) : Colors.grey)),
              suffixIcon: widget.icon,
              fillColor: Colors.white,
              hoverColor: Colors.grey),
        ),
      ),
    );
  }
}
