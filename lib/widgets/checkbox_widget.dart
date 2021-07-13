import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  final String title;
  final bool isCheck;
  final void Function(bool value) onChange;
  const CheckBoxWidget({Key? key, required this.title, required this.isCheck, required this.onChange}) : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

/// This is the private State class that goes with CheckBoxWidget.
class _CheckBoxWidgetState extends State<CheckBoxWidget> {

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      const Set<MaterialState> selectedStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
        MaterialState.selected,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      if (states.any(selectedStates.contains)) {
        return Colors.green;
      }
      return Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.0,
            width: 20.0,
            child: Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: widget.isCheck,
              activeColor: Colors.green,
              onChanged: (bool? value) {
                setState(() {
                 widget.onChange(value ?? false);
                });
              },
            ),
          ),
          SizedBox(width: 10,),
          Text(widget.title)
        ],
      ),
    );
  }
}
