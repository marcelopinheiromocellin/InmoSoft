import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'numeric_formatter.dart';

class NumberInputCustom extends StatefulWidget {
  final String labelText;
  final double numberValue;
  final ThemeData themeData;
  final Color fontColor;
  final bool enabled;
  final ValueChanged<double> onChanged;
  final ValueChanged<String> onSubmited;
  final String errorText;
  final FocusNode focusNode;
  final Color borderSideColor;

  const NumberInputCustom(
      {Key key,
      this.labelText,
      @required this.themeData,
      this.fontColor,
      this.enabled,
      this.onSubmited,
      this.onChanged,
      this.errorText,
      @required this.numberValue,
      this.focusNode,
      this.borderSideColor})
      : super(key: key);

  @override
  _NumberInputCustomState createState() => _NumberInputCustomState();
}

class _NumberInputCustomState extends State<NumberInputCustom> {
  final TextEditingController controller = TextEditingController();
  NumericFormatter formatter = NumericFormatter();

  @override
  void initState() {
    if (widget.numberValue != null) {
      if (widget.numberValue == 0.0) {
        controller.text = '';
      } else {
        final f = new NumberFormat("#,###", 'es_PY');
        controller.text = f.format(widget.numberValue);
      }
    } else {
      controller.text = null;
    }
    super.initState();
  }

  @override
  void didUpdateWidget(NumberInputCustom oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.numberValue != null && widget.numberValue == null) {
      controller.clear();
    }
    if (widget.numberValue == 0.0) {
      controller.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    onChangeValue(String value) {
      final f = new NumberFormat("#,###", 'es_PY');
      int number = int.parse(value.replaceAll(f.symbols.GROUP_SEP, ''));
      this.widget.onChanged(number.toDouble());
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        enabled: widget.enabled ?? true,
        style: widget.themeData.textTheme.headline1
            .copyWith(color: widget.fontColor),
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
        onChanged: (value) {
          onChangeValue(value);
        },
        keyboardType: TextInputType.number,
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly, formatter],
        textAlign: TextAlign.end,
        focusNode: this.widget.focusNode,
      ),
    );
  }
}
