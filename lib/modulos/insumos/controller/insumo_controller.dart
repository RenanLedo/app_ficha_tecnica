import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';
import 'package:get/get.dart';

class InsumoController extends GetxController {
  List<Insumo> insumosList = [
    Insumo(
        id: '1',
        title: 'Sal',
        price: 1,
        unidadeMedida: 'QUILOGRAMA',
        custoUnd: 0.01),
    Insumo(
        id: '2',
        title: 'Ovo',
        price: 0.7,
        unidadeMedida: 'UNIDADE',
        custoUnd: 0.7),
    Insumo(
        id: '3',
        title: 'Frango',
        price: 20,
        unidadeMedida: 'QUILOGRAMA',
        custoUnd: 2),
  ];

  List<Insumo> insumoListSeach = [];

  String itemValue = '';

  // RxString valueBusca = ''.obs;
  // List<Insumo> insumosListBusca = [];

  @override
  void onInit() {
    insumoListSeach = insumosList;
    super.onInit();
  }

  void setItemValue(String value) {
    itemValue = value;
    update();
  }

  void setListFiltered(String value) {
    insumoListSeach = insumosList
        .where((element) =>
            element.title.toUpperCase().contains(value.toUpperCase()))
        .toList();
    update();
  }

  void addInsumos(Insumo insumo) {
    var id = DateTime.now().toString().trim();
    insumosList.add(Insumo(
        id: id,
        title: insumo.title,
        price: insumo.price,
        unidadeMedida: insumo.unidadeMedida,
        custoUnd: insumo.unidadeMedida == 'QUILOGRAMA'
            ? insumo.price / 1000
            : insumo.price,
        custoInReceita: 0.0));

    update();
  }

  void remove(Insumo insumo) {
    if (insumo.id != null) {
      insumosList.removeWhere((element) => element.id == insumo.id);
      insumoListSeach = insumosList;
    }
    update();
  }
}
