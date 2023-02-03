import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';
import 'package:app_ficha_tecnica/services/utils_services.dart';
import 'package:flutter/material.dart';

class InsumoTile extends StatelessWidget {
  Insumo insumo;
  VoidCallback onPress;

  InsumoTile({
    Key? key,
    required this.insumo,
    required this.onPress,
  }) : super(key: key);

  final utilServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        insumo.title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      ),
      subtitle: Text(
          'Custo por grama ou unidade: ${utilServices.priceToCurrency(insumo.custoUnd!)}'),
      trailing: IconButton(
        onPressed: onPress,
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
