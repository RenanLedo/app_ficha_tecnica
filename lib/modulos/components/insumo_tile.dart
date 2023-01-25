import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';
import 'package:flutter/material.dart';

class InsumoTile extends StatelessWidget {
  Insumo insumo;
  VoidCallback onPress;

  InsumoTile({
    Key? key,
    required this.insumo,
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
            insumo.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
              'Custo por grama ou unidade: R\$ ${insumo.custoUnd!.toStringAsFixed(2)}'),
          trailing: IconButton(
            onPressed: onPress,
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
