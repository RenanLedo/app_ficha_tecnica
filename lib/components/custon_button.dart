import 'package:flutter/material.dart';

class CustonButton extends StatelessWidget {
  VoidCallback onPress;
  String label;

  CustonButton({
    Key? key,
    required this.onPress,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor),
        onPressed: onPress,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
