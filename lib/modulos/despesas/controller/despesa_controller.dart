import 'package:app_ficha_tecnica/modulos/despesas/model/despesa.dart';
import 'package:get/get.dart';

class DespesaController extends GetxController {
  List<Despesa> despesaList = [
    Despesa(
        id: '1',
        title: 'Molho',
        price: 1,
        unidadeMedida: 'GRAMA',
        custoUnd: 1.00),
    Despesa(
        id: '2',
        title: 'Sacola',
        price: 0.7,
        unidadeMedida: 'UNIDADE',
        custoUnd: 0.7),
    Despesa(
        id: '3',
        title: 'Entrega',
        price: 3,
        unidadeMedida: 'UNIDADE',
        custoUnd: 3),
  ];
  String itemValue = '';

  void setItemValue(String value) {
    itemValue = value;
    update();
  }

  void addDespesa(Despesa insumo) {
    var id = DateTime.now().toString().trim();
    despesaList.add(Despesa(
        id: id,
        title: insumo.title,
        price: insumo.price,
        unidadeMedida: insumo.unidadeMedida,
        custoUnd: insumo.unidadeMedida == 'PORCENTAGEM'
            ? insumo.price / 100
            : insumo.price,
        custoInReceita: 0.0));

    update();
  }

  void remove(Despesa insumo) {
    if (insumo.id != null) {
      despesaList.removeWhere((element) => element.id == insumo.id);
    }
    update();
  }
}
