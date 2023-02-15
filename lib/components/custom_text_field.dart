import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  final IconData? icon;
  final IconData? suffixIcon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final GlobalKey<FormFieldState>? formFieldKey;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    Key? key,
    this.icon,
    this.onChanged,
    this.suffixIcon,
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
    this.initialValue,
    this.readOnly = false,
    this.validator,
    this.controller,
    this.textInputType,
    this.formFieldKey,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        onChanged: widget.onChanged,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        validator: widget.validator,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        key: widget.formFieldKey,
        decoration: InputDecoration(
          filled: true,
          fillColor: Get.isPlatformDarkMode
              ? const Color.fromARGB(255, 73, 73, 73)
              : const Color.fromARGB(255, 230, 230, 230),
          prefixIcon: widget.icon == null ? null : Icon(widget.icon),
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                )
              : Icon(widget.suffixIcon),
          labelText: widget.label,
          isDense: true,
          // focusedBorder: UnderlineInputBorder(
          //     borderSide:
          //         BorderSide(width: 2, color: Theme.of(context).primaryColor)),
          // enabledBorder: UnderlineInputBorder(
          //   borderSide:
          //       BorderSide(width: 2, color: Theme.of(context).splashColor),
          // ),
        ),
      ),
    );
  }
}
