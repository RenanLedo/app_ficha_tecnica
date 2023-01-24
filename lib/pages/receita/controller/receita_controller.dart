import 'package:app_ficha_tecnica/models/insumo.dart';
import 'package:app_ficha_tecnica/pages/insumos/controller/insumo_controller.dart';
import 'package:get/get.dart';

class ReceitaController extends GetxController {
  final insumoController = Get.find<InsumoController>();
  List<Insumo> insumosReceitaList = [];
  Insumo? itemInsumoValue;

  void addIsumoForList(Insumo? insumo) {
    if (insumo != null) {
      insumosReceitaList.add(insumo);
    }
    update();
  }

  void setItemInsumoValue(Insumo? insumo) {
    itemInsumoValue = insumo;
    update();
  }
}
