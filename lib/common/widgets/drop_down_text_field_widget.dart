
import 'package:flutter/material.dart';

class DropDownTextFieldWidget extends StatefulWidget {
  const DropDownTextFieldWidget({Key? key, required this.list, required this.label, required this.onItemSelected}) : super(key: key);
  final List<String> list;
  final String label;
  final Function(String?) onItemSelected;

  @override
  State<DropDownTextFieldWidget> createState() => _DropDownTextFieldWidgetState();
}

class _DropDownTextFieldWidgetState extends State<DropDownTextFieldWidget> {

  final TextEditingController itemController = TextEditingController();
  String? selectedItem;


  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(

      controller: itemController,
      requestFocusOnTap: true,
      label:  Text(widget.label),
      onSelected: (String? item) {
        setState(() {
          selectedItem = item;
          widget.onItemSelected(selectedItem);
        });
      },
      dropdownMenuEntries: widget.list
          .map<DropdownMenuEntry<String>>(
              (String item) {
            return DropdownMenuEntry<String>(
              value: item,
              label: item,
            );
          }).toList(),
    );
  }
}
