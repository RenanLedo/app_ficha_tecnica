
import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';

class Receita {
  String? id;
  String title;
  List<Insumo> insumo;
  double quantidadeInsumo;
  Receita({
    this.id,
    required this.title,
    required this.insumo,
    required this.quantidadeInsumo,
  });
}
