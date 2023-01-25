import 'package:app_ficha_tecnica/modulos/despesas/controller/despesa_controller.dart';
import 'package:app_ficha_tecnica/modulos/despesas/model/despesa.dart';
import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';
import 'package:get/get.dart';

class ReceitaController extends GetxController {
  final insumoController = Get.find<InsumoController>();
  final despesaController = Get.find<DespesaController>();

  List<Insumo> insumosReceitaList = [];
  List<Despesa> despesaReceitaList = [];

  Insumo? itemInsumoValue;
  Despesa? itemDespesaValue;

  // funções referente ao insumo

  Future<void> addIsumoForList({Insumo? insumo, double? quantidade = 1}) async {
    if (insumo != null) {
      insumosReceitaList.add(Insumo(
          id: insumo.id,
          title: insumo.title,
          price: insumo.price,
          unidadeMedida: insumo.unidadeMedida,
          custoInReceita: insumo.custoUnd! * quantidade!));
    }

    update();
  }

  void removeInsumoList(Insumo insumo) {
    if (insumo.id != null) {
      insumosReceitaList.removeWhere((element) => element.id == insumo.id);
    }
    update();
  }

  void setItemInsumoValue({Insumo? insumo}) {
    if (insumo != null) {
      itemInsumoValue = insumo;
    }
    update();
  }

  //funcções referente as despesas

  void addDespesaForList({Despesa? despesa, double? quantidade}){
    if (despesa != null) {
      despesaReceitaList.add(Despesa(
          id: despesa.id,
          title: despesa.title,
          price: despesa.price,
          unidadeMedida: despesa.unidadeMedida,
          custoInReceita: despesa.custoUnd! * quantidade!));
    }

    update();
  }

  void removeDespesaList(Despesa despesa) {
    if (despesa.id != null) {
      despesaReceitaList.removeWhere((element) => element.id == despesa.id);
    }
    update();
  }

  void setItemDespesaValue({Despesa? despesa}) {
    if (despesa != null) {
      itemDespesaValue = despesa;
    }
    update();
  }
}
