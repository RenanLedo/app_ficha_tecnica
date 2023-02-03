import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        Image.asset(
          'assets/images/logo.png',
          width: 100,
        ),
        const Text(
          'Ficha Dez',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ]),
    );
  }
}
