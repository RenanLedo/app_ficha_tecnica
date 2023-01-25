import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';
import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:get/get.dart';

class ReceitaController extends GetxController {
  final insumoController = Get.find<InsumoController>();
  List<Insumo> insumosReceitaList = [];
  Insumo? itemInsumoValue;

  void addIsumoForList({Insumo? insumo,  double? quantidade}) {
    if (insumo != null) {
      insumosReceitaList.add(Insumo(
          title: insumo.title,
          price: insumo.price,
          unidadeMedida: insumo.unidadeMedida,
          custoInReceita: insumo.custoUnd! * quantidade! ?? 1));
    }
    update();
  }

  void setItemInsumoValue({Insumo? insumo}) {
    if (insumo != null) {
      itemInsumoValue = insumo;
    //  itemInsumoValue = Insumo(title: insumo.title, price: insumo.price, unidadeMedida: insumo.unidadeMedida, custoInReceita: insumo.custoUnd! * quant!);
    }
    update();
  }

  // void setCustoInReceita(double custo, double quant){
  //   if(itemInsumoValue != null){
  //     itemInsumoValue?.custoInReceita = custo * quant;
  //   }
  // }
}
