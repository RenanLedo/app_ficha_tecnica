import 'package:app_ficha_tecnica/components/custom_icon.dart';
import 'package:flutter/material.dart';

import 'package:app_ficha_tecnica/modulos/despesas/model/despesa.dart';

class DespesaReceitaTile extends StatelessWidget {
  Despesa despesa;
  VoidCallback onPress;

  DespesaReceitaTile({
    Key? key,
    required this.despesa,
    required this.onPress,
  }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Container(
      padding: const EdgeInsets.only(left: 8, right: 3),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.blueGrey),
      child: Row(
        children: [
          Text(
            despesa.title,
            style: const TextStyle(fontSize: 17),
          ),
          const Text(' | '),
          Text(
            despesa.custoInReceita.toString(),
            style: const TextStyle(fontSize: 13),
          ),
          CustomIcon(
            onPress: onPress,
            radios: 50,
            backgrounColor: Colors.transparent,
            color: Colors.white,
            icon: Icons.close_rounded,
            padding: 0,
          )
        ],
      ),
    );
  }
}
