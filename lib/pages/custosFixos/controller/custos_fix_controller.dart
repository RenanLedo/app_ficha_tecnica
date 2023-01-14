import 'package:app_ficha_tecnica/models/custos_Fixos.dart';
import 'package:get/get.dart';

class CustosFixController extends GetxController {
  List<CustosFixos> custosFixosList = [];
  double totalCustosFix = 0;

  void addCustoFixo(CustosFixos custoFixo) {
    var id = DateTime.now().toString().trim();
    custosFixosList.add(CustosFixos(
      id: id,
      title: custoFixo.title,
      valor: custoFixo.valor,
    ));

    update();
  }

  double totalCustosFixos() {
    double total = 0;
    // totalCustosFix = 0;
    for (final custo in custosFixosList) {
      total += custo.valor;
      totalCustosFix = total;
    }
    update();
    return total;
  }
}
