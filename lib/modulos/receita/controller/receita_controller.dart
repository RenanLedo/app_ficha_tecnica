import 'package:app_ficha_tecnica/modulos/despesas/controller/despesa_controller.dart';
import 'package:app_ficha_tecnica/modulos/despesas/model/despesa.dart';
import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';
import 'package:app_ficha_tecnica/modulos/receita/model/receita.dart';
import 'package:get/get.dart';

class ReceitaController extends GetxController {
  final insumoController = Get.find<InsumoController>();
  final despesaController = Get.find<DespesaController>();

  List<Insumo> insumosReceitaList = [];
  List<Despesa> despesaReceitaList = [];
  List<Receita> receitaList = [];
  Receita? receitaAtual;
  double? custoReceitAtual;

  double? lucroReceita;
  double? margemLucroreceita;
  double? markupreceita;

  Insumo? itemInsumoValue;
  Despesa? itemDespesaValue;

  // funções referente ao insumo

  void addIsumoForList({Insumo? insumo, double? quantidade = 1}) {
    if (insumo != null) {
      insumosReceitaList.add(Insumo(
          id: insumo.id,
          title: insumo.title,
          price: insumo.price,
          unidadeMedida: insumo.unidadeMedida,
          custoInReceita: insumo.custoUnd! * quantidade!));
    }

    setSomarCustoReceitaAtual();

    update();
  }

  void removeInsumoList(Insumo insumo) {
    if (insumo.id != null) {
      insumosReceitaList.removeWhere((element) => element.id == insumo.id);
      // if (insumosReceitaList.isEmpty) {
      //   custoReceitAtual = 0;
      // }
      custoReceitAtual = custoReceitAtual! - insumo.custoInReceita!;
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

  void addDespesaForList({Despesa? despesa, double? quantidade}) {
    if (despesa != null) {
      despesaReceitaList.add(Despesa(
          id: despesa.id,
          title: despesa.title,
          price: despesa.price,
          unidadeMedida: despesa.unidadeMedida,
          custoInReceita: despesa.custoUnd! * quantidade!));
    }

    setSomarCustoReceitaAtual();

    update();
  }

  void removeDespesaList(Despesa despesa) {
    if (despesa.id != null) {
      despesaReceitaList.removeWhere((element) => element.id == despesa.id);
    }

    custoReceitAtual = custoReceitAtual! - despesa.custoInReceita!;

    update();
  }

  void setItemDespesaValue({Despesa? despesa}) {
    if (despesa != null) {
      itemDespesaValue = despesa;
    }
    update();
  }

  //funcç~ies para criar a receita

  double setSomarCustoReceitaAtual() {
    double somaInsumoReceita;
    num somaDespesaReceita;

    somaInsumoReceita = insumosReceitaList
            .map((e) => e.custoInReceita)
            .reduce((value, element) => value! + element!) ??
        0;

    if (despesaReceitaList.isEmpty) {
      somaDespesaReceita = 0;
    } else {
      somaDespesaReceita = despesaReceitaList
              .map((e) => e.custoInReceita)
              .reduce((value, element) => value! + element!) ??
          0;
    }

    // if (somaDespesaReceita.isEmpty) {
    //   somaDespesaReceita = 0.0;
    // } else {
    //   somaDespesaReceita.reduce((value, element) => value! + element!) ?? 0;
    // }

    custoReceitAtual = somaInsumoReceita + somaDespesaReceita;
    update();

    return somaInsumoReceita + somaDespesaReceita;
  }

  double calcularMarkup(double precoVenda) {
    if (precoVenda != null) {
      markupreceita = ((precoVenda - setSomarCustoReceitaAtual()) /
          setSomarCustoReceitaAtual());
      update();
      return ((precoVenda - setSomarCustoReceitaAtual()) /
          setSomarCustoReceitaAtual());
    } else {
      update();
      return 0;
    }
  }

  double calcularMargemLucro(double precoVenda) {
    if (precoVenda != null) {
      margemLucroreceita =
          ((precoVenda - setSomarCustoReceitaAtual()) / precoVenda);
      update();
      return ((precoVenda - setSomarCustoReceitaAtual()) / precoVenda);
    } else {
      update();
      return 0;
    }
  }

  double calcularLucro(double precoVenda) {
    if (precoVenda != null) {
      lucroReceita = precoVenda - setSomarCustoReceitaAtual();
      update();
      return precoVenda - setSomarCustoReceitaAtual();
    } else {
      update();
      return 0;
    }
  }

  void creatReceita(String title, double precoVenda) {
    // final somaInsumoReceita = insumosReceitaList
    //     .map((e) => e.custoInReceita)
    //     .reduce((value, element) => value! + element!);
    // final somaDespesaReceita = despesaReceitaList
    //     .map((e) => e.custoInReceita)
    //     .reduce((value, element) => value! + element!);
    var id = DateTime.now().toString().trim();

    receitaAtual = Receita(
      id: id,
      title: title,
      insumo: insumosReceitaList,
      despesa: despesaReceitaList,
      custoReceita: setSomarCustoReceitaAtual(),
      precoVenda: precoVenda,
      markup: calcularMarkup(precoVenda),
      margemLucro: calcularMargemLucro(precoVenda),
      lucro: precoVenda - setSomarCustoReceitaAtual(),
    );

    if (receitaAtual != null) {
      receitaList.add(receitaAtual!);
    }

    limparTudo();
    Get.back();
    update();
  }

  void limparTudo() {
    insumosReceitaList = [];
    despesaReceitaList = [];
    receitaAtual = null;
    custoReceitAtual = null;

    lucroReceita = null;
    markupreceita = null;
    margemLucroreceita = null;

    itemInsumoValue = null;
    itemDespesaValue = null;

    update();
  }
}
