import 'package:app_ficha_tecnica/modulos/despesas/model/despesa.dart';
import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';

class Receita {
  String? id;
  String title;
  List<Insumo> insumo;
  List<Despesa> despesa;
  double quantidadeInsumo;
  Receita({
    this.id,
    required this.title,
    required this.insumo,
    required this.quantidadeInsumo,
    required this.despesa,
  });
}
