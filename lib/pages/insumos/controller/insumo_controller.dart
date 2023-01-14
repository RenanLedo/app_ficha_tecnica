import 'package:app_ficha_tecnica/models/insumo.dart';
import 'package:get/get.dart';

class InsumoController extends GetxController {
  List<Insumo> insumosList = [];
  String itemValue = '';

  void setItemValue(String value) {
    itemValue = value;
    update();
  }

  void addInsumos(Insumo insumo) {
    var id = DateTime.now().toString().trim();
    insumosList.add(
      Insumo(
          id: id,
          title: insumo.title,
          price: insumo.price,
          unidadeMedida: insumo.unidadeMedida,
          custoUnd: insumo.unidadeMedida == 'QUILOGRAMA'
              ? insumo.price / 1000
              : insumo.price),
    );

    update();
  }

  void remove(Insumo insumo) {
    if (insumo.id != null) {
      insumosList.removeWhere((element) => element.id == insumo.id);
    }
    update();
  }
}
