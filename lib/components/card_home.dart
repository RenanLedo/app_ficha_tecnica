import 'package:app_ficha_tecnica/components/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardHome extends StatelessWidget {
  String icon;
  String title;
  double quantidade;
  String preQuantidade;
  VoidCallback onPress;

  CardHome({
    Key? key,
    required this.icon,
    required this.onPress,
    required this.preQuantidade,
    required this.quantidade,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      width: Get.width,
      // height: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          child: Row(
            children: [
              Image.asset(icon, width: 40, height: 40),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('$preQuantidade ${quantidade.toString()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Color.fromARGB(221, 49, 49, 49))),
                ],
              ),
              const Spacer(),
              CustomIcon(
                  onPress: () {},
                  radios: 0,
                  backgrounColor: Colors.transparent,
                  color: Colors.black87,
                  icon: Icons.arrow_forward_rounded,
                  padding: 0)
            ],
          ),
        ),
      ),
    );
  }
}
