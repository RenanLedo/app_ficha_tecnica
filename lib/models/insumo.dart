class Insumo {
  String? id;
  String title;
  double price;
  String unidadeMedida;
  double? custoUnd;
  double? custoInReceita;

  Insumo({
    this.id,
    required this.title,
    required this.price,
     this.custoUnd,
     this.custoInReceita,
    required this.unidadeMedida,
  });
}
