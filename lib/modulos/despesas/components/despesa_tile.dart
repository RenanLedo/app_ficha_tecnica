import 'package:app_ficha_tecnica/modulos/despesas/model/despesa.dart';
import 'package:flutter/material.dart';

class DespesaTile extends StatelessWidget {
  Despesa despesa;
  VoidCallback onPress;

  DespesaTile({
    Key? key,
    required this.despesa,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text(
            despesa.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
              'Custo por grama ou unidade: R\$ ${despesa.custoUnd!.toStringAsFixed(2)}'),
          trailing: IconButton(
            onPressed: onPress,
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
