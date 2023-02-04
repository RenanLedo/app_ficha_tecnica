import 'package:app_ficha_tecnica/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardHome extends StatelessWidget {
  String icon;
  String title;
  int? quantidadeUnd;
  double? quantidadeRs;
  String preQuantidade;
  VoidCallback onPress;

  CardHome({
    Key? key,
    required this.icon,
    required this.onPress,
    required this.preQuantidade,
    this.quantidadeUnd,
    this.quantidadeRs,
    required this.title,
  }) : super(key: key);

  final utilService = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        width: Get.width,
        // height: 100,
        child: Card(
          color: const Color.fromARGB(255, 218, 218, 218),
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
                        color: Colors.black87,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(preQuantidade,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Color.fromARGB(221, 49, 49, 49))),
                        quantidadeUnd == null
                            ? Text(utilService.priceToCurrency(quantidadeRs!),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: Color.fromARGB(221, 49, 49, 49)))
                            : Text(quantidadeUnd.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: Color.fromARGB(221, 49, 49, 49))),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.black87,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
