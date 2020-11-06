import 'package:flutter/material.dart';
import 'package:inmo_soft/app/components/date_picker/date_picker.dart';
import 'package:inmo_soft/app/components/inputs/text_inputs/text_input.dart';
import 'package:inmo_soft/app/components/utils/date/date_utils.dart';

import '../../app_controller.dart';

class DateField extends StatefulWidget {
  final String date;
  final ValueChanged<String> selectedDate;
  final double width;
  final AppController theme;
  final String label;
  final String errorText;

  const DateField({
    Key key,
    @required this.date,
    @required this.selectedDate,
    this.width,
    @required this.theme,
    @required this.label,
    this.errorText,
  }) : super(key: key);

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  String formatted;

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    formatted = DateUtils.formatDate(widget.date);
    if (widget.date == null) {
      formatted = "";
    }
    controller.text = formatted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(DateUtils.formatDate(widget.date));

    return Container(
      width: (widget.width == null ? double.infinity : widget.width),
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: TextInput(
              controller: controller,
              label: widget.label,
              enabled: false,
              text: formatted,
              errorText: (this.widget.errorText == null
                  ? null
                  : this.widget.errorText),
            ),
          ),
          IconButton(
            icon: Icon(Icons.calendar_today, color: Color(0xFF052744)),
            onPressed: () {
              DatePicker.show(context, DateTime.now(), DateTime(1900, 1, 1),
                      DateTime.now())
                  .then(
                (value) {
                  if (value != null) {
                    widget.selectedDate(DateUtils.javaFormat(value));
                    setState(() {
                      formatted = DateUtils.formatDate(value.toString());
                    });
                    controller.text = formatted;
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
