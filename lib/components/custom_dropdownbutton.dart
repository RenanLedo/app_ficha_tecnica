import 'package:flutter/material.dart';

class CustomDropdownbutton<T> extends StatelessWidget {
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? hint; 
  final T? value;
  final Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;
  final Object? t;
  const CustomDropdownbutton({
    Key? key,
    this.labelText,
    this.prefixIcon,
    this.hint,
    this.value,
    this.onChanged,
    this.items,
    this.t,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration:  InputDecoration(
          labelText: labelText, prefixIcon: Icon(prefixIcon)),
      isExpanded: true,
      hint:  hint,
      value: value,
      onChanged: onChanged,
      items: items,
    );
  }
}


