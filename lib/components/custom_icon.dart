import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  VoidCallback onPress;
  double radios;
  Color backgrounColor;
  Color color;
  IconData icon;
  double padding;

  CustomIcon({
    Key? key,
    required this.onPress,
    required this.radios,
    required this.backgrounColor,
    required this.color,
    required this.icon,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radios),
      child: Material(
        color: backgrounColor,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: InkWell(
            onTap: onPress,
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
