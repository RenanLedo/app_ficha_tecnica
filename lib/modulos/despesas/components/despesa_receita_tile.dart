import 'package:app_ficha_tecnica/components/custom_icon.dart';
import 'package:app_ficha_tecnica/modulos/despesas/model/despesa.dart';
import 'package:app_ficha_tecnica/services/utils_services.dart';
import 'package:flutter/material.dart';

class DespesaReceitaTile extends StatelessWidget {
  Despesa despesa;
  VoidCallback onPress;

  DespesaReceitaTile({
    Key? key,
    required this.despesa,
    required this.onPress,
  }) : super(key: key);

  final utilServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 3),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromARGB(255, 68, 68, 68),
      ),
      child: Row(
        children: [
          Text(
            despesa.title,
            style: const TextStyle(fontSize: 17),
          ),
          const Text(' | '),
          Text(
            utilServices.priceToCurrency(despesa.custoInReceita!),
            style: const TextStyle(fontSize: 13),
          ),
          const SizedBox(
            width: 5,
          ),
          CustomIcon(
            onPress: onPress,
            radios: 50,
            backgrounColor: Colors.transparent,
            color: const Color.fromARGB(255, 250, 51, 51),
            icon: Icons.close_rounded,
            padding: 0,
          )
        ],
      ),
    );
  }
}
