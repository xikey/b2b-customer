import 'package:flutter/material.dart';

class ZikeyDropDownButton extends StatefulWidget {
  const ZikeyDropDownButton({super.key, required this.onSelect, required this.list});

  final Function(String value) onSelect;
  final List<String> list;

  @override
  State<ZikeyDropDownButton> createState() => _SourceDropDownButtonState();
}

class _SourceDropDownButtonState extends State<ZikeyDropDownButton> {
  String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    if (dropdownValue.isEmpty || dropdownValue == '') {
      dropdownValue = widget.list.first;
    }
    return DropdownButton<String>(
      value: dropdownValue,
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple, fontSize: 16),
      underline: Container(
        height: 1,
        width: double.infinity,
        color: Colors.transparent,
      ),
      onChanged: (String? value) {
        if (value != null) widget.onSelect(value);
        setState(() {
          dropdownValue = value!;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        );
      }).toList(),
    );
  }
}
