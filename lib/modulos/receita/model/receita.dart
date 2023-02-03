import 'package:app_ficha_tecnica/modulos/despesas/model/despesa.dart';
import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';

class Receita {
  String? id;
  String title;
  List<Insumo>? insumo;
  List<Despesa>? despesa;
  double custoReceita;
  Receita({
    this.id,
    required this.title,
     this.insumo,
     this.despesa,
    required this.custoReceita,
  });
}
