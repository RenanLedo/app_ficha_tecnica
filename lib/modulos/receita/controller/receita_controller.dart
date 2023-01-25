import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';
import 'package:get/get.dart';

class ReceitaController extends GetxController {
  final insumoController = Get.find<InsumoController>();
  List<Insumo> insumosReceitaList = [];

  Insumo? itemInsumoValue;

  Future<void> addIsumoForList({Insumo? insumo, double? quantidade = 1}) async {
    if (insumo != null) {
      insumosReceitaList.add(Insumo(
          title: insumo.title,
          price: insumo.price,
          unidadeMedida: insumo.unidadeMedida,
          custoInReceita: insumo.custoUnd! * quantidade!));
    }
    

    update();
  }

  void setItemInsumoValue({Insumo? insumo}) {
    if (insumo != null) {
      itemInsumoValue = insumo;
    }
    update();
  }
}
