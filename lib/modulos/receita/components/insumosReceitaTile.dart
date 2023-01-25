import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';
import 'package:flutter/material.dart';

class InsumosReceitaTile extends StatelessWidget {
  Insumo insumo;
  VoidCallback onPress;

  InsumosReceitaTile({
    Key? key,
    required this.insumo,
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
            insumo.title,
            style: const TextStyle(fontSize: 17),
          ),
          const Text(' | '),
          Text(
            insumo.custoInReceita.toString(),
            style: const TextStyle(fontSize: 13),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPress,
                child: const Icon(
                  Icons.close_rounded,
                  color: Color.fromARGB(255, 58, 58, 58),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
