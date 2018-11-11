import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class OptionValueFormField extends StatefulWidget {
  final Key key;
  final bool isIntialCheck;
  final String initialValue;
  final String textWhenChecked;
  final String labelForValue;
  final FormFieldValidator<String> valueValidator;

  OptionValueFormField({this.key, this.isIntialCheck, this.initialValue,
      this.textWhenChecked, this.labelForValue, this.valueValidator})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      OptionValueFormFieldState(isIntialCheck, initialValue);
}

class OptionValueFormFieldState extends State<OptionValueFormField> {
  bool check;
  String value;

  OptionValueFormFieldState(this.check, this.value);

  TextEditingController controller;


  @override
  void initState() {
    controller = TextEditingController(text: widget.initialValue);
    controller.addListener(() => setState(() {value = controller.text;}));
  }

  @override
  Widget build(BuildContext context) {

    var content;
    if (check) {
      content = Text(widget.textWhenChecked);
    } else {
      content = TextFormField(
        decoration: InputDecoration(labelText: widget.labelForValue),
        validator: widget.valueValidator,
        controller: controller,
      );
    };
    
    return Row(children: <Widget>[
      Checkbox(
        value: this.check,
        onChanged: (flag) {
          setState(() {
            this.check = flag;
          });
        },
      ),
      Expanded(child: content)
    ]);
  }
}
